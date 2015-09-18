/*
* Copyright 2009 ZXing authors
*



*

*





*/
using System;
using BarcodeFormat = Tag4s.Zxing.BarcodeFormat;
using WriterException = Tag4s.Zxing.WriterException;
using ByteMatrix = Tag4s.Zxing.common.ByteMatrix;
namespace Tag4s.Zxing.oned
{
	
	/// <summary> This object renders an EAN8 code as a ByteMatrix 2D array of greyscale
	/// values.
	/// 
	/// </summary>
	/// <author>  aripollak@gmail.com (Ari Pollak)
	/// </author>
	/// <author>
	/// </author>
	public sealed class EAN8Writer:UPCEANWriter
	{
		
		private const int codeWidth = 3 + (7 * 4) + 5 + (7 * 4) + 3; // end guard
		
		public override ByteMatrix encode(System.String contents, BarcodeFormat format, int width, int height, System.Collections.Hashtable hints)
		{
			if (format != BarcodeFormat.EAN_8)
			{
				throw new System.ArgumentException("Can only encode EAN_8, but got " + format);
			}
			
			return base.encode(contents, format, width, height, hints);
		}
		
		/// <returns> a byte array of horizontal pixels (0 = white, 1 = black) 
		/// </returns>
		public override sbyte[] encode(System.String contents)
		{
			if (contents.Length != 8)
			{
				throw new System.ArgumentException("Requested contents should be 8 digits long, but got " + contents.Length);
			}
			
			sbyte[] result = new sbyte[codeWidth];
			int pos = 0;
			
			pos += appendPattern(result, pos, UPCEANReader.START_END_PATTERN, 1);
			
			for (int i = 0; i <= 3; i++)
			{
				int digit = System.Int32.Parse(contents.Substring(i, (i + 1) - (i)));
				pos += appendPattern(result, pos, UPCEANReader.L_PATTERNS[digit], 0);
			}
			
			pos += appendPattern(result, pos, UPCEANReader.MIDDLE_PATTERN, 0);
			
			for (int i = 4; i <= 7; i++)
			{
				int digit = System.Int32.Parse(contents.Substring(i, (i + 1) - (i)));
				pos += appendPattern(result, pos, UPCEANReader.L_PATTERNS[digit], 1);
			}
			pos += appendPattern(result, pos, UPCEANReader.START_END_PATTERN, 1);
			
			return result;
		}
	}
}