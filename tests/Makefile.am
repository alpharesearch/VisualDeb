NULL =

AM_CPPFLAGS = \
	$(GLIB_CFLAGS) \
	$(GTK_CFLAGS) \
	$(GOOCANVAS_CFLAGS) \
	$(NULL)

check_PROGRAMS = \
	test_visualdeb \
	$(NULL)

test_visualdeb_SOURCES = \
	test_visualdeb.vala \
	$(NULL)

test_visualdeb_VALAFLAGS = \
	--vapidir $(srcdir)/../vapi --pkg config \
	--pkg gtk+-2.0 \
	--pkg gobject-2.0 \
	$(NULL)

test_visualdeb_LDADD = \
	$(GLIB_LIBS) \
	$(GTK_LIBS) \
	$(GOOCANVAS_LIBS) \
	$(NULL)

TESTS = \
	$(check_PROGRAMS) \
	$(NULL)
