/*
* Copyright 2007 ZXing authors
*



*

*





*/
using System;
using Result = Tag4s.Zxing.Result;
namespace Tag4s.Zxing.client.result
{
	
	/// <summary> <p>Abstract class representing the result of decoding a barcode, as more than
	/// a String -- as some type of structured data. This might be a subclass which represents
	/// a URL, or an e-mail address. {@link ResultParser#parseResult(Result)} will turn a raw
	/// decoded string into the most appropriate type of structured representation.</p>
	/// 
	/// <p>Thanks to Jeff Griffin for proposing rewrite of these classes that relies less
	/// on exception-based mechanisms during parsing.</p>
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	public abstract class ParsedResult
	{
		virtual public ParsedResultType Type
		{
			get
			{
				return type;
			}
			
		}
		public abstract System.String DisplayResult{get;}
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'type '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private ParsedResultType type;
		
		protected internal ParsedResult(ParsedResultType type)
		{
			this.type = type;
		}
		
		public override System.String ToString()
		{
			return DisplayResult;
		}
		
		public static void  maybeAppend(System.String value_Renamed, System.Text.StringBuilder result)
		{
			if (value_Renamed != null && value_Renamed.Length > 0)
			{
				// Don't add a newline before the first value
				if (result.Length > 0)
				{
					result.Append('\n');
				}
				result.Append(value_Renamed);
			}
		}
		
		public static void  maybeAppend(System.String[] value_Renamed, System.Text.StringBuilder result)
		{
			if (value_Renamed != null)
			{
				for (int i = 0; i < value_Renamed.Length; i++)
				{
					if (value_Renamed[i] != null && value_Renamed[i].Length > 0)
					{
						if (result.Length > 0)
						{
							result.Append('\n');
						}
						result.Append(value_Renamed[i]);
					}
				}
			}
		}
	}
}