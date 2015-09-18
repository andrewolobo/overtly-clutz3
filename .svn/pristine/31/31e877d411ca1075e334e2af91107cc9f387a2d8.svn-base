/*
* Copyright 2009 ZXing authors
*



*

*





*/
using System;
using ReaderException = Tag4s.Zxing.ReaderException;
using DetectorResult = Tag4s.Zxing.common.DetectorResult;
using BitMatrix = Tag4s.Zxing.common.BitMatrix;
using Detector = Tag4s.Zxing.qrcode.detector.Detector;
using FinderPatternInfo = Tag4s.Zxing.qrcode.detector.FinderPatternInfo;
namespace Tag4s.Zxing.multi.qrcode.detector
{
	
	/// <summary> <p>Encapsulates logic that can detect one or more QR Codes in an image, even if the QR Code
	/// is rotated or skewed, or partially obscured.</p>
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>  Hannes Erven
	/// </author>
	/// <author>
	/// </author>

	public sealed class MultiDetector:Detector
	{
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'EMPTY_DETECTOR_RESULTS '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private static readonly DetectorResult[] EMPTY_DETECTOR_RESULTS = new DetectorResult[0];
		
		public MultiDetector(BitMatrix image):base(image)
		{
		}
		
		public DetectorResult[] detectMulti(System.Collections.Hashtable hints)
		{
			BitMatrix image = Image;
			MultiFinderPatternFinder finder = new MultiFinderPatternFinder(image);
			FinderPatternInfo[] info = finder.findMulti(hints);
			
			if (info == null || info.Length == 0)
			{
				throw ReaderException.Instance;
			}
			
			System.Collections.ArrayList result = System.Collections.ArrayList.Synchronized(new System.Collections.ArrayList(10));
			for (int i = 0; i < info.Length; i++)
			{
				try
				{
					result.Add(processFinderPatternInfo(info[i]));
				}
				catch (ReaderException)
				{
					// ignore
				}
			}
			if ((result.Count == 0))
			{
				return EMPTY_DETECTOR_RESULTS;
			}
			else
			{
				DetectorResult[] resultArray = new DetectorResult[result.Count];
				for (int i = 0; i < result.Count; i++)
				{
					resultArray[i] = (DetectorResult) result[i];
				}
				return resultArray;
			}
		}
	}
}
