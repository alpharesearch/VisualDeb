
#include <glib.h>
#include <glib-object.h>
#include <gtk/gtk.h>
#include <stdlib.h>
#include <string.h>
#include <glib/gstdio.h>
#include <stdio.h>


#define TYPE_TEXT_FILE_VIEWER (text_file_viewer_get_type ())
#define TEXT_FILE_VIEWER(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), TYPE_TEXT_FILE_VIEWER, TextFileViewer))
#define TEXT_FILE_VIEWER_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), TYPE_TEXT_FILE_VIEWER, TextFileViewerClass))
#define IS_TEXT_FILE_VIEWER(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), TYPE_TEXT_FILE_VIEWER))
#define IS_TEXT_FILE_VIEWER_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), TYPE_TEXT_FILE_VIEWER))
#define TEXT_FILE_VIEWER_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), TYPE_TEXT_FILE_VIEWER, TextFileViewerClass))

typedef struct _TextFileViewer TextFileViewer;
typedef struct _TextFileViewerClass TextFileViewerClass;
typedef struct _TextFileViewerPrivate TextFileViewerPrivate;
#define _g_object_unref0(var) ((var == NULL) ? NULL : (var = (g_object_unref (var), NULL)))
#define _g_free0(var) (var = (g_free (var), NULL))
#define _g_error_free0(var) ((var == NULL) ? NULL : (var = (g_error_free (var), NULL)))

struct _TextFileViewer {
	GtkWindow parent_instance;
	TextFileViewerPrivate * priv;
};

struct _TextFileViewerClass {
	GtkWindowClass parent_class;
};

struct _TextFileViewerPrivate {
	GtkTextView* text_view;
};


static gpointer text_file_viewer_parent_class = NULL;

GType text_file_viewer_get_type (void);
#define TEXT_FILE_VIEWER_GET_PRIVATE(o) (G_TYPE_INSTANCE_GET_PRIVATE ((o), TYPE_TEXT_FILE_VIEWER, TextFileViewerPrivate))
enum  {
	TEXT_FILE_VIEWER_DUMMY_PROPERTY
};
static void text_file_viewer_on_open_clicked (TextFileViewer* self);
static void _text_file_viewer_on_open_clicked_gtk_tool_button_clicked (GtkToolButton* _sender, gpointer self);
TextFileViewer* text_file_viewer_new (void);
TextFileViewer* text_file_viewer_construct (GType object_type);
static void text_file_viewer_open_file (TextFileViewer* self, const char* filename);
static void _gtk_main_quit_gtk_object_destroy (GtkObject* _sender, gpointer self);
gint text_file_viewer_main (char** args, int args_length1);
static void text_file_viewer_finalize (GObject* obj);



static void _text_file_viewer_on_open_clicked_gtk_tool_button_clicked (GtkToolButton* _sender, gpointer self) {
	text_file_viewer_on_open_clicked (self);
}


TextFileViewer* text_file_viewer_construct (GType object_type) {
	TextFileViewer * self;
	GtkToolbar* toolbar;
	GtkToolButton* open_button;
	GtkTextView* _tmp0_;
	GtkScrolledWindow* scroll;
	GtkVBox* vbox;
	self = g_object_newv (object_type, 0, NULL);
	gtk_window_set_title ((GtkWindow*) self, "Text File Viewer");
	((GtkWindow*) self)->position = (guint) GTK_WIN_POS_CENTER;
	gtk_window_set_default_size ((GtkWindow*) self, 400, 300);
	toolbar = g_object_ref_sink ((GtkToolbar*) gtk_toolbar_new ());
	open_button = g_object_ref_sink ((GtkToolButton*) gtk_tool_button_new_from_stock (GTK_STOCK_OPEN));
	gtk_tool_item_set_is_important ((GtkToolItem*) open_button, TRUE);
	gtk_container_add ((GtkContainer*) toolbar, (GtkWidget*) open_button);
	g_signal_connect_object (open_button, "clicked", (GCallback) _text_file_viewer_on_open_clicked_gtk_tool_button_clicked, self, 0);
	self->priv->text_view = (_tmp0_ = g_object_ref_sink ((GtkTextView*) gtk_text_view_new ()), _g_object_unref0 (self->priv->text_view), _tmp0_);
	gtk_text_view_set_editable (self->priv->text_view, FALSE);
	gtk_text_view_set_cursor_visible (self->priv->text_view, FALSE);
	scroll = g_object_ref_sink ((GtkScrolledWindow*) gtk_scrolled_window_new (NULL, NULL));
	gtk_scrolled_window_set_policy (scroll, GTK_POLICY_AUTOMATIC, GTK_POLICY_AUTOMATIC);
	gtk_container_add ((GtkContainer*) scroll, (GtkWidget*) self->priv->text_view);
	vbox = g_object_ref_sink ((GtkVBox*) gtk_vbox_new (FALSE, 0));
	gtk_box_pack_start ((GtkBox*) vbox, (GtkWidget*) toolbar, FALSE, TRUE, (guint) 0);
	gtk_box_pack_start ((GtkBox*) vbox, (GtkWidget*) scroll, TRUE, TRUE, (guint) 0);
	gtk_container_add ((GtkContainer*) self, (GtkWidget*) vbox);
	_g_object_unref0 (toolbar);
	_g_object_unref0 (open_button);
	_g_object_unref0 (scroll);
	_g_object_unref0 (vbox);
	return self;
}


