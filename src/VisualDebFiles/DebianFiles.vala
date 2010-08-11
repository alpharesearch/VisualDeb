/**
 * VisualDeb - Integrated Packaging Environment for Debian
 * VisualDebFiles/DebianFiles.vala - Copyright (C) 2010  Markus Schulz
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

//using VisualDebUtilities;

namespace VisualDebFiles
{

	public class DebianFiles : Object
	{

		//region Compositions
/*
		public DebianDocu DenianDocuUsed
		{
			get
			{
				return m_DenianDocuUsed;
			}
			set
			{
				m_DenianDocuUsed = value;
			}
		}
		private DebianDocu m_DenianDocuUsed;
*/
		//endregion
		
		public virtual bool Test_Function ()
		{
			stdout.printf ("VisualDebFiles.DebianFiles TEST OK\n");
			return true;
		}

	}

}  // end of namespace VisualDebFiles

