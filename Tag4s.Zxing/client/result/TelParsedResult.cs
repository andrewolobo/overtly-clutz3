/*

*



*

*





*/
using System;
namespace Tag4s.Zxing.client.result
{
	
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	public sealed class TelParsedResult:ParsedResult
	{
		public System.String Number
		{
			get
			{
				return number;
			}
			
		}
		public System.String TelURI
		{
			get
			{
				return telURI;
			}
			
		}
		public System.String Title
		{
			get
			{
				return title;
			}
			
		}
		override public System.String DisplayResult
		{
			get
			{
				System.Text.StringBuilder result = new System.Text.StringBuilder(20);
				maybeAppend(number, result);
				maybeAppend(title, result);
				return result.ToString();
			}
			
		}
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'number '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.String number;
		//UPGRADE_NOTE: Final was removed from the declaration of 'telURI '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.String telURI;
		//UPGRADE_NOTE: Final was removed from the declaration of 'title '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.String title;
		
		public TelParsedResult(System.String number, System.String telURI, System.String title):base(ParsedResultType.TEL)
		{
			this.number = number;
			this.telURI = telURI;
			this.title = title;
		}
	}
}