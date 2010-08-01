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

[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename = "config.h")]
namespace Config {
	[CCode (cheader_filename = "../config.h")]
/* Name of package */
public const string  PACKAGE;
/* Define to the address where bug reports for this package should be sent. */
public const string  PACKAGE_BUGREPORT;
/* Define to the full name of this package. */
public const string PACKAGE_NAME;
/* Define to the full name and version of this package. */
public const string  PACKAGE_STRING;
/* Define to the one symbol short name of this package. */
public const string  PACKAGE_TARNAME;
/* Define to the home page for this package. */
public const string  PACKAGE_URL;
/* Define to the version of this package. */
public const string  PACKAGE_VERSION;
/* Version number of package */
public const string  VERSION;	
}
