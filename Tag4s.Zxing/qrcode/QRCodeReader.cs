/*
* Copyright 2007 ZXing authors
*



*

*





*/
using System;
using BarcodeFormat = Tag4s.Zxing.BarcodeFormat;
using DecodeHintType = Tag4s.Zxing.DecodeHintType;
using Reader = Tag4s.Zxing.Reader;
using ReaderException = Tag4s.Zxing.ReaderException;
using Result = Tag4s.Zxing.Result;
using ResultPoint = Tag4s.Zxing.ResultPoint;
using ResultMetadataType = Tag4s.Zxing.ResultMetadataType;
using BinaryBitmap = Tag4s.Zxing.BinaryBitmap;
using BitMatrix = Tag4s.Zxing.common.BitMatrix;
using DecoderResult = Tag4s.Zxing.common.DecoderResult;
using DetectorResult = Tag4s.Zxing.common.DetectorResult;
using Decoder = Tag4s.Zxing.qrcode.decoder.Decoder;
using Detector = Tag4s.Zxing.qrcode.detector.Detector;
namespace Tag4s.Zxing.qrcode
{
	
	/// <summary> This implementation can detect and decode QR Codes in an image.
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	public class QRCodeReader : Reader
	{
		virtual protected internal Decoder Decoder
		{
			get
			{
				return decoder;
			}
			
		}
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'NO_POINTS '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private static readonly ResultPoint[] NO_POINTS = new ResultPoint[0];
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'decoder '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private Decoder decoder = new Decoder();
		
		/// <summary> Locates and decodes a QR code in an image.
		/// 
		/// </summary>
		/// <returns> a String representing the content encoded by the QR code
		/// </returns>
		/// <throws>  ReaderException if a QR code cannot be found, or cannot be decoded </throws>
		public virtual Result decode(BinaryBitmap image)
		{
			return decode(image, null);
		}
		
		public virtual Result decode(BinaryBitmap image, System.Collections.Hashtable hints)
		{
			DecoderResult decoderResult;
			ResultPoint[] points;
			if (hints != null && hints.ContainsKey(DecodeHintType.PURE_BARCODE))
			{
				BitMatrix bits = extractPureBits(image.BlackMatrix);
				decoderResult = decoder.decode(bits);
				points = NO_POINTS;
			}
			else
			{
				DetectorResult detectorResult = new Detector(image.BlackMatrix).detect(hints);
				decoderResult = decoder.decode(detectorResult.Bits);
				points = detectorResult.Points;
			}
			
			Result result = new Result(decoderResult.Text, decoderResult.RawBytes, points, BarcodeFormat.QR_CODE);
			if (decoderResult.ByteSegments != null)
			{
				result.putMetadata(ResultMetadataType.BYTE_SEGMENTS, decoderResult.ByteSegments);
			}
			if (decoderResult.ECLevel != null)
			{
				result.putMetadata(ResultMetadataType.ERROR_CORRECTION_LEVEL, decoderResult.ECLevel.ToString());
			}
			return result;
		}
		
		/// <summary> This method detects a barcode in a "pure" image -- that is, pure monochrome image
		/// which contains only an unrotated, unskewed, image of a barcode, with some white border
		/// around it. This is a specialized method that works exceptionally fast in this special
		/// case.
		/// </summary>
		private static BitMatrix extractPureBits(BitMatrix image)
		{
			// Now need to determine module size in pixels
			
			int height = image.Height;
			int width = image.Width;
			int minDimension = System.Math.Min(height, width);
			
			// First, skip white border by tracking diagonally from the top left down and to the right:
			int borderWidth = 0;
			while (borderWidth < minDimension && !image.get_Renamed(borderWidth, borderWidth))
			{
				borderWidth++;
			}
			if (borderWidth == minDimension)
			{
				throw ReaderException.Instance;
			}
			
			// And then keep tracking across the top-left black module to determine module size
			int moduleEnd = borderWidth;
			while (moduleEnd < minDimension && image.get_Renamed(moduleEnd, moduleEnd))
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
			while (rowEndOfSymbol >= 0 && !image.get_Renamed(rowEndOfSymbol, borderWidth))
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
			for (int i = 0; i < dimension; i++)
			{
				int iOffset = borderWidth + i * moduleSize;
				for (int j = 0; j < dimension; j++)
				{
					if (image.get_Renamed(borderWidth + j * moduleSize, iOffset))
					{
						bits.set_Renamed(j, i);
					}
				}
			}
			return bits;
		}
	}
}