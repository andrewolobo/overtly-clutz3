/*
* Copyright 2009 ZXing authors
*



*

*





*/
using System;
using Result = Tag4s.Zxing.Result;
using BinaryBitmap = Tag4s.Zxing.BinaryBitmap;
using ReaderException = Tag4s.Zxing.ReaderException;
namespace Tag4s.Zxing.multi
{
	
	/// <summary> Implementation of this interface attempt to read several barcodes from one image.
	/// 
	/// </summary>
	/// <seealso cref="Tag4s.Zxing.Reader">
	/// </seealso>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>

	public interface MultipleBarcodeReader
	{
		
		Result[] decodeMultiple(BinaryBitmap image);
		
		Result[] decodeMultiple(BinaryBitmap image, System.Collections.Hashtable hints);
	}
}