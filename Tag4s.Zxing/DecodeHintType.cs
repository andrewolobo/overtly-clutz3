/*
* Copyright 2007 ZXing authors
*



*

*





*/
using System;
namespace Tag4s.Zxing
{
	
	/// <summary> Encapsulates a type of hint that a caller may pass to a barcode reader to help it
	/// more quickly or accurately decode it. It is up to implementations to decide what,
	/// if anything, to do with the information that is supplied.
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	/// <seealso cref="Reader.decode(BinaryBitmap,java.util.Hashtable)">
	/// </seealso>
	public sealed class DecodeHintType
	{
		
		// No, we can't use an enum here. J2ME doesn't support it.
		
		/// <summary> Unspecified, application-specific hint. Maps to an unspecified {@link Object}.</summary>
		//UPGRADE_NOTE: Final was removed from the declaration of 'OTHER '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		public static readonly DecodeHintType OTHER = new DecodeHintType();
		
		/// <summary> Image is a pure monochrome image of a barcode. Doesn't matter what it maps to;
		/// use {@link Boolean#TRUE}.
		/// </summary>
		//UPGRADE_NOTE: Final was removed from the declaration of 'PURE_BARCODE '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		public static readonly DecodeHintType PURE_BARCODE = new DecodeHintType();
		
		/// <summary> Image is known to be of one of a few possible formats.
		/// Maps to a {@link java.util.Vector} of {@link BarcodeFormat}s.
		/// </summary>
		//UPGRADE_NOTE: Final was removed from the declaration of 'POSSIBLE_FORMATS '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		public static readonly DecodeHintType POSSIBLE_FORMATS = new DecodeHintType();
		
		/// <summary> Spend more time to try to find a barcode; optimize for accuracy, not speed.
		/// Doesn't matter what it maps to; use {@link Boolean#TRUE}.
		/// </summary>
		//UPGRADE_NOTE: Final was removed from the declaration of 'TRY_HARDER '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		public static readonly DecodeHintType TRY_HARDER = new DecodeHintType();
		
		/// <summary> Allowed lengths of encoded data -- reject anything else. Maps to an int[].</summary>
		//UPGRADE_NOTE: Final was removed from the declaration of 'ALLOWED_LENGTHS '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		public static readonly DecodeHintType ALLOWED_LENGTHS = new DecodeHintType();
		
		/// <summary> Assume Code 39 codes employ a check digit. Maps to {@link Boolean}.</summary>
		//UPGRADE_NOTE: Final was removed from the declaration of 'ASSUME_CODE_39_CHECK_DIGIT '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		public static readonly DecodeHintType ASSUME_CODE_39_CHECK_DIGIT = new DecodeHintType();
		
		/// <summary> The caller needs to be notified via callback when a possible {@link ResultPoint}
		/// is found. Maps to a {@link ResultPointCallback}.
		/// </summary>
		//UPGRADE_NOTE: Final was removed from the declaration of 'NEED_RESULT_POINT_CALLBACK '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		public static readonly DecodeHintType NEED_RESULT_POINT_CALLBACK = new DecodeHintType();
		
		private DecodeHintType()
		{
		}
	}
}