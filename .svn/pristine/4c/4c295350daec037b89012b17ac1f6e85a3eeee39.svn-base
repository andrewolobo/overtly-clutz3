/*

*



*

*





*/
using System;
using Result = Tag4s.Zxing.Result;
using URIParsedResult = Tag4s.Zxing.client.result.URIParsedResult;
namespace Tag4s.Zxing.client.result.optional
{
	
	/// <summary> Recognizes an NDEF message that encodes a URI according to the
	/// "URI Record Type Definition" specification.
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	sealed class NDEFURIResultParser:AbstractNDEFResultParser
	{
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'URI_PREFIXES'. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private static readonly System.String[] URI_PREFIXES = new System.String[]{null, "http://www.", "https://www.", "http://", "https://", "tel:", "mailto:", "ftp://anonymous:anonymous@", "ftp://ftp.", "ftps://", "sftp://", "smb://", "nfs://", "ftp://", "dav://", "news:", "telnet://", "imap:", "rtsp://", "urn:", "pop:", "sip:", "sips:", "tftp:", "btspp://", "btl2cap://", "btgoep://", "tcpobex://", "irdaobex://", "file://", "urn:epc:id:", "urn:epc:tag:", "urn:epc:pat:", "urn:epc:raw:", "urn:epc:", "urn:nfc:"};
		
		public static URIParsedResult parse(Result result)
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
			if (!ndefRecord.Type.Equals(NDEFRecord.URI_WELL_KNOWN_TYPE))
			{
				return null;
			}
			System.String fullURI = decodeURIPayload(ndefRecord.Payload);
			return new URIParsedResult(fullURI, null);
		}
		
		internal static System.String decodeURIPayload(sbyte[] payload)
		{
			int identifierCode = payload[0] & 0xFF;
			System.String prefix = null;
			if (identifierCode < URI_PREFIXES.Length)
			{
				prefix = URI_PREFIXES[identifierCode];
			}
			System.String restOfURI = bytesToString(payload, 1, payload.Length - 1, "UTF-8");
			return prefix == null?restOfURI:prefix + restOfURI;
		}
	}
}
