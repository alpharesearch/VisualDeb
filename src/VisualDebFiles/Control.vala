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


namespace VisualDebFiles
{

	public class Control : DebianFiles
	{

		//region Attributes

		public string Source
		{
			get
			{
				return m_Source;
			}
			set
			{
				m_Source = value;
			}
		}
		private string m_Source;


		public string Section
		{
			get
			{
				return m_Section;
			}
			set
			{
				m_Section = value;
			}
		}
		private string m_Section;


		public string Priority
		{
			get
			{
				return m_Priority;
			}
			set
			{
				m_Priority = value;
			}
		}
		private string m_Priority;


		public string Maintainer
		{
			get
			{
				return m_Maintainer;
			}
			set
			{
				m_Maintainer = value;
			}
		}
		private string m_Maintainer;


		public string BuildDepends
		{
			get
			{
				return m_BuildDepends;
			}
			set
			{
				m_BuildDepends = value;
			}
		}
		private string m_BuildDepends;


		public string StandardsVersion
		{
			get
			{
				return m_StandardsVersion;
			}
			set
			{
				m_StandardsVersion = value;
			}
		}
		private string m_StandardsVersion;


		public string Homepage
		{
			get
			{
				return m_Homepage;
			}
			set
			{
				m_Homepage = value;
			}
		}
		private string m_Homepage;


		public string Package
		{
			get
			{
				return m_Package;
			}
			set
			{
				m_Package = value;
			}
		}
		private string m_Package;


		public string Architecture
		{
			get
			{
				return m_Architecture;
			}
			set
			{
				m_Architecture = value;
			}
		}
		private string m_Architecture;


		public string Depends
		{
			get
			{
				return m_Depends;
			}
			set
			{
				m_Depends = value;
			}
		}
		private string m_Depends;


		public string Description
		{
			get
			{
				return m_Description;
			}
			set
			{
				m_Description = value;
			}
		}
		private string m_Description;


		public string LongDescription
		{
			get
			{
				return m_LongDescription;
			}
			set
			{
				m_LongDescription = value;
			}
		}
		private string m_LongDescription;


		public string Uploaders
		{
			get
			{
				return m_Uploaders;
			}
			set
			{
				m_Uploaders = value;
			}
		}
		private string m_Uploaders;



		//endregion
		public override void hello ()
		{
			stdout.printf ("Hello override world!\n");
		}

	}

}  // end of namespace VisualDebFiles

[ModuleInit]
public Type register_plugin (TypeModule module) {
    // types are registered automatically
    return typeof (VisualDebFiles.Control);
}
