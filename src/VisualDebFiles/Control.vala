/**
 * VisualDeb - Integrated Packaging Environment for Debian
 * VisualDebFiles/Control.vala - Copyright (C) 2010  Markus Schulz
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
 * This file was generated on Mon Aug 9 2010 at 20:16:25
 *
 * Author:
 * 	Markus Schulz <schulz@alpharesearch.de>
 **/

using GLib;
using VisualDebUtilities;

namespace VisualDebFiles
{

	public class Control : DebianFiles
	{
		public override bool Test_Function ()
		{
			stdout.printf ("VisualDebFiles.Control TEST OK\n");
			return true;
		}
		
		public DebianDocu DebianDocuUsed
		{
			get
			{
				return m_DebianDocuUsed;
			}
			set
			{
				m_DebianDocuUsed = value;
			}
		}
		private DebianDocu m_DebianDocuUsed;
	}

}  // end of namespace VisualDebFiles

//[ModuleInit]
public Type register_plugin (TypeModule module) {
    // types are registered automatically
    return typeof (VisualDebFiles.Control);
}
