using System.Collections.Generic;
using Tag4s.Data;

namespace Tag4s.Models
{
    /// <summary>
    /// 
    /// </summary>
    public class UserContractRedirectModel
    {
        /// <summary>
        /// 
        /// </summary>
        public UserContractRedirect UserContractRedirect { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public IEnumerable<ContractRedirectParameterModel> ParameterModel { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public IEnumerable<ContractRedirectRedirectTypeModel> RedirectTypeModel { get; set; }
    }
}