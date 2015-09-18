/*
* Copyright 2007 ZXing authors
*



*

*





*/
using System;
namespace Tag4s.Zxing.common
{
	
	/// <summary> <p>This is basically a substitute for <code>java.util.Collections</code>, which is not
	/// present in MIDP 2.0 / CLDC 1.1.</p>
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	public sealed class Collections
	{
		
		private Collections()
		{
		}
		
		/// <summary> Sorts its argument (destructively) using insert sort; in the context of this package
		/// insertion sort is simple and efficient given its relatively small inputs.
		/// 
		/// </summary>
		/// <param name="vector">vector to sort
		/// </param>
		/// <param name="comparator">comparator to define sort ordering
		/// </param>
		public static void  insertionSort(System.Collections.ArrayList vector, Comparator comparator)
		{
			int max = vector.Count;
			for (int i = 1; i < max; i++)
			{
				System.Object value_Renamed = vector[i];
				int j = i - 1;
				System.Object valueB;
				while (j >= 0 && comparator.compare((valueB = vector[j]), value_Renamed) > 0)
				{
					vector[j + 1] = valueB;
					j--;
				}
				vector[j + 1] = value_Renamed;
			}
		}
	}
}