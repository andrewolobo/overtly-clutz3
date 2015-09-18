/*
* Copyright 2007 ZXing authors
*



*

*





*/
using System;
using ResultPoint = Tag4s.Zxing.ResultPoint;
namespace Tag4s.Zxing.common
{
	
	/// <summary> <p>Encapsulates the result of detecting a barcode in an image. This includes the raw
	/// matrix of black/white pixels corresponding to the barcode, and possibly points of interest
	/// in the image, like the location of finder patterns or corners of the barcode in the image.</p>
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	public sealed class DetectorResult
	{
		public BitMatrix Bits
		{
			get
			{
				return bits;
			}
			
		}
		public ResultPoint[] Points
		{
			get
			{
				return points;
			}
			
		}
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'bits '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private BitMatrix bits;
		//UPGRADE_NOTE: Final was removed from the declaration of 'points '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private ResultPoint[] points;
		
		public DetectorResult(BitMatrix bits, ResultPoint[] points)
		{
			this.bits = bits;
			this.points = points;
		}
	}
}