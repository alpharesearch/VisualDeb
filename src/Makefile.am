NULL =

AM_CPPFLAGS =							\
	$(GLIB_CFLAGS)					\
	$(GTK_CFLAGS)				\
	$(GOOCANVAS_CFLAGS)					\
	$(NULL)

bin_PROGRAMS = visualdeb

visualdeb_SOURCES = visualdeb.vala

visualdeb_LDFLAGS = -export-dynamic

visualdeb_VALAFLAGS = --pkg gtk+-2.0

visualdeb_LDADD =		\
	$(GLIB_LIBS)			\
	$(GTK_LIBS)		\
	$(GOOCANVAS_LIBS)		\
	$(NULL)
