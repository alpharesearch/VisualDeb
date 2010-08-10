NULL =

AM_CPPFLAGS = \
	$(GLIB_CFLAGS) \
	$(GTK_CFLAGS) \
	$(GOOCANVAS_CFLAGS) \
	../VisualDebUtilities/ \
	$(NULL)

lib_LTLIBRARIES = \
	libcontrol-1.0.la \
	$(NULL)

libcontrol_1_0_la_SOURCES = \
	../VisualDebFiles/Control.vala \
	../VisualDebFiles/DebianFiles.vala \
	../VisualDebUtilities/DebianDocu.vala \
	$(NULL)
	
libcontrol_1_0_la_LDFLAGS = \
	-export-dynamic \
	$(NULL)

libcontrol_1_0_la_VALAFLAGS = \
	--vapidir $(srcdir)/../../vapi --pkg config \
	--pkg gtk+-2.0 \
	--pkg gobject-2.0 \
	$(NULL)

libcontrol_1_0_la_LIBADD = \
	$(GLIB_LIBS) \
	$(GTK_LIBS) \
	$(GOOCANVAS_LIBS) \
	$(NULL)
