using System.Collections.Generic;
using Tag4s.Data;

namespace Tag4s.Models
{
    /// <summary>
    /// 
    /// </summary>
    public class UserContractParametersModel
    {
        /// <summary>
        /// 
        /// </summary>
        public UserContract UserContract { get; set; }


        public UserContractUri UserContractUri { get; set; }
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