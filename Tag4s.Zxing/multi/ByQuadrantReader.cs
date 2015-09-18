/*
* Copyright 2009 ZXing authors
*



*

*





*/
using System;
using BinaryBitmap = Tag4s.Zxing.BinaryBitmap;
using Reader = Tag4s.Zxing.Reader;
using ReaderException = Tag4s.Zxing.ReaderException;
using Result = Tag4s.Zxing.Result;
namespace Tag4s.Zxing.multi
{
	
	/// <summary> This class attempts to decode a barcode from an image, not by scanning the whole image,
	/// but by scanning subsets of the image. This is important when there may be multiple barcodes in
	/// an image, and detecting a barcode may find parts of multiple barcode and fail to decode
	/// (e.g. QR Codes). Instead this scans the four quadrants of the image -- and also the center
	/// 'quadrant' to cover the case where a barcode is found in the center.
	/// 
	/// </summary>
	/// <seealso cref="GenericMultipleBarcodeReader">
	/// </seealso>
	public sealed class ByQuadrantReader : Reader
	{
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'delegate '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private Reader delegate_Renamed;
		
		public ByQuadrantReader(Reader delegate_Renamed)
		{
			this.delegate_Renamed = delegate_Renamed;
		}
		
		public Result decode(BinaryBitmap image)
		{
			return decode(image, null);
		}
		
		public Result decode(BinaryBitmap image, System.Collections.Hashtable hints)
		{
			
			int width = image.Width;
			int height = image.Height;
			int halfWidth = width / 2;
			int halfHeight = height / 2;
			
			BinaryBitmap topLeft = image.crop(0, 0, halfWidth, halfHeight);
			try
			{
				return delegate_Renamed.decode(topLeft, hints);
			}
			catch (ReaderException)
			{
				// continue
			}
			
			BinaryBitmap topRight = image.crop(halfWidth, 0, halfWidth, halfHeight);
			try
			{
				return delegate_Renamed.decode(topRight, hints);
			}
			catch (ReaderException)
			{
				// continue
			}
			
			BinaryBitmap bottomLeft = image.crop(0, halfHeight, halfWidth, halfHeight);
			try
			{
				return delegate_Renamed.decode(bottomLeft, hints);
			}
			catch (ReaderException)
			{
				// continue
			}
			
			BinaryBitmap bottomRight = image.crop(halfWidth, halfHeight, halfWidth, halfHeight);
			try
			{
				return delegate_Renamed.decode(bottomRight, hints);
			}
			catch (ReaderException)
			{
				// continue
			}
			
			int quarterWidth = halfWidth / 2;
			int quarterHeight = halfHeight / 2;
			BinaryBitmap center = image.crop(quarterWidth, quarterHeight, halfWidth, halfHeight);
			return delegate_Renamed.decode(center, hints);
		}
	}
}
