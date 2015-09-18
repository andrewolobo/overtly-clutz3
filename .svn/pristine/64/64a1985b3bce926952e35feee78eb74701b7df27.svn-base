/*

*



*

*





*/
using System;
using BarcodeFormat = Tag4s.Zxing.BarcodeFormat;
using ReaderException = Tag4s.Zxing.ReaderException;
using Result = Tag4s.Zxing.Result;
using BinaryBitmap = Tag4s.Zxing.BinaryBitmap;
using BitArray = Tag4s.Zxing.common.BitArray;
namespace Tag4s.Zxing.oned
{
	
	/// <summary> <p>Implements decoding of the UPC-A format.</p>
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	public sealed class UPCAReader:UPCEANReader
	{
		override internal BarcodeFormat BarcodeFormat
		{
			get
			{
				return BarcodeFormat.UPC_A;
			}
			
		}
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'ean13Reader '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private UPCEANReader ean13Reader = new EAN13Reader();
		
		public override Result decodeRow(int rowNumber, BitArray row, int[] startGuardRange, System.Collections.Hashtable hints)
		{
			return maybeReturnResult(ean13Reader.decodeRow(rowNumber, row, startGuardRange, hints));
		}
		
		public override Result decodeRow(int rowNumber, BitArray row, System.Collections.Hashtable hints)
		{
			return maybeReturnResult(ean13Reader.decodeRow(rowNumber, row, hints));
		}
		
		public override Result decode(BinaryBitmap image)
		{
			return maybeReturnResult(ean13Reader.decode(image));
		}
		
		public override Result decode(BinaryBitmap image, System.Collections.Hashtable hints)
		{
			return maybeReturnResult(ean13Reader.decode(image, hints));
		}
		
		protected internal override int decodeMiddle(BitArray row, int[] startRange, System.Text.StringBuilder resultString)
		{
			return ean13Reader.decodeMiddle(row, startRange, resultString);
		}
		
		private static Result maybeReturnResult(Result result)
		{
			System.String text = result.Text;
			if (text[0] == '0')
			{
				return new Result(text.Substring(1), null, result.ResultPoints, BarcodeFormat.UPC_A);
			}
			else
			{
				throw ReaderException.Instance;
			}
		}
	}
}