/*

*



*

*





*/
using System;
using BarcodeFormat = Tag4s.Zxing.BarcodeFormat;
using ReaderException = Tag4s.Zxing.ReaderException;
using BitArray = Tag4s.Zxing.common.BitArray;
namespace Tag4s.Zxing.oned
{
	
	/// <summary> <p>Implements decoding of the EAN-8 format.</p>
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	public sealed class EAN8Reader:UPCEANReader
	{
		override internal BarcodeFormat BarcodeFormat
		{
			get
			{
				return BarcodeFormat.EAN_8;
			}
			
		}
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'decodeMiddleCounters '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private int[] decodeMiddleCounters;
		
		public EAN8Reader()
		{
			decodeMiddleCounters = new int[4];
		}
		
		protected internal override int decodeMiddle(BitArray row, int[] startRange, System.Text.StringBuilder result)
		{
			int[] counters = decodeMiddleCounters;
			counters[0] = 0;
			counters[1] = 0;
			counters[2] = 0;
			counters[3] = 0;
			int end = row.Size;
			int rowOffset = startRange[1];
			
			for (int x = 0; x < 4 && rowOffset < end; x++)
			{
				int bestMatch = decodeDigit(row, counters, rowOffset, L_PATTERNS);
				result.Append((char) ('0' + bestMatch));
				for (int i = 0; i < counters.Length; i++)
				{
					rowOffset += counters[i];
				}
			}
			
			int[] middleRange = findGuardPattern(row, rowOffset, true, MIDDLE_PATTERN);
			rowOffset = middleRange[1];
			
			for (int x = 0; x < 4 && rowOffset < end; x++)
			{
				int bestMatch = decodeDigit(row, counters, rowOffset, L_PATTERNS);
				result.Append((char) ('0' + bestMatch));
				for (int i = 0; i < counters.Length; i++)
				{
					rowOffset += counters[i];
				}
			}
			
			return rowOffset;
		}
	}
}