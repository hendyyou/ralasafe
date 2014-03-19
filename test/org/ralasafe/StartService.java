/**
 * Copyright (c) 2010 Wang Jinbao, http://www.ralasafe.com
 * Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
 */
package org.ralasafe;

import org.ralasafe.util.Startup;

public class StartService {
	public static void startup() {
		Startup.startup(
				"./WebContent/WEB-INF/ralasafe",
				"./xml");
	}
}
