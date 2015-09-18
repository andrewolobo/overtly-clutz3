/*

*



*

*





*/
using System;
using Result = Tag4s.Zxing.Result;
namespace Tag4s.Zxing.client.result
{
	
	/// <summary> Implements KDDI AU's address book format. See
	/// <a href="http://www.au.kddi.com/ezfactory/tec/two_dimensions/index.html">
	/// http://www.au.kddi.com/ezfactory/tec/two_dimensions/index.html</a>.
	/// (Thanks to Yuzo for translating!)
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	sealed class AddressBookAUResultParser:ResultParser
	{
		
		public static AddressBookParsedResult parse(Result result)
		{
			System.String rawText = result.Text;
			// MEMORY is mandatory; seems like a decent indicator, as does end-of-record separator CR/LF
			if (rawText == null || rawText.IndexOf("MEMORY") < 0 || rawText.IndexOf("\r\n") < 0)
			{
				return null;
			}
			
			// NAME1 and NAME2 have specific uses, namely written name and pronunciation, respectively.
			// Therefore we treat them specially instead of as an array of names.
			System.String name = matchSinglePrefixedField("NAME1:", rawText, '\r', true);
			System.String pronunciation = matchSinglePrefixedField("NAME2:", rawText, '\r', true);
			
			System.String[] phoneNumbers = matchMultipleValuePrefix("TEL", 3, rawText, true);
			System.String[] emails = matchMultipleValuePrefix("MAIL", 3, rawText, true);
			System.String note = matchSinglePrefixedField("MEMORY:", rawText, '\r', false);
			System.String address = matchSinglePrefixedField("ADD:", rawText, '\r', true);
			System.String[] addresses = address == null?null:new System.String[]{address};
			return new AddressBookParsedResult(maybeWrap(name), pronunciation, phoneNumbers, emails, note, addresses, null, null, null, null);
		}
		
		private static System.String[] matchMultipleValuePrefix(System.String prefix, int max, System.String rawText, bool trim)
		{
			System.Collections.ArrayList values = null;
			for (int i = 1; i <= max; i++)
			{
				System.String value_Renamed = matchSinglePrefixedField(prefix + i + ':', rawText, '\r', trim);
				if (value_Renamed == null)
				{
					break;
				}
				if (values == null)
				{
					values = System.Collections.ArrayList.Synchronized(new System.Collections.ArrayList(max)); // lazy init
				}
				values.Add(value_Renamed);
			}
			if (values == null)
			{
				return null;
			}
			return toStringArray(values);
		}
	}
}