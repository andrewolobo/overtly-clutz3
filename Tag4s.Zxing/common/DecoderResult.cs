/*
* Copyright 2007 ZXing authors
*



*

*





*/
using System;
using ErrorCorrectionLevel = Tag4s.Zxing.qrcode.decoder.ErrorCorrectionLevel;
namespace Tag4s.Zxing.common
{
	
	/// <summary> <p>Encapsulates the result of decoding a matrix of bits. This typically
	/// applies to 2D barcode formats. For now it contains the raw bytes obtained,
	/// as well as a String interpretation of those bytes, if applicable.</p>
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	public sealed class DecoderResult
	{
		public sbyte[] RawBytes
		{
			get
			{
				return rawBytes;
			}
			
		}
		public System.String Text
		{
			get
			{
				return text;
			}
			
		}
		public System.Collections.ArrayList ByteSegments
		{
			get
			{
				return byteSegments;
			}
			
		}
		public ErrorCorrectionLevel ECLevel
		{
			get
			{
				return ecLevel;
			}
			
		}
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'rawBytes '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private sbyte[] rawBytes;
		//UPGRADE_NOTE: Final was removed from the declaration of 'text '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.String text;
		//UPGRADE_NOTE: Final was removed from the declaration of 'byteSegments '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.Collections.ArrayList byteSegments;
		//UPGRADE_NOTE: Final was removed from the declaration of 'ecLevel '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private ErrorCorrectionLevel ecLevel;
		
		public DecoderResult(sbyte[] rawBytes, System.String text, System.Collections.ArrayList byteSegments, ErrorCorrectionLevel ecLevel)
		{
			if (rawBytes == null && text == null)
			{
				throw new System.ArgumentException();
			}
			this.rawBytes = rawBytes;
			this.text = text;
			this.byteSegments = byteSegments;
			this.ecLevel = ecLevel;
		}
	}
}