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

using Gtk;

namespace Foo {
    public class MyBar {

        [CCode (instance_pos = -1)]
        public void on_button1_clicked (Button source) {
            source.label = "Thank you!";
        }

        [CCode (instance_pos = -1)]
        public void on_button2_clicked (Button source) {
            source.label = "Thanks!";
        }
    }
}


public void on_button1_clicked (Button source) {
    source.label = "Thank you!";
}

public void on_button2_clicked (Button source) {
    source.label = "Thanks!";
}
