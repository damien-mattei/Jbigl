package eu.oca.bigloofunct;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//import eu.oca.bigloofunct.JavaForBigloo;

public class JavaForBigloo {
    
    public static int hello( int[] tab ) {

	System.out.println( "hello from java code start here :");
	int[] jtab = { 1,2,3,4,5 };
	System.out.println( "jtab[ 0 ]: " + jtab[ 0 ] );
	System.out.println( "jtab[ 1 ]: " + jtab[ 1 ] );
	int[] jtabres;
	
	jtabres = eu.oca.bigloofunct.BiglooCode.squareJavaArray(jtab);
	
	System.out.println( "jtabres[ 0 ]: " + jtabres[ 0 ] );
	System.out.println( "jtabres[ 1 ]: " + jtabres[ 1 ] );
	
	System.out.println( "tab[ 0 ]: " + tab[ 0 ] );
	System.out.println( "tab[ 1 ]: " + tab[ 1 ] );
	System.out.println( "<callback: " + BiglooCode.callback( 10 ) + ">" );
	System.out.println("tab = BiglooCode.squareJavaArray(tab);");
	tab = BiglooCode.squareJavaArray(tab);
	System.out.println( "tab[ 0 ]: " + tab[ 0 ] );
	System.out.println( "tab[ 1 ]: " + tab[ 1 ] );
	String[] jstab = { "hello"," ", "world"," !" };

	
	System.out.println( "jstab : " );
	for (String s : jstab)
	    System.out.print( s );

	System.out.println( "" );

	byte[][] bastr = jstringArray_to_bstringArray( jstab);

	System.out.println( "bastr : " );
	for (byte[] bs : bastr)
	  BiglooCode.affiche( bs );

	System.out.println( "" );

	System.out.println( "displayByteArrayString(bastr);" );
	displayByteArrayString(bastr);
	
	System.out.println( "BiglooCode.displayArrayByteStar(bastr);" );
	BiglooCode.displayArrayByteStar(bastr);

	System.out.println( "BiglooCode.displayReverseArrayByteStar(bastr);" );
	BiglooCode.displayReverseArrayByteStar(bastr);

	byte[][] revbastr = BiglooCode.reverseArrayByteStar(bastr);
	System.out.println( "displayByteArrayString(revbastr);" );
	displayByteArrayString(revbastr);
	
	String jstr = "HellO";

	byte[] tabb = { 'h','e','l','l','o' }; ;
	
	char chr    = jstr.charAt(0);
	tabb[ 0 ] = (byte)chr;
	BiglooCode.affichen(tabb);
	BiglooCode.affichen(jstring_to_bstring(jstr));
	return tab.length;
    }

    public static String bstring_to_jstring( byte[] str ) {
	return new String( str );
    }

    public static byte[] jstring_to_bstring( String str ) {
	if( str == null ) {
	    return new byte[ 0 ];
	} else {
	    return str.getBytes();
	}
    }
    
    public static byte[][] jstringArray_to_bstringArray( String[] Astr ) {

	byte[][] result = new byte[Astr.length][];
	int i=0;
	
	for (String s : Astr) {
	    result[i] = jstring_to_bstring(s);
	    i++;
	}
	return result;
    }

    public static void displayByteArrayString( byte[][] bastr ) {
	for (byte[] bs : bastr)
	    //BiglooCode.affiche( bs );
	    System.out.println( bstring_to_jstring(bs) );
    }	
    

    public static double pi2dec() { return 3.14; }

    public static float piFloat() { return (float) 3.14; }

    public static byte[] jdouble_to_bstring( double x ) {
	System.out.println( "eu.oca.bigloofunct :: JavaForBigloo :: jdouble_to_bstring :: x = " + x );
	String str = Double.toString(x);
	if( str == null ) {
	     return new byte[ 0 ];
	} else {
	    return str.getBytes();
	}
    }

    public static void displayByteStringNL( byte[] bstr ) {
	System.out.println( bstring_to_jstring(bstr) );
    }
    
     public static void displayDoubleNL( double x ) {
	System.out.println( x );
    }

    public static void displayInt(int i ) {
	System.out.println( "eu.oca.bigloofunct :: JavaForBigloo :: displayInt i = " +i);
	System.out.print( i );
    }

}
