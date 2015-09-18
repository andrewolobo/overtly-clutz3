/*
* Copyright 2007 ZXing authors
*



*

*





*/
using System;
namespace Tag4s.Zxing
{
	
	/// <summary> Implementations of this interface can decode an image of a barcode in some format into
	/// the String it encodes. For example, {@link Tag4s.Zxing.qrcode.QRCodeReader} can
	/// decode a QR code. The decoder may optionally receive hints from the caller which may help
	/// it decode more quickly or accurately.
	/// 
	/// See {@link Tag4s.Zxing.MultiFormatReader}, which attempts to determine what barcode
	/// format is present within the image as well, and then decodes it accordingly.
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>

	public interface Reader
	{
		
		/// <summary> Locates and decodes a barcode in some format within an image.
		/// 
		/// </summary>
		/// <param name="image">image of barcode to decode
		/// </param>
		/// <returns> String which the barcode encodes
		/// </returns>
		/// <throws>  ReaderException if the barcode cannot be located or decoded for any reason </throws>
		Result decode(BinaryBitmap image);
		
		/// <summary> Locates and decodes a barcode in some format within an image. This method also accepts
		/// hints, each possibly associated to some data, which may help the implementation decode.
		/// 
		/// </summary>
		/// <param name="image">image of barcode to decode
		/// </param>
		/// <param name="hints">passed as a {@link java.util.Hashtable} from {@link Tag4s.Zxing.DecodeHintType}
		/// to arbitrary data. The
		/// meaning of the data depends upon the hint type. The implementation may or may not do
		/// anything with these hints.
		/// </param>
		/// <returns> String which the barcode encodes
		/// </returns>
		/// <throws>  ReaderException if the barcode cannot be located or decoded for any reason </throws>
		Result decode(BinaryBitmap image, System.Collections.Hashtable hints);
	}
}