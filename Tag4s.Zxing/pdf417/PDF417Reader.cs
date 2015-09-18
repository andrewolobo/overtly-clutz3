/*
* Copyright 2009 ZXing authors
*



*

*





*/
using System;
using BarcodeFormat = Tag4s.Zxing.BarcodeFormat;
using BinaryBitmap = Tag4s.Zxing.BinaryBitmap;
using DecodeHintType = Tag4s.Zxing.DecodeHintType;
using Reader = Tag4s.Zxing.Reader;
using ReaderException = Tag4s.Zxing.ReaderException;
using Result = Tag4s.Zxing.Result;
using ResultPoint = Tag4s.Zxing.ResultPoint;
using BitMatrix = Tag4s.Zxing.common.BitMatrix;
using DecoderResult = Tag4s.Zxing.common.DecoderResult;
using DetectorResult = Tag4s.Zxing.common.DetectorResult;
using Decoder = Tag4s.Zxing.pdf417.decoder.Decoder;
using Detector = Tag4s.Zxing.pdf417.detector.Detector;
namespace Tag4s.Zxing.pdf417
{
	
	/// <summary> This implementation can detect and decode PDF417 codes in an image.
	/// 
	/// </summary>
	/// <author>  SITA Lab (kevin.osullivan@sita.aero)
	/// </author>
	/// <author>
	/// </author>
	public sealed class PDF417Reader : Reader
	{
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'NO_POINTS '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private static readonly ResultPoint[] NO_POINTS = new ResultPoint[0];
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'decoder '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private Decoder decoder = new Decoder();
		
		/// <summary> Locates and decodes a PDF417 code in an image.
		/// 
		/// </summary>
		/// <returns> a String representing the content encoded by the PDF417 code
		/// </returns>
		/// <throws>  ReaderException if a PDF417 code cannot be found, or cannot be decoded </throws>
		public Result decode(BinaryBitmap image)
		{
			return decode(image, null);
		}
		
		public Result decode(BinaryBitmap image, System.Collections.Hashtable hints)
		{
			DecoderResult decoderResult;
			ResultPoint[] points;
			if (hints != null && hints.ContainsKey(DecodeHintType.PURE_BARCODE))
			{
				BitMatrix bits = extractPureBits(image);
				decoderResult = decoder.decode(bits);
				points = NO_POINTS;
			}
			else
			{
				DetectorResult detectorResult = new Detector(image).detect();
				decoderResult = decoder.decode(detectorResult.Bits);
				points = detectorResult.Points;
			}
			return new Result(decoderResult.Text, decoderResult.RawBytes, points, BarcodeFormat.PDF417);
		}
		
		/// <summary> This method detects a barcode in a "pure" image -- that is, pure monochrome image
		/// which contains only an unrotated, unskewed, image of a barcode, with some white border
		/// around it. This is a specialized method that works exceptionally fast in this special
		/// case.
		/// </summary>
		private static BitMatrix extractPureBits(BinaryBitmap image)
		{
			// Now need to determine module size in pixels
			BitMatrix matrix = image.BlackMatrix;
			int height = matrix.Height;
			int width = matrix.Width;
			int minDimension = System.Math.Min(height, width);
			
			// First, skip white border by tracking diagonally from the top left down and to the right:
			int borderWidth = 0;
			while (borderWidth < minDimension && !matrix.get_Renamed(borderWidth, borderWidth))
			{
				borderWidth++;
			}
			if (borderWidth == minDimension)
			{
				throw ReaderException.Instance;
			}
			
			// And then keep tracking across the top-left black module to determine module size
			int moduleEnd = borderWidth;
			while (moduleEnd < minDimension && matrix.get_Renamed(moduleEnd, moduleEnd))
			{
				moduleEnd++;
			}
			if (moduleEnd == minDimension)
			{
				throw ReaderException.Instance;
			}
			
			int moduleSize = moduleEnd - borderWidth;
			
			// And now find where the rightmost black module on the first row ends
			int rowEndOfSymbol = width - 1;
			while (rowEndOfSymbol >= 0 && !matrix.get_Renamed(rowEndOfSymbol, borderWidth))
			{
				rowEndOfSymbol--;
			}
			if (rowEndOfSymbol < 0)
			{
				throw ReaderException.Instance;
			}
			rowEndOfSymbol++;
			
			// Make sure width of barcode is a multiple of module size
			if ((rowEndOfSymbol - borderWidth) % moduleSize != 0)
			{
				throw ReaderException.Instance;
			}
			int dimension = (rowEndOfSymbol - borderWidth) / moduleSize;
			
			// Push in the "border" by half the module width so that we start
			// sampling in the middle of the module. Just in case the image is a
			// little off, this will help recover.
			borderWidth += (moduleSize >> 1);
			
			int sampleDimension = borderWidth + (dimension - 1) * moduleSize;
			if (sampleDimension >= width || sampleDimension >= height)
			{
				throw ReaderException.Instance;
			}
			
			// Now just read off the bits
			BitMatrix bits = new BitMatrix(dimension);
			for (int y = 0; y < dimension; y++)
			{
				int iOffset = borderWidth + y * moduleSize;
				for (int x = 0; x < dimension; x++)
				{
					if (matrix.get_Renamed(borderWidth + x * moduleSize, iOffset))
					{
						bits.set_Renamed(x, y);
					}
				}
			}
			return bits;
		}
	}
}