/**
 * VisualDeb - Integrated Packaging Environment for Debian
 * VisualDeb/Environment.vala - Copyright (C) 2010  Markus Schulz
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


namespace VisualDeb
{

	public class Environment : Object
	{

		//region Attributes

		public string DEBEMAIL
		{
			get
			{
				return m_DEBEMAIL;
			}
			set
			{
				m_DEBEMAIL = value;
			}
		}
		private string m_DEBEMAIL;


		public string DEBFULLNAME
		{
			get
			{
				return m_DEBFULLNAME;
			}
			set
			{
				m_DEBFULLNAME = value;
			}
		}
		private string m_DEBFULLNAME;


		public string DEBSIGN_KEYID
		{
			get
			{
				return m_DEBSIGN_KEYID;
			}
			set
			{
				m_DEBSIGN_KEYID = value;
			}
		}
		private string m_DEBSIGN_KEYID;


		public string DEBUILD_LINTIAN
		{
			get
			{
				return m_DEBUILD_LINTIAN;
			}
			set
			{
				m_DEBUILD_LINTIAN = value;
			}
		}
		private string m_DEBUILD_LINTIAN = "yes";


		public string DEBUILD_LINTIAN_OPTS
		{
			get
			{
				return m_DEBUILD_LINTIAN_OPTS;
			}
			set
			{
				m_DEBUILD_LINTIAN_OPTS = value;
			}
		}
		private string m_DEBUILD_LINTIAN_OPTS = "-i -I --show-overrides"
;



		//endregion


	}

}  // end of namespace VisualDeb

