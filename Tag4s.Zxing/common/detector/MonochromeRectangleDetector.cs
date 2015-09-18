/*
* Copyright 2009 ZXing authors
*



*

*





*/
using System;
using ReaderException = Tag4s.Zxing.ReaderException;
using ResultPoint = Tag4s.Zxing.ResultPoint;
using BitMatrix = Tag4s.Zxing.common.BitMatrix;
namespace Tag4s.Zxing.common.detector
{
	
	/// <summary> <p>A somewhat generic detector that looks for a barcode-like rectangular region within an image.
	/// It looks within a mostly white region of an image for a region of black and white, but mostly
	/// black. It returns the four corners of the region, as best it can determine.</p>
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	public sealed class MonochromeRectangleDetector
	{
		
		private const int MAX_MODULES = 32;
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'image '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private BitMatrix image;
		
		public MonochromeRectangleDetector(BitMatrix image)
		{
			this.image = image;
		}
		
		/// <summary> <p>Detects a rectangular region of black and white -- mostly black -- with a region of mostly
		/// white, in an image.</p>
		/// 
		/// </summary>
		/// <returns> {@link ResultPoint}[] describing the corners of the rectangular region. The first and
		/// last points are opposed on the diagonal, as are the second and third. The first point will be
		/// the topmost point and the last, the bottommost. The second point will be leftmost and the
		/// third, the rightmost
		/// </returns>
		/// <throws>  ReaderException if no Data Matrix Code can be found </throws>
		public ResultPoint[] detect()
		{
			int height = image.Height;
			int width = image.Width;
			int halfHeight = height >> 1;
			int halfWidth = width >> 1;
			int deltaY = System.Math.Max(1, height / (MAX_MODULES << 3));
			int deltaX = System.Math.Max(1, width / (MAX_MODULES << 3));
			
			int top = 0;
			int bottom = height;
			int left = 0;
			int right = width;
			ResultPoint pointA = findCornerFromCenter(halfWidth, 0, left, right, halfHeight, - deltaY, top, bottom, halfWidth >> 1);
			//UPGRADE_WARNING: Data types in Visual C# might be different.  Verify the accuracy of narrowing conversions. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1042'"
			top = (int) pointA.Y - 1;
			ResultPoint pointB = findCornerFromCenter(halfWidth, - deltaX, left, right, halfHeight, 0, top, bottom, halfHeight >> 1);
			//UPGRADE_WARNING: Data types in Visual C# might be different.  Verify the accuracy of narrowing conversions. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1042'"
			left = (int) pointB.X - 1;
			ResultPoint pointC = findCornerFromCenter(halfWidth, deltaX, left, right, halfHeight, 0, top, bottom, halfHeight >> 1);
			//UPGRADE_WARNING: Data types in Visual C# might be different.  Verify the accuracy of narrowing conversions. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1042'"
			right = (int) pointC.X + 1;
			ResultPoint pointD = findCornerFromCenter(halfWidth, 0, left, right, halfHeight, deltaY, top, bottom, halfWidth >> 1);
			//UPGRADE_WARNING: Data types in Visual C# might be different.  Verify the accuracy of narrowing conversions. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1042'"
			bottom = (int) pointD.Y + 1;
			
			// Go try to find point A again with better information -- might have been off at first.
			pointA = findCornerFromCenter(halfWidth, 0, left, right, halfHeight, - deltaY, top, bottom, halfWidth >> 2);
			
			return new ResultPoint[]{pointA, pointB, pointC, pointD};
		}
		
		/// <summary> Attempts to locate a corner of the barcode by scanning up, down, left or right from a center
		/// point which should be within the barcode.
		/// 
		/// </summary>
		/// <param name="centerX">center's x component (horizontal)
		/// </param>
		/// <param name="deltaX">same as deltaY but change in x per step instead
		/// </param>
		/// <param name="left">minimum value of x
		/// </param>
		/// <param name="right">maximum value of x
		/// </param>
		/// <param name="centerY">center's y component (vertical)
		/// </param>
		/// <param name="deltaY">change in y per step. If scanning up this is negative; down, positive;
		/// left or right, 0
		/// </param>
		/// <param name="top">minimum value of y to search through (meaningless when di == 0)
		/// </param>
		/// <param name="bottom">maximum value of y
		/// </param>
		/// <param name="maxWhiteRun">maximum run of white pixels that can still be considered to be within
		/// the barcode
		/// </param>
		/// <returns> a {@link Tag4s.Zxing.ResultPoint} encapsulating the corner that was found
		/// </returns>
		/// <throws>  Tag4s.Zxing.ReaderException if such a point cannot be found </throws>
		private ResultPoint findCornerFromCenter(int centerX, int deltaX, int left, int right, int centerY, int deltaY, int top, int bottom, int maxWhiteRun)
		{
			int[] lastRange = null;
			for (int y = centerY, x = centerX; y < bottom && y >= top && x < right && x >= left; y += deltaY, x += deltaX)
			{
				int[] range;
				if (deltaX == 0)
				{
					// horizontal slices, up and down
					range = blackWhiteRange(y, maxWhiteRun, left, right, true);
				}
				else
				{
					// vertical slices, left and right
					range = blackWhiteRange(x, maxWhiteRun, top, bottom, false);
				}
				if (range == null)
				{
					if (lastRange == null)
					{
						throw ReaderException.Instance;
					}
					// lastRange was found
					if (deltaX == 0)
					{
						int lastY = y - deltaY;
						if (lastRange[0] < centerX)
						{
							if (lastRange[1] > centerX)
							{
								// straddle, choose one or the other based on direction
								return new ResultPoint(deltaY > 0?lastRange[0]:lastRange[1], lastY);
							}
							return new ResultPoint(lastRange[0], lastY);
						}
						else
						{
							return new ResultPoint(lastRange[1], lastY);
						}
					}
					else
					{
						int lastX = x - deltaX;
						if (lastRange[0] < centerY)
						{
							if (lastRange[1] > centerY)
							{
								return new ResultPoint(lastX, deltaX < 0?lastRange[0]:lastRange[1]);
							}
							return new ResultPoint(lastX, lastRange[0]);
						}
						else
						{
							return new ResultPoint(lastX, lastRange[1]);
						}
					}
				}
				lastRange = range;
			}
			throw ReaderException.Instance;
		}
		
		/// <summary> Computes the start and end of a region of pixels, either horizontally or vertically, that could
		/// be part of a Data Matrix barcode.
		/// 
		/// </summary>
		/// <param name="fixedDimension">if scanning horizontally, this is the row (the fixed vertical location)
		/// where we are scanning. If scanning vertically it's the column, the fixed horizontal location
		/// </param>
		/// <param name="maxWhiteRun">largest run of white pixels that can still be considered part of the
		/// barcode region
		/// </param>
		/// <param name="minDim">minimum pixel location, horizontally or vertically, to consider
		/// </param>
		/// <param name="maxDim">maximum pixel location, horizontally or vertically, to consider
		/// </param>
		/// <param name="horizontal">if true, we're scanning left-right, instead of up-down
		/// </param>
		/// <returns> int[] with start and end of found range, or null if no such range is found
		/// (e.g. only white was found)
		/// </returns>
		private int[] blackWhiteRange(int fixedDimension, int maxWhiteRun, int minDim, int maxDim, bool horizontal)
		{
			
			int center = (minDim + maxDim) >> 1;
			
			// Scan left/up first
			int start = center;
			while (start >= minDim)
			{
				if (horizontal?image.get_Renamed(start, fixedDimension):image.get_Renamed(fixedDimension, start))
				{
					start--;
				}
				else
				{
					int whiteRunStart = start;
					do 
					{
						start--;
					}
					while (start >= minDim && !(horizontal?image.get_Renamed(start, fixedDimension):image.get_Renamed(fixedDimension, start)));
					int whiteRunSize = whiteRunStart - start;
					if (start < minDim || whiteRunSize > maxWhiteRun)
					{
						start = whiteRunStart;
						break;
					}
				}
			}
			start++;
			
			// Then try right/down
			int end = center;
			while (end < maxDim)
			{
				if (horizontal?image.get_Renamed(end, fixedDimension):image.get_Renamed(fixedDimension, end))
				{
					end++;
				}
				else
				{
					int whiteRunStart = end;
					do 
					{
						end++;
					}
					while (end < maxDim && !(horizontal?image.get_Renamed(end, fixedDimension):image.get_Renamed(fixedDimension, end)));
					int whiteRunSize = end - whiteRunStart;
					if (end >= maxDim || whiteRunSize > maxWhiteRun)
					{
						end = whiteRunStart;
						break;
					}
				}
			}
			end--;
			
			return end > start?new int[]{start, end}:null;
		}
	}
}