<cfscript>
describe( "addColumn tests",function(){

	beforeEach( function(){
		variables.data = "a,b";
		variables.workbook = s.new();
	});

	it( "can add a column with the minimum arguments",function() {
		s.addColumn( workbook,data );
		s.write( workbook,tempXlsPath,true );
		expected = QueryNew( "column1","VarChar",[ [ "a" ],[ "b" ] ] );
		actual = s.read( src=tempXlsPath,format="query" );
		expect( actual ).toBe( expected );
	});

	it( "can add a column at a given start row",function() {
		s.addColumn( workbook,data,2 );
		s.write( workbook,tempXlsPath,true );
		expected = QueryNew( "column1","VarChar",[ [ "" ],[ "a" ],[ "b" ] ] );
		actual = s.read( src=tempXlsPath,format="query" );
		expect( actual ).toBe( expected );
	});

	it( "can add a column at a given column number",function() {
		s.addColumn( workbook=workbook,data=data,startColumn=2 );
		s.write( workbook,tempXlsPath,true );
		expected = QueryNew( "column1,column2","VarChar,VarChar",[ [ "","a" ],[ "","b" ] ] );
		actual = s.read( src=tempXlsPath,format="query",includeBlankRows=true );
		expect( actual ).toBe( expected );
	});

	it( "can add a column including commas with a custom delimiter",function() {
		var data = "a,b|c,d";
		s.addColumn( workbook=workbook,data=data,delimiter="|" );
		s.write( workbook,tempXlsPath,true );
		expected = QueryNew( "column1","VarChar",[ [ "a,b" ],[ "c,d" ] ] );
		actual = s.read( src=tempXlsPath,format="query" );
		expect( actual ).toBe( expected );
	});

	/* TODO insert tests */

});	
</cfscript>