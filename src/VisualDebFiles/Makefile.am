NULL =

AM_CPPFLAGS = \
	$(GLIB_CFLAGS) \
	$(GTK_CFLAGS) \
	$(GOOCANVAS_CFLAGS) \
	$(NULL)

BUILT_SOURCES = DebianFiles.vala.stamp

lib_LTLIBRARIES = \
	libcontrol.la \
	libdebianfiles.la \
	$(NULL)

libcontrol_la_SOURCES = \
	../VisualDebFiles/Control.vala \
	DebianFiles.vapi \
	$(NULL)
	
libcontrol_la_LDFLAGS = \
	-shared \
	-fPIC \
	$(NULL)

libcontrol_la_VALAFLAGS = \
	$(NULL)

libcontrol_la_LIBADD = \
	$(GLIB_LIBS) \
	$(GTK_LIBS) \
	$(GOOCANVAS_LIBS) \
	$(NULL)

libdebianfiles_la_VALASOURCES = \
	../VisualDebFiles/DebianFiles.vala \
	$(NULL)

libdebianfiles_la_SOURCES = \
	DebianFiles.vala.stamp \
	$(libdebianfiles_la_VALASOURCES:.vala=.c) \
	$(NULL)
	
DebianFiles.vapi DebianFiles.vala.stamp: $(libdebianfiles_la_VALASOURCES)
	$(VALA_V)$(VALAC) $(COVERAGE_VALAFLAGS) $(VALAFLAGS) -C -H DebianFiles.h --library DebianFiles $^
	@touch $@
	
MAINTAINERCLEANFILES = \
	DebianFiles.vapi \
	$(NULL)
