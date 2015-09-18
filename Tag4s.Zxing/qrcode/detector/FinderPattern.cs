/*
* Copyright 2007 ZXing authors
*



*

*





*/
using System;
using ResultPoint = Tag4s.Zxing.ResultPoint;
namespace Tag4s.Zxing.qrcode.detector
{
	
	/// <summary> <p>Encapsulates a finder pattern, which are the three square patterns found in
	/// the corners of QR Codes. It also encapsulates a count of similar finder patterns,
	/// as a convenience to the finder's bookkeeping.</p>
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	public sealed class FinderPattern:ResultPoint
	{
		public float EstimatedModuleSize
		{
			get
			{
				return estimatedModuleSize;
			}
			
		}
		internal int Count
		{
			get
			{
				return count;
			}
			
		}
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'estimatedModuleSize '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private float estimatedModuleSize;
		private int count;
		
		internal FinderPattern(float posX, float posY, float estimatedModuleSize):base(posX, posY)
		{
			this.estimatedModuleSize = estimatedModuleSize;
			this.count = 1;
		}
		
		internal void  incrementCount()
		{
			this.count++;
		}
		
		/// <summary> <p>Determines if this finder pattern "about equals" a finder pattern at the stated
		/// position and size -- meaning, it is at nearly the same center with nearly the same size.</p>
		/// </summary>
		internal bool aboutEquals(float moduleSize, float i, float j)
		{
			if (System.Math.Abs(i - Y) <= moduleSize && System.Math.Abs(j - X) <= moduleSize)
			{
				float moduleSizeDiff = System.Math.Abs(moduleSize - estimatedModuleSize);
				return moduleSizeDiff <= 1.0f || moduleSizeDiff / estimatedModuleSize <= 1.0f;
			}
			return false;
		}
	}
}