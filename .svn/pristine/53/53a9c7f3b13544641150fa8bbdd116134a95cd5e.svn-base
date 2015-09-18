/*

*



*

*





*/
using System;
using Result = Tag4s.Zxing.Result;
namespace Tag4s.Zxing.client.result
{
	
	/// <summary> Parses a "tel:" URI result, which specifies a phone number.
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	sealed class TelResultParser:ResultParser
	{
		
		private TelResultParser()
		{
		}
		
		public static TelParsedResult parse(Result result)
		{
			System.String rawText = result.Text;
			if (rawText == null || (!rawText.StartsWith("tel:") && !rawText.StartsWith("TEL:")))
			{
				return null;
			}
			// Normalize "TEL:" to "tel:"
			System.String telURI = rawText.StartsWith("TEL:")?"tel:" + rawText.Substring(4):rawText;
			// Drop tel, query portion
			//UPGRADE_WARNING: Method 'java.lang.String.indexOf' was converted to 'System.String.IndexOf' which may throw an exception. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1101'"
			int queryStart = rawText.IndexOf('?', 4);
			System.String number = queryStart < 0?rawText.Substring(4):rawText.Substring(4, (queryStart) - (4));
			return new TelParsedResult(number, telURI, null);
		}
	}
}