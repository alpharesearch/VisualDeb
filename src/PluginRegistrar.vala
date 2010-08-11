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

using GLib;
using VisualDebFiles;


public class PluginRegistrar<T> : TypeModule {

	public string path { get; private set; }

	private Type type;
	private Module module;
	private bool loaded = false;

	private delegate Type RegisterPluginFunction (TypeModule m);

	public PluginRegistrar (string name) {
		assert (Module.supported ());
		this.path = Module.build_path ("/home/markus/VisualDeb/src/VisualDebFiles/.libs", name);
	}

	public override bool load () {
		stdout.printf ("Loading plugin with path: '%s'\n", path);
		if (loaded)
			return true;

		module = Module.open (path, ModuleFlags.BIND_LAZY);
		if (module == null) {
			return false;
		}

		stdout.printf ("Loaded module: '%s'\n", module.name ());

		void* function;
		module.symbol ("register_plugin", out function);
		RegisterPluginFunction register_plugin = (RegisterPluginFunction) function;

		type = register_plugin (this);
		stdout.printf ("Plugin type: %s\n\n", type.name ());
		loaded = true;
		return true;
	}
	public override void unload () {
		stdout.printf ("Should be unloading plugin with path '%s'\n", path);
	}

	public T new_object () {
		return Object.new (type);
	}
}
