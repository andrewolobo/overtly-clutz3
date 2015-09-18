/*

*



*

*





*/
using System;
using BarcodeFormat = Tag4s.Zxing.BarcodeFormat;
using Result = Tag4s.Zxing.Result;
namespace Tag4s.Zxing.client.result
{
	
	/// <summary> Parses strings of digits that represent a ISBN.
	/// 
	/// </summary>
	/// <author>  jbreiden@google.com (Jeff Breidenbach)
	/// </author>
	/// <author>
	/// </author>
	public class ISBNResultParser:ResultParser
	{
		
		private ISBNResultParser()
		{
		}
		
		// ISBN-13 For Dummies 
		// http://www.bisg.org/isbn-13/for.dummies.html
		public static ISBNParsedResult parse(Result result)
		{
			BarcodeFormat format = result.BarcodeFormat;
			if (!BarcodeFormat.EAN_13.Equals(format))
			{
				return null;
			}
			System.String rawText = result.Text;
			if (rawText == null)
			{
				return null;
			}
			int length = rawText.Length;
			if (length != 13)
			{
				return null;
			}
			if (!rawText.StartsWith("978") && !rawText.StartsWith("979"))
			{
				return null;
			}
			
			return new ISBNParsedResult(rawText);
		}
	}
}