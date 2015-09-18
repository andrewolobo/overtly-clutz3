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
	
	/// <summary> Represents a result that encodes an e-mail address, either as a plain address
	/// like "joe@example.org" or a mailto: URL like "mailto:joe@example.org".
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	sealed class EmailAddressResultParser:ResultParser
	{
		
		public static EmailAddressParsedResult parse(Result result)
		{
			System.String rawText = result.Text;
			if (rawText == null)
			{
				return null;
			}
			System.String emailAddress;
			if (rawText.StartsWith("mailto:") || rawText.StartsWith("MAILTO:"))
			{
				// If it starts with mailto:, assume it is definitely trying to be an email address
				emailAddress = rawText.Substring(7);
				int queryStart = emailAddress.IndexOf('?');
				if (queryStart >= 0)
				{
					emailAddress = emailAddress.Substring(0, (queryStart) - (0));
				}
				System.Collections.Hashtable nameValues = parseNameValuePairs(rawText);
				System.String subject = null;
				System.String body = null;
				if (nameValues != null)
				{
					if (emailAddress.Length == 0)
					{
						emailAddress = ((System.String) nameValues["to"]);
					}
					subject = ((System.String) nameValues["subject"]);
					body = ((System.String) nameValues["body"]);
				}
				return new EmailAddressParsedResult(emailAddress, subject, body, rawText);
			}
			else
			{
				if (!EmailDoCoMoResultParser.isBasicallyValidEmailAddress(rawText))
				{
					return null;
				}
				emailAddress = rawText;
				return new EmailAddressParsedResult(emailAddress, null, null, "mailto:" + emailAddress);
			}
		}
	}
}