/**
 * VisualDeb - Integrated Packaging Environment for Debian
 * Copyright (C) 2010  Markus Schulz
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Author:
 * 	Markus Schulz <schulz@alpharesearch.de>
 **/

using Config;
using GLib;
using Gtk;
using VisualDebFiles;

public class TextFileViewer : Window {

	private TextView text_view;
	static string basedir;
	static bool version;

	const OptionEntry[] options = {
		{ "basedir", 'b', 0, OptionArg.FILENAME, ref basedir, "Base source directory", "DIRECTORY" },
		{ "version", 0, 0, OptionArg.NONE, ref version, "Display version number", null },
		{ null }
	};

	public TextFileViewer () {
		this.title = "VisualDeb - Integrated Packaging Environment for Debian";
		this.position = WindowPosition.CENTER;
		set_default_size (400, 300);

		var toolbar = new Toolbar ();
		var open_button = new ToolButton.from_stock (STOCK_OPEN);
		open_button.is_important = true;
		toolbar.add (open_button);
		open_button.clicked.connect (on_open_clicked);

		this.text_view = new TextView ();
		this.text_view.editable = false;
		this.text_view.cursor_visible = false;

		var scroll = new ScrolledWindow (null, null);
		scroll.set_policy (PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
		scroll.add (this.text_view);

		var vbox = new VBox (false, 0);
		vbox.pack_start (toolbar, false, true, 0);
		vbox.pack_start (scroll, true, true, 0);
		add (vbox);
	}

	private void on_open_clicked () {
		var file_chooser = new FileChooserDialog ("Open File", this,
									  FileChooserAction.OPEN,
									  STOCK_CANCEL, ResponseType.CANCEL,
									  STOCK_OPEN, ResponseType.ACCEPT, null);
		if (file_chooser.run () == ResponseType.ACCEPT) {
			open_file (file_chooser.get_filename ());
		}
		file_chooser.destroy ();
	}

	private void open_file (string filename) {
		try {
			string text;
			FileUtils.get_contents (filename, out text, null);
			this.text_view.buffer.text = text;
		} catch (Error e) {
			stderr.printf ("Error: %s\n", e.message);
		}
	}

	public static int main (string[] args) {
		try {
			var opt_context = new OptionContext ("- VisualDeb");
			opt_context.set_help_enabled (true);
			opt_context.add_main_entries (options, null);
			opt_context.parse (ref args);
		} catch (OptionError e) {
			stdout.printf ("%s\n", e.message);
			stdout.printf ("Run '%s --help' to see a full list of available command line options.\n", args[0]);
			return 1;
		}

		if (version) {
			stdout.printf ("VisualDeb %s\n", Config.PACKAGE_VERSION);
			stdout.printf ("\n\nCopyright (C) 2010\n");
			stdout.printf ("This is free software; see the source for copying conditions.  There is NO\n");
			stdout.printf ("warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n\n");
			stdout.printf ("Written by Markus Schulz <schulz@alpharesearch.de>\n");
			return 0;
		}
		Gtk.init (ref args);

		var registrar = new PluginRegistrar<DebianFiles> ("libcopyright");
		registrar.load ();

		var plugin = registrar.new_object ();
		plugin.Test_Function ();

		var sample1 = new ProjectTreeView ();


		try {
			//var myproject = new Project ();
			var builder = new Builder ();
			builder.add_from_file ("visualdeb.glade");
			//builder.connect_signals (null);

			var object = new Foo.MyBar ();
			builder.connect_signals (object);

			var window = builder.get_object ("window") as Window;
			
			var treeview1 = builder.get_object ("treeview1") as TreeView;
			treeview1.set_model (sample1.Store);
			treeview1.insert_column_with_attributes (-1, "Product", new CellRendererText (), "text", 0, null);
			treeview1.insert_column_with_attributes (-1, "Price", new CellRendererText (), "text", 1, null);
			treeview1.expand_all ();

			window.show_all ();
			Gtk.main ();
			} catch (Error e) {
			stderr.printf ("Could not load UI: %s\n", e.message);
			return 1;
		}
		return 0;
	}
}

public class ProjectTreeView {

	public TreeStore Store;
	
	public ProjectTreeView () {
		setup_treeview ();
	}

	private void setup_treeview () {
		var store = new TreeStore (2, typeof (string), typeof (string));
		TreeIter root;
		TreeIter category_iter;
		TreeIter product_iter;
		
		store.append (out root, null);
		store.set (root, 0, "All Products", -1);

		store.append (out category_iter, root);
		store.set (category_iter, 0, "Books", -1);

		store.append (out product_iter, category_iter);
		store.set (product_iter, 0, "Moby Dick", 1, "$10.36", -1);
		store.append (out product_iter, category_iter);
		store.set (product_iter, 0, "Heart of Darkness", 1, "$4.99", -1);
		store.append (out product_iter, category_iter);
		store.set (product_iter, 0, "Ulysses", 1, "$26.09", -1);
		store.append (out product_iter, category_iter);
		store.set (product_iter, 0, "Effective Vala", 1, "$38.99", -1);

		store.append (out category_iter, root);
		store.set (category_iter, 0, "Films", -1);

		store.append (out product_iter, category_iter);
		store.set (product_iter, 0, "Amores Perros", 1, "$7.99", -1);
		store.append (out product_iter, category_iter);
		store.set (product_iter, 0, "Twin Peaks", 1, "$14.99", -1);
		store.append (out product_iter, category_iter);
		store.set (product_iter, 0, "Vertigo", 1, "$20.49", -1);
		Store = store;
	}
}

