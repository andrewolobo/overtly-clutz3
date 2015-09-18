/*

*



*

*





*/
using System;
using ParsedResult = Tag4s.Zxing.client.result.ParsedResult;
using ParsedResultType = Tag4s.Zxing.client.result.ParsedResultType;
namespace Tag4s.Zxing.client.result.optional
{
	
	/// <author>  
	/// </author>
	/// <author>
	/// </author>
	public sealed class NDEFSmartPosterParsedResult:ParsedResult
	{
		public System.String Title
		{
			get
			{
				return title;
			}
			
		}
		public System.String URI
		{
			get
			{
				return uri;
			}
			
		}
		public int Action
		{
			get
			{
				return action;
			}
			
		}
		override public System.String DisplayResult
		{
			get
			{
				if (title == null)
				{
					return uri;
				}
				else
				{
					return title + '\n' + uri;
				}
			}
			
		}
		
		public const int ACTION_UNSPECIFIED = - 1;
		public const int ACTION_DO = 0;
		public const int ACTION_SAVE = 1;
		public const int ACTION_OPEN = 2;
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'title '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.String title;
		//UPGRADE_NOTE: Final was removed from the declaration of 'uri '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.String uri;
		//UPGRADE_NOTE: Final was removed from the declaration of 'action '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private int action;
		
		internal NDEFSmartPosterParsedResult(int action, System.String uri, System.String title):base(ParsedResultType.NDEF_SMART_POSTER)
		{
			this.action = action;
			this.uri = uri;
			this.title = title;
		}
	}
}