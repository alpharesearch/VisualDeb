NULL =

AM_CPPFLAGS = \
	$(GLIB_CFLAGS) \
	$(GTK_CFLAGS) \
	$(GOOCANVAS_CFLAGS) \
	-I $(top_srcdir)/src/VisualDebFiles/ \
	-I $(top_srcdir)/src/ \
	$(NULL)

check_PROGRAMS = \
	test_visualdeb \
	$(NULL)

test_visualdeb_SOURCES = \
	test_visualdeb.vala \
	$(top_srcdir)/src/PluginRegistrar.vala \
	$(top_srcdir)/src/VisualDebFiles/DebianFiles.vapi \
	$(NULL)

test_visualdeb_VALAFLAGS = \
	--vapidir $(srcdir)/../vapi --pkg config \
	--pkg gtk+-2.0 \
	--pkg gobject-2.0 \
	--pkg gmodule-2.0 \
	$(NULL)

test_visualdeb_LDFLAGS = \
	$(GLIB_CFLAGS) \
	$(GTK_CFLAGS) \
	$(GOOCANVAS_CFLAGS) \
	-I. \
	-I.. \
	$(top_srcdir)/src/VisualDebFiles/DebianFiles.c \
	-Wl,--export-dynamic \
	$(NULL)

test_visualdeb_LDADD = \
	$(GLIB_LIBS) \
	$(GTK_LIBS) \
	$(GOOCANVAS_LIBS) \
	$(NULL)

TESTS_ENVIRONMENT = gtester -k 
TESTS = \
	$(check_PROGRAMS)\
	$(NULL)
