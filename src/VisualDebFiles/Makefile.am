NULL =

AM_CPPFLAGS = \
	$(GLIB_CFLAGS) \
	$(GTK_CFLAGS) \
	$(GOOCANVAS_CFLAGS) \
	$(NULL)

BUILT_SOURCES = DebianFiles.vapi

controlincludedir = $(includedir)

controlinclude_HEADERS = \
	DebianFiles.h \
	$(NULL)
	
DebianFiles.vapi : $(libdebianfiles_la_VALASOURCES)
	$(VALA_V)$(VALAC) $(COVERAGE_VALAFLAGS) $(VALAFLAGS) -C -H DebianFiles.h --library DebianFiles DebianFiles.vala$^
	@touch $@

EXTRA_DIST = \
	 DebianFiles.c \
	$(NULL)
	
CLEANFILES = \
	DebianFiles.h \
	DebianFiles.c \
	DebianFiles.vapi \
	$(NULL)
	
MAINTAINERCLEANFILES = \
	*.h \
	*.c \
	*.vapi \
	*.stamp \
	$(NULL)
	
lib_LTLIBRARIES = \
	libcontrol.la \
	libcopyright.la \
	$(NULL)
	
libcontrol_la_SOURCES = \
	Control.vala \
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
	
libcopyright_la_SOURCES = \
	Copyright.vala \
	DebianFiles.vapi \
	$(NULL)

libcopyright_la_LDFLAGS = \
	-shared \
	-fPIC \
	$(NULL)

libcopyright_la_VALAFLAGS = \
	$(NULL)

libcopyright_la_LIBADD = \
	$(GLIB_LIBS) \
	$(GTK_LIBS) \
	$(GOOCANVAS_LIBS) \
	$(NULL)
	
