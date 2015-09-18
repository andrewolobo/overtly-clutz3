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
	
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	sealed class BookmarkDoCoMoResultParser:AbstractDoCoMoResultParser
	{
		
		private BookmarkDoCoMoResultParser()
		{
		}
		
		public static URIParsedResult parse(Result result)
		{
			System.String rawText = result.Text;
			if (rawText == null || !rawText.StartsWith("MEBKM:"))
			{
				return null;
			}
			System.String title = matchSingleDoCoMoPrefixedField("TITLE:", rawText, true);
			System.String[] rawUri = matchDoCoMoPrefixedField("URL:", rawText, true);
			if (rawUri == null)
			{
				return null;
			}
			System.String uri = rawUri[0];
			if (!URIResultParser.isBasicallyValidURI(uri))
			{
				return null;
			}
			return new URIParsedResult(uri, title);
		}
	}
}