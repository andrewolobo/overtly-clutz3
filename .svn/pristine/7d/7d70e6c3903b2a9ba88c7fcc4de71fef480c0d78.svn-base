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
	
	/// <summary> <p>Encapsulates an alignment pattern, which are the smaller square patterns found in
	/// all but the simplest QR Codes.</p>
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	public sealed class AlignmentPattern:ResultPoint
	{
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'estimatedModuleSize '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private float estimatedModuleSize;
		
		internal AlignmentPattern(float posX, float posY, float estimatedModuleSize):base(posX, posY)
		{
			this.estimatedModuleSize = estimatedModuleSize;
		}
		
		/// <summary> <p>Determines if this alignment pattern "about equals" an alignment pattern at the stated
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