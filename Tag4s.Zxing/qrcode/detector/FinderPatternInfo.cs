/*
* Copyright 2007 ZXing authors
*



*

*





*/
using System;
namespace Tag4s.Zxing.qrcode.detector
{
	
	/// <summary> <p>Encapsulates information about finder patterns in an image, including the location of
	/// the three finder patterns, and their estimated module size.</p>
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	public sealed class FinderPatternInfo
	{
		public FinderPattern BottomLeft
		{
			get
			{
				return bottomLeft;
			}
			
		}
		public FinderPattern TopLeft
		{
			get
			{
				return topLeft;
			}
			
		}
		public FinderPattern TopRight
		{
			get
			{
				return topRight;
			}
			
		}
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'bottomLeft '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private FinderPattern bottomLeft;
		//UPGRADE_NOTE: Final was removed from the declaration of 'topLeft '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private FinderPattern topLeft;
		//UPGRADE_NOTE: Final was removed from the declaration of 'topRight '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private FinderPattern topRight;
		
		public FinderPatternInfo(FinderPattern[] patternCenters)
		{
			this.bottomLeft = patternCenters[0];
			this.topLeft = patternCenters[1];
			this.topRight = patternCenters[2];
		}
	}
}