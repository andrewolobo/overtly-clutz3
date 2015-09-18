/*
* Copyright 2009 ZXing authors
*



*

*





*/
using System;
using BarcodeFormat = Tag4s.Zxing.BarcodeFormat;
using BinaryBitmap = Tag4s.Zxing.BinaryBitmap;
using ReaderException = Tag4s.Zxing.ReaderException;
using Result = Tag4s.Zxing.Result;
using ResultMetadataType = Tag4s.Zxing.ResultMetadataType;
using ResultPoint = Tag4s.Zxing.ResultPoint;
using DecoderResult = Tag4s.Zxing.common.DecoderResult;
using DetectorResult = Tag4s.Zxing.common.DetectorResult;
using MultipleBarcodeReader = Tag4s.Zxing.multi.MultipleBarcodeReader;
using MultiDetector = Tag4s.Zxing.multi.qrcode.detector.MultiDetector;
using QRCodeReader = Tag4s.Zxing.qrcode.QRCodeReader;
namespace Tag4s.Zxing.multi.qrcode
{
	
	/// <summary> This implementation can detect and decode multiple QR Codes in an image.
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>  Hannes Erven
	/// </author>
	/// <author>
	/// </author>

	public sealed class QRCodeMultiReader:QRCodeReader, MultipleBarcodeReader
	{
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'EMPTY_RESULT_ARRAY '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private static readonly Result[] EMPTY_RESULT_ARRAY = new Result[0];
		
		public Result[] decodeMultiple(BinaryBitmap image)
		{
			return decodeMultiple(image, null);
		}
		
		public Result[] decodeMultiple(BinaryBitmap image, System.Collections.Hashtable hints)
		{
			System.Collections.ArrayList results = System.Collections.ArrayList.Synchronized(new System.Collections.ArrayList(10));
			DetectorResult[] detectorResult = new MultiDetector(image.BlackMatrix).detectMulti(hints);
			for (int i = 0; i < detectorResult.Length; i++)
			{
				try
				{
					DecoderResult decoderResult = Decoder.decode(detectorResult[i].Bits);
					ResultPoint[] points = detectorResult[i].Points;
					Result result = new Result(decoderResult.Text, decoderResult.RawBytes, points, BarcodeFormat.QR_CODE);
					if (decoderResult.ByteSegments != null)
					{
						result.putMetadata(ResultMetadataType.BYTE_SEGMENTS, decoderResult.ByteSegments);
					}
					if (decoderResult.ECLevel != null)
					{
						result.putMetadata(ResultMetadataType.ERROR_CORRECTION_LEVEL, decoderResult.ECLevel.ToString());
					}
					results.Add(result);
				}
				catch (ReaderException)
				{
					// ignore and continue 
				}
			}
			if ((results.Count == 0))
			{
				return EMPTY_RESULT_ARRAY;
			}
			else
			{
				Result[] resultArray = new Result[results.Count];
				for (int i = 0; i < results.Count; i++)
				{
					resultArray[i] = (Result) results[i];
				}
				return resultArray;
			}
		}
	}
}
