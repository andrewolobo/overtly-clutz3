/*
* Copyright 2007 ZXing authors
*



*

*





*/
using System;
using Result = Tag4s.Zxing.Result;
namespace Tag4s.Zxing.client.result
{
	
	/// <summary> Parses the "URLTO" result format, which is of the form "URLTO:[title]:[url]".
	/// This seems to be used sometimes, but I am not able to find documentation
	/// on its origin or official format?
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	sealed class URLTOResultParser
	{
		
		private URLTOResultParser()
		{
		}
		
		public static URIParsedResult parse(Result result)
		{
			System.String rawText = result.Text;
			if (rawText == null || (!rawText.StartsWith("urlto:") && !rawText.StartsWith("URLTO:")))
			{
				return null;
			}
			//UPGRADE_WARNING: Method 'java.lang.String.indexOf' was converted to 'System.String.IndexOf' which may throw an exception. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1101'"
			int titleEnd = rawText.IndexOf(':', 6);
			if (titleEnd < 0)
			{
				return null;
			}
			System.String title = titleEnd <= 6?null:rawText.Substring(6, (titleEnd) - (6));
			System.String uri = rawText.Substring(titleEnd + 1);
			return new URIParsedResult(uri, title);
		}
	}
}