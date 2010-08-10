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
	signals.vala \
	./VisualDeb/Environment.vala \
	./VisualDeb/Project.vala \
	./VisualDebFiles/Changelog.vala \
	./VisualDebFiles/Control.vala \
	./VisualDebFiles/Dirs.vala \
	./VisualDebFiles/ManFiles.vala \
	./VisualDebFiles/ReadmeDebian.vala \
	./VisualDebFiles/Watch.vala \
	./VisualDebFiles/Compat.vala \
	./VisualDebFiles/Copyright.vala \
	./VisualDebFiles/DebianFiles.vala \
	./VisualDebFiles/DocBase.vala \
	./VisualDebFiles/Menu.vala \
	./VisualDebFiles/Rules.vala \
	./VisualDebFiles/Conffiles.vala \
	./VisualDebFiles/CronFiles.vala \
	./VisualDebFiles/DhxFiles.vala \
	./VisualDebFiles/File.vala \
	./VisualDebFiles/PackageManpages.vala \
	./VisualDebFiles/SourceFormat.vala \
	./VisualDebTools/Dch.vala \
	./VisualDebTools/Debuild.vala \
	./VisualDebTools/DpkgBuildpackage.vala \
	./VisualDebTools/Dput.vala \
	./VisualDebTools/FileCopy.vala \
	./VisualDebTools/FileStuff.vala \
	./VisualDebTools/Pbuilder.vala \
	./VisualDebTools/Quilt.vala \
	./VisualDebTools/DebianTools.vala \
	./VisualDebTools/DhMake.vala \
	./VisualDebTools/Dpkg.vala \
	./VisualDebTools/Dupload.vala \
	./VisualDebTools/FileRename.vala \
	./VisualDebTools/Lintian.vala \
	./VisualDebTools/PkgConfig.vala \
	./VisualDebTools/Tar.vala \
	./VisualDebUtilities/DebianDocu.vala \
	./VisualDebUtilities/FileHandling.vala \
	./VisualDebUtilities/MaintainerGuide.vala \
	./VisualDebUtilities/ManPages.vala \
	./VisualDebUtilities/Policy.vala \
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
