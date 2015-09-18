/*
* Copyright 2007 ZXing authors
*



*

*





*/
using System;
namespace Tag4s.Zxing.client.result
{
	
	/// <summary> A simple result type encapsulating a string that has no further
	/// interpretation.
	/// 
	/// </summary>
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	public sealed class TextParsedResult:ParsedResult
	{
		public System.String Text
		{
			get
			{
				return text;
			}
			
		}
		public System.String Language
		{
			get
			{
				return language;
			}
			
		}
		override public System.String DisplayResult
		{
			get
			{
				return text;
			}
			
		}
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'text '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.String text;
		//UPGRADE_NOTE: Final was removed from the declaration of 'language '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.String language;
		
		public TextParsedResult(System.String text, System.String language):base(ParsedResultType.TEXT)
		{
			this.text = text;
			this.language = language;
		}
	}
}