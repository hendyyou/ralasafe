/**
 * Copyright (c) 2004-2011 Wang Jinbao(Julian Wong), http://www.ralasafe.com
 * Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
 */
package org.ralasafe.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.ralasafe.util.Util;

/**
 * Mapping a javabean to query result. This adapter adapters resultset to javabean.
 * A query may use where conditions, this adapter adapters javabean to preparedstatement.
 */
public class JavaBeanColumnAdapter implements ColumnAdapter {
	private String field;
	private String className;
	
	private ResultSetReader rsReader;
	private PstmtSetter pstmtSetter;
	
	public JavaBeanColumnAdapter(String field, String className) {
		this.field=field;
		this.className = className;
		
		rsReader=ResultSetReaderUtil.getReader( className );
		pstmtSetter=PstmtSetterUtil.getSetter( className );
	}
	
	public void readResultSet(ResultSet rs, String columnName, Object o)
			throws SQLException {
		Object readValue=rsReader.reader( rs, columnName );
		Util.setJavabeanAttribute( o, field, className, readValue );
	}

	public void readResultSet(ResultSet rs, int columnIndex, Object o)
			throws SQLException {
		Object readValue=rsReader.reader( rs, columnIndex );
		Util.setJavabeanAttribute( o, field, className, readValue );
	}

	public void setPreparedStatement(PreparedStatement pstmt, int paramIndex,
			Object o) throws SQLException {
		Object setValue=null;
		if (o instanceof MapStorgeObject) {
			MapStorgeObject mso = (MapStorgeObject) o;
			setValue = mso.get( field );
		} else {
			setValue=Util.getJavabeanAttribute( o, field );
		}
		
		pstmtSetter.set( pstmt, paramIndex, setValue );
	}

	public Object extractFieldValue( Object o ) {
		return Util.getJavabeanAttribute( o, field );
	}
}
