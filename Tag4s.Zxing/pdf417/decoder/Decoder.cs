/*
* Copyright 2009 ZXing authors
*



*

*





*/
using System;
using ReaderException = Tag4s.Zxing.ReaderException;
using BitMatrix = Tag4s.Zxing.common.BitMatrix;
using DecoderResult = Tag4s.Zxing.common.DecoderResult;
namespace Tag4s.Zxing.pdf417.decoder
{
	//import Tag4s.Zxing.pdf417.reedsolomon.ReedSolomonDecoder;
	
	/// <summary> <p>The main class which implements PDF417 Code decoding -- as
	/// opposed to locating and extracting the PDF417 Code from an image.</p>
	/// 
	/// </summary>
	/// <author>  SITA Lab (kevin.osullivan@sita.aero)
	/// </author>
	/// <author>
	/// </author>
	public sealed class Decoder
	{
		
		private const int MAX_ERRORS = 3;
		private const int MAX_EC_CODEWORDS = 512;
		//private final ReedSolomonDecoder rsDecoder;
		
		public Decoder()
		{
			// TODO MGMG
			//rsDecoder = new ReedSolomonDecoder();
		}
		
		/// <summary> <p>Convenience method that can decode a PDF417 Code represented as a 2D array of booleans.
		/// "true" is taken to mean a black module.</p>
		/// 
		/// </summary>
		/// <param name="image">booleans representing white/black PDF417 modules
		/// </param>
		/// <returns> text and bytes encoded within the PDF417 Code
		/// </returns>
		/// <throws>  ReaderException if the PDF417 Code cannot be decoded </throws>
		public DecoderResult decode(bool[][] image)
		{
			int dimension = image.Length;
			BitMatrix bits = new BitMatrix(dimension);
			for (int i = 0; i < dimension; i++)
			{
				for (int j = 0; j < dimension; j++)
				{
					if (image[j][i])
					{
						bits.set_Renamed(j, i);
					}
				}
			}
			return decode(bits);
		}
		
		/// <summary> <p>Decodes a PDF417 Code represented as a {@link BitMatrix}.
		/// A 1 or "true" is taken to mean a black module.</p>
		/// 
		/// </summary>
		/// <param name="bits">booleans representing white/black PDF417 Code modules
		/// </param>
		/// <returns> text and bytes encoded within the PDF417 Code
		/// </returns>
		/// <throws>  ReaderException if the PDF417 Code cannot be decoded </throws>
		public DecoderResult decode(BitMatrix bits)
		{
			// Construct a parser to read the data codewords and error-correction level
			BitMatrixParser parser = new BitMatrixParser(bits);
			int[] codewords = parser.readCodewords();
			if (codewords == null || codewords.Length == 0)
			{
				throw ReaderException.Instance;
			}
			
			int ecLevel = parser.ECLevel;
			int numECCodewords = 1 << (ecLevel + 1);
			int[] erasures = parser.Erasures;
			
			correctErrors(codewords, erasures, numECCodewords);
			verifyCodewordCount(codewords, numECCodewords);
			
			// Decode the codewords
			return DecodedBitStreamParser.decode(codewords);
		}
		
		/// <summary> Verify that all is OK with the codeword array.
		/// 
		/// </summary>
		/// <param name="codewords">
		/// </param>
		/// <returns> an index to the first data codeword.
		/// </returns>
		/// <throws>  ReaderException </throws>
		private static void  verifyCodewordCount(int[] codewords, int numECCodewords)
		{
			if (codewords.Length < 4)
			{
				// Codeword array size should be at least 4 allowing for
				// Count CW, At least one Data CW, Error Correction CW, Error Correction CW
				throw ReaderException.Instance;
			}
			// The first codeword, the Symbol Length Descriptor, shall always encode the total number of data
			// codewords in the symbol, including the Symbol Length Descriptor itself, data codewords and pad
			// codewords, but excluding the number of error correction codewords.
			int numberOfCodewords = codewords[0];
			if (numberOfCodewords > codewords.Length)
			{
				throw ReaderException.Instance;
			}
			if (numberOfCodewords == 0)
			{
				// Reset to the length of the array - 8 (Allow for at least level 3 Error Correction (8 Error Codewords)
				if (numECCodewords < codewords.Length)
				{
					codewords[0] = codewords.Length - numECCodewords;
				}
				else
				{
					throw ReaderException.Instance;
				}
			}
		}
		
		/// <summary> <p>Given data and error-correction codewords received, possibly corrupted by errors, attempts to
		/// correct the errors in-place using Reed-Solomon error correction.</p>
		/// 
		/// </summary>
		/// <param name="codewords">  data and error correction codewords
		/// </param>
		/// <throws>  ReaderException if error correction fails </throws>
		private static int correctErrors(int[] codewords, int[] erasures, int numECCodewords)
		{
			if ((erasures != null && erasures.Length > numECCodewords / 2 + MAX_ERRORS) || (numECCodewords < 0 || numECCodewords > MAX_EC_CODEWORDS))
			{
				// Too many errors or EC Codewords is corrupted
				throw ReaderException.Instance;
			}
			// Try to correct the errors
			int result = 0; // rsDecoder.correctErrors(codewords, numECCodewords);
			if (erasures != null)
			{
				int numErasures = erasures.Length;
				if (result > 0)
				{
					numErasures -= result;
				}
				if (numErasures > MAX_ERRORS)
				{
					// Still too many errors
					throw ReaderException.Instance;
				}
			}
			return result;
		}
	}
}