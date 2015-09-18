/*
* Copyright 2007 ZXing authors
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
	public sealed class EmailAddressParsedResult:ParsedResult
	{
		public System.String EmailAddress
		{
			get
			{
				return emailAddress;
			}
			
		}
		public System.String Subject
		{
			get
			{
				return subject;
			}
			
		}
		public System.String Body
		{
			get
			{
				return body;
			}
			
		}
		public System.String MailtoURI
		{
			get
			{
				return mailtoURI;
			}
			
		}
		override public System.String DisplayResult
		{
			get
			{
				System.Text.StringBuilder result = new System.Text.StringBuilder(30);
				maybeAppend(emailAddress, result);
				maybeAppend(subject, result);
				maybeAppend(body, result);
				return result.ToString();
			}
			
		}
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'emailAddress '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.String emailAddress;
		//UPGRADE_NOTE: Final was removed from the declaration of 'subject '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.String subject;
		//UPGRADE_NOTE: Final was removed from the declaration of 'body '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.String body;
		//UPGRADE_NOTE: Final was removed from the declaration of 'mailtoURI '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.String mailtoURI;
		
		internal EmailAddressParsedResult(System.String emailAddress, System.String subject, System.String body, System.String mailtoURI):base(ParsedResultType.EMAIL_ADDRESS)
		{
			this.emailAddress = emailAddress;
			this.subject = subject;
			this.body = body;
			this.mailtoURI = mailtoURI;
		}
	}
}