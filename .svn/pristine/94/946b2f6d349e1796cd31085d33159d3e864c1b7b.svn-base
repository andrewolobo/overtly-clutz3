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
	public sealed class ProductParsedResult:ParsedResult
	{
		public System.String ProductID
		{
			get
			{
				return productID;
			}
			
		}
		public System.String NormalizedProductID
		{
			get
			{
				return normalizedProductID;
			}
			
		}
		override public System.String DisplayResult
		{
			get
			{
				return productID;
			}
			
		}
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'productID '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.String productID;
		//UPGRADE_NOTE: Final was removed from the declaration of 'normalizedProductID '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.String normalizedProductID;
		
		internal ProductParsedResult(System.String productID):this(productID, productID)
		{
		}
		
		internal ProductParsedResult(System.String productID, System.String normalizedProductID):base(ParsedResultType.PRODUCT)
		{
			this.productID = productID;
			this.normalizedProductID = normalizedProductID;
		}
	}
}