/*

*



*

*





*/
using System;
using Result = Tag4s.Zxing.Result;
using TextParsedResult = Tag4s.Zxing.client.result.TextParsedResult;
namespace Tag4s.Zxing.client.result.optional
{
	
	/// <summary> Recognizes an NDEF message that encodes text according to the
	/// "Text Record Type Definition" specification.
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	sealed class NDEFTextResultParser:AbstractNDEFResultParser
	{
		
		public static TextParsedResult parse(Result result)
		{
			sbyte[] bytes = result.RawBytes;
			if (bytes == null)
			{
				return null;
			}
			NDEFRecord ndefRecord = NDEFRecord.readRecord(bytes, 0);
			if (ndefRecord == null || !ndefRecord.MessageBegin || !ndefRecord.MessageEnd)
			{
				return null;
			}
			if (!ndefRecord.Type.Equals(NDEFRecord.TEXT_WELL_KNOWN_TYPE))
			{
				return null;
			}
			System.String[] languageText = decodeTextPayload(ndefRecord.Payload);
			return new TextParsedResult(languageText[0], languageText[1]);
		}
		
		internal static System.String[] decodeTextPayload(sbyte[] payload)
		{
			sbyte statusByte = payload[0];
			bool isUTF16 = (statusByte & 0x80) != 0;
			int languageLength = statusByte & 0x1F;
			// language is always ASCII-encoded:
			System.String language = bytesToString(payload, 1, languageLength, "US-ASCII");
			System.String encoding = isUTF16?"UTF-16":"UTF-8";
			System.String text = bytesToString(payload, 1 + languageLength, payload.Length - languageLength - 1, encoding);
			return new System.String[]{language, text};
		}
	}
}