TextFileViewer* text_file_viewer_new (void) {
	return text_file_viewer_construct (TYPE_TEXT_FILE_VIEWER);
}


static void text_file_viewer_on_open_clicked (TextFileViewer* self) {
	GtkFileChooserDialog* file_chooser;
	g_return_if_fail (self != NULL);
	file_chooser = g_object_ref_sink ((GtkFileChooserDialog*) gtk_file_chooser_dialog_new ("Open File", (GtkWindow*) self, GTK_FILE_CHOOSER_ACTION_OPEN, GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL, GTK_STOCK_OPEN, GTK_RESPONSE_ACCEPT, NULL, NULL));
	if (gtk_dialog_run ((GtkDialog*) file_chooser) == GTK_RESPONSE_ACCEPT) {
		char* _tmp0_;
		text_file_viewer_open_file (self, _tmp0_ = gtk_file_chooser_get_filename ((GtkFileChooser*) file_chooser));
		_g_free0 (_tmp0_);
	}
	gtk_object_destroy ((GtkObject*) file_chooser);
	_g_object_unref0 (file_chooser);
}


static void text_file_viewer_open_file (TextFileViewer* self, const char* filename) {
	GError * _inner_error_;
	g_return_if_fail (self != NULL);
	g_return_if_fail (filename != NULL);
	_inner_error_ = NULL;
	{
		char* text;
		char* _tmp2_;
		gboolean _tmp1_;
		char* _tmp0_;
		text = NULL;
		_tmp0_ = NULL;
		_tmp1_ = g_file_get_contents (filename, &_tmp0_, NULL, &_inner_error_);
		text = (_tmp2_ = _tmp0_, _g_free0 (text), _tmp2_);
		_tmp1_;
		if (_inner_error_ != NULL) {
			_g_free0 (text);
			goto __catch0_g_error;
			goto __finally0;
		}
		g_object_set (gtk_text_view_get_buffer (self->priv->text_view), "text", text, NULL);
		_g_free0 (text);
	}
	goto __finally0;
	__catch0_g_error:
	{
		GError * e;
		e = _inner_error_;
		_inner_error_ = NULL;
		{
			fprintf (stderr, "Error: %s\n", e->message);
			_g_error_free0 (e);
		}
	}
	__finally0:
	if (_inner_error_ != NULL) {
		g_critical ("file %s: line %d: uncaught error: %s", __FILE__, __LINE__, _inner_error_->message);
		g_clear_error (&_inner_error_);
		return;
	}
}


static void _gtk_main_quit_gtk_object_destroy (GtkObject* _sender, gpointer self) {
	gtk_main_quit ();
}


gint text_file_viewer_main (char** args, int args_length1) {
	gint result;
	TextFileViewer* window;
	gtk_init (&args_length1, &args);
	window = g_object_ref_sink (text_file_viewer_new ());
	g_signal_connect ((GtkObject*) window, "destroy", (GCallback) _gtk_main_quit_gtk_object_destroy, NULL);
	gtk_widget_show_all ((GtkWidget*) window);
	gtk_main ();
	result = 0;
	_g_object_unref0 (window);
	return result;
}


int main (int argc, char ** argv) {
	g_type_init ();
	return text_file_viewer_main (argv, argc);
}


static void text_file_viewer_class_init (TextFileViewerClass * klass) {
	text_file_viewer_parent_class = g_type_class_peek_parent (klass);
	g_type_class_add_private (klass, sizeof (TextFileViewerPrivate));
	G_OBJECT_CLASS (klass)->finalize = text_file_viewer_finalize;
}


static void text_file_viewer_instance_init (TextFileViewer * self) {
	self->priv = TEXT_FILE_VIEWER_GET_PRIVATE (self);
}


static void text_file_viewer_finalize (GObject* obj) {
	TextFileViewer * self;
	self = TEXT_FILE_VIEWER (obj);
	_g_object_unref0 (self->priv->text_view);
	G_OBJECT_CLASS (text_file_viewer_parent_class)->finalize (obj);
}


GType text_file_viewer_get_type (void) {
	static GType text_file_viewer_type_id = 0;
	if (text_file_viewer_type_id == 0) {
		static const GTypeInfo g_define_type_info = { sizeof (TextFileViewerClass), (GBaseInitFunc) NULL, (GBaseFinalizeFunc) NULL, (GClassInitFunc) text_file_viewer_class_init, (GClassFinalizeFunc) NULL, NULL, sizeof (TextFileViewer), 0, (GInstanceInitFunc) text_file_viewer_instance_init, NULL };
		text_file_viewer_type_id = g_type_register_static (GTK_TYPE_WINDOW, "TextFileViewer", &g_define_type_info, 0);
	}
	return text_file_viewer_type_id;
}




