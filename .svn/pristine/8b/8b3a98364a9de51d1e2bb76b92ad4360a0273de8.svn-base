/*
* Copyright 2007 ZXing authors
*



*

*





*/
using System;
namespace Tag4s.Zxing.client.result
{
	
	/// <summary> <p>See
	/// <a href="http://www.nttdocomo.co.jp/english/service/imode/make/content/barcode/about/s2.html">
	/// DoCoMo's documentation</a> about the result types represented by subclasses of this class.</p>
	/// 
	/// <p>Thanks to Jeff Griffin for proposing rewrite of these classes that relies less
	/// on exception-based mechanisms during parsing.</p>
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	abstract class AbstractDoCoMoResultParser:ResultParser
	{
		
		internal static System.String[] matchDoCoMoPrefixedField(System.String prefix, System.String rawText, bool trim)
		{
			return matchPrefixedField(prefix, rawText, ';', trim);
		}
		
		internal static System.String matchSingleDoCoMoPrefixedField(System.String prefix, System.String rawText, bool trim)
		{
			return matchSinglePrefixedField(prefix, rawText, ';', trim);
		}
	}
}