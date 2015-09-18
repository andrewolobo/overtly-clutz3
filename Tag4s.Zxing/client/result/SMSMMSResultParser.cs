/*

*



*

*





*/
using System;
using Result = Tag4s.Zxing.Result;
namespace Tag4s.Zxing.client.result
{
	
	/// <summary> <p>Parses an "sms:" URI result, which specifies a number to SMS and optional
	/// "via" number. See <a href="http://gbiv.com/protocols/uri/drafts/draft-antti-gsm-sms-url-04.txt">
	/// the IETF draft</a> on this.</p>
	/// 
	/// <p>This actually also parses URIs starting with "mms:", "smsto:", "mmsto:", "SMSTO:", and
	/// "MMSTO:", and treats them all the same way, and effectively converts them to an "sms:" URI
	/// for purposes of forwarding to the platform.</p>
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	sealed class SMSMMSResultParser:ResultParser
	{
		
		private SMSMMSResultParser()
		{
		}
		
		public static SMSParsedResult parse(Result result)
		{
			System.String rawText = result.Text;
			if (rawText == null)
			{
				return null;
			}
			int prefixLength;
			if (rawText.StartsWith("sms:") || rawText.StartsWith("SMS:") || rawText.StartsWith("mms:") || rawText.StartsWith("MMS:"))
			{
				prefixLength = 4;
			}
			else if (rawText.StartsWith("smsto:") || rawText.StartsWith("SMSTO:") || rawText.StartsWith("mmsto:") || rawText.StartsWith("MMSTO:"))
			{
				prefixLength = 6;
			}
			else
			{
				return null;
			}
			
			// Check up front if this is a URI syntax string with query arguments
			System.Collections.Hashtable nameValuePairs = parseNameValuePairs(rawText);
			System.String subject = null;
			System.String body = null;
			bool querySyntax = false;
			if (nameValuePairs != null && !(nameValuePairs.Count == 0))
			{
				subject = ((System.String) nameValuePairs["subject"]);
				body = ((System.String) nameValuePairs["body"]);
				querySyntax = true;
			}
			
			// Drop sms, query portion
			//UPGRADE_WARNING: Method 'java.lang.String.indexOf' was converted to 'System.String.IndexOf' which may throw an exception. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1101'"
			int queryStart = rawText.IndexOf('?', prefixLength);
			System.String smsURIWithoutQuery;
			// If it's not query syntax, the question mark is part of the subject or message
			if (queryStart < 0 || !querySyntax)
			{
				smsURIWithoutQuery = rawText.Substring(prefixLength);
			}
			else
			{
				smsURIWithoutQuery = rawText.Substring(prefixLength, (queryStart) - (prefixLength));
			}
			int numberEnd = smsURIWithoutQuery.IndexOf(';');
			System.String number;
			System.String via;
			if (numberEnd < 0)
			{
				number = smsURIWithoutQuery;
				via = null;
			}
			else
			{
				number = smsURIWithoutQuery.Substring(0, (numberEnd) - (0));
				System.String maybeVia = smsURIWithoutQuery.Substring(numberEnd + 1);
				if (maybeVia.StartsWith("via="))
				{
					via = maybeVia.Substring(4);
				}
				else
				{
					via = null;
				}
			}
			
			// Thanks to dominik.wild for suggesting this enhancement to support
			// smsto:number:body URIs
			if (body == null)
			{
				int bodyStart = number.IndexOf(':');
				if (bodyStart >= 0)
				{
					body = number.Substring(bodyStart + 1);
					number = number.Substring(0, (bodyStart) - (0));
				}
			}
			return new SMSParsedResult("sms:" + number, number, via, subject, body, null);
		}
	}
}