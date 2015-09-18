/*

*



*

*





*/
using System;
using ByteMatrix = Tag4s.Zxing.common.ByteMatrix;
using EAN13Writer = Tag4s.Zxing.oned.EAN13Writer;
using EAN8Writer = Tag4s.Zxing.oned.EAN8Writer;
using QRCodeWriter = Tag4s.Zxing.qrcode.QRCodeWriter;
namespace Tag4s.Zxing
{
	
	/// <summary> This is a factory class which finds the appropriate Writer subclass for the BarcodeFormat
	/// requested and encodes the barcode with the supplied contents.
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>

	public sealed class MultiFormatWriter : Writer
	{
		
		public ByteMatrix encode(System.String contents, BarcodeFormat format, int width, int height)
		{
			
			return encode(contents, format, width, height, null);
		}
		
		public ByteMatrix encode(System.String contents, BarcodeFormat format, int width, int height, System.Collections.Hashtable hints)
		{
			
			if (format == BarcodeFormat.EAN_8)
			{
				return new EAN8Writer().encode(contents, format, width, height, hints);
			}
			else if (format == BarcodeFormat.EAN_13)
			{
				return new EAN13Writer().encode(contents, format, width, height, hints);
			}
			else if (format == BarcodeFormat.QR_CODE)
			{
				return new QRCodeWriter().encode(contents, format, width, height, hints);
			}
			else
			{
				throw new System.ArgumentException("No encoder available for format " + format);
			}
		}
	}
}