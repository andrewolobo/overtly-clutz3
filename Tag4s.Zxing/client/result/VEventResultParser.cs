/*

*



*

*





*/
using System;
using Result = Tag4s.Zxing.Result;
namespace Tag4s.Zxing.client.result
{
	
	/// <summary> Partially implements the iCalendar format's "VEVENT" format for specifying a
	/// calendar event. See RFC 2445. This supports SUMMARY, DTSTART and DTEND fields.
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	sealed class VEventResultParser:ResultParser
	{
		
		private VEventResultParser()
		{
		}
		
		public static CalendarParsedResult parse(Result result)
		{
			System.String rawText = result.Text;
			if (rawText == null)
			{
				return null;
			}
			int vEventStart = rawText.IndexOf("BEGIN:VEVENT");
			if (vEventStart < 0)
			{
				return null;
			}
			int vEventEnd = rawText.IndexOf("END:VEVENT");
			if (vEventEnd < 0)
			{
				return null;
			}
			
			System.String summary = VCardResultParser.matchSingleVCardPrefixedField("SUMMARY", rawText, true);
			System.String start = VCardResultParser.matchSingleVCardPrefixedField("DTSTART", rawText, true);
			System.String end = VCardResultParser.matchSingleVCardPrefixedField("DTEND", rawText, true);
			try
			{
				return new CalendarParsedResult(summary, start, end, null, null, null);
			}
			catch (System.ArgumentException)
			{
				return null;
			}
		}
	}
}
