/*

*



*

*





*/
using System;
namespace Tag4s.Zxing.client.result
{
	
	/// <author>  jbreiden@google.com (Jeff Breidenbach)
	/// </author>
	/// <author>
	/// </author>
	public sealed class ISBNParsedResult:ParsedResult
	{
		public System.String ISBN
		{
			get
			{
				return isbn;
			}
			
		}
		override public System.String DisplayResult
		{
			get
			{
				return isbn;
			}
			
		}
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'isbn '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.String isbn;
		
		internal ISBNParsedResult(System.String isbn):base(ParsedResultType.ISBN)
		{
			this.isbn = isbn;
		}
	}
}