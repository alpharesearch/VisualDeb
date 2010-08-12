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

void add_plugin_tests ()
{
  Test.add_func ("/VisualDebFiles/Copyright", () => {
		var registrar = new PluginRegistrar<DebianFiles> ("libcopyright");
		registrar.load ();
		var plugin = registrar.new_object ();
		bool testfunc =  plugin.Test_Function ();
		assert (testfunc);
		}
	);
  Test.add_func ("/VisualDebFiles/Control", () => {
		var registrar = new PluginRegistrar<DebianFiles> ("libcontrol");
		registrar.load ();
		var plugin = registrar.new_object ();
		bool testfunc = plugin.Test_Function ();
		assert (testfunc);
		}
	);
  Test.add_func ("/VisualDebFiles/Conffiles", () => {
		var registrar = new PluginRegistrar<DebianFiles> ("libconffiles");
		registrar.load ();
		var plugin = registrar.new_object ();
		bool testfunc = plugin.Test_Function ();
		assert (testfunc);
		}
	);
}
 
int main (string[] args)
{
	Test.init(ref args);
	add_plugin_tests ();
	Test.run ();
	return 0;
}
