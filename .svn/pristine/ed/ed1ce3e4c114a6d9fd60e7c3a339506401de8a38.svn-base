/*
* Copyright 2007 ZXing authors
*



*

*





*/
using System;
using BarcodeFormat = Tag4s.Zxing.BarcodeFormat;
using Result = Tag4s.Zxing.Result;
using UPCEReader = Tag4s.Zxing.oned.UPCEReader;
namespace Tag4s.Zxing.client.result
{
	
	/// <summary> Parses strings of digits that represent a UPC code.
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	sealed class ProductResultParser:ResultParser
	{
		
		private ProductResultParser()
		{
		}
		
		// Treat all UPC and EAN variants as UPCs, in the sense that they are all product barcodes.
		public static ProductParsedResult parse(Result result)
		{
			BarcodeFormat format = result.BarcodeFormat;
			if (!(BarcodeFormat.UPC_A.Equals(format) || BarcodeFormat.UPC_E.Equals(format) || BarcodeFormat.EAN_8.Equals(format) || BarcodeFormat.EAN_13.Equals(format)))
			{
				return null;
			}
			// Really neither of these should happen:
			System.String rawText = result.Text;
			if (rawText == null)
			{
				return null;
			}
			
			int length = rawText.Length;
			for (int x = 0; x < length; x++)
			{
				char c = rawText[x];
				if (c < '0' || c > '9')
				{
					return null;
				}
			}
			// Not actually checking the checksum again here    
			
			System.String normalizedProductID;
			// Expand UPC-E for purposes of searching
			if (BarcodeFormat.UPC_E.Equals(format))
			{
				normalizedProductID = UPCEReader.convertUPCEtoUPCA(rawText);
			}
			else
			{
				normalizedProductID = rawText;
			}
			
			return new ProductParsedResult(rawText, normalizedProductID);
		}
	}
}