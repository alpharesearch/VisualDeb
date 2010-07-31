NULL =

AM_CPPFLAGS = \
	$(GLIB_CFLAGS) \
	$(GTK_CFLAGS) \
	$(GOOCANVAS_CFLAGS) \
	$(NULL)

bin_PROGRAMS = \
	visualdeb \
	$(NULL)

visualdeb_SOURCES = \
	visualdeb.vala \
	$(NULL)
	
visualdeb_LDFLAGS = \
	-export-dynamic \
	$(NULL)

visualdeb_VALAFLAGS = \
	--vapidir $(srcdir)/../vapi --pkg config \
	--pkg gtk+-2.0 \
	--pkg gobject-2.0 \
	$(NULL)

visualdeb_LDADD = \
	$(GLIB_LIBS) \
	$(GTK_LIBS) \
	$(GOOCANVAS_LIBS) \
	$(NULL)

if HAVE_HELP2MAN
dist_man_MANS = visualdeb.1
endif

visualdeb.1:	visualdeb.c $(top_srcdir)/configure.ac
				$(MAKE) $(AM_MAKEFLAGS) visualdeb$(EXEEXT)
				help2man --no-info --name="Integrated Packaging Environment for Debian" --output=visualdeb.1 ./visualdeb$(EXEEXT)
