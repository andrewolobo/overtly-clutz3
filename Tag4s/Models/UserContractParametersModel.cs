using System.Collections.Generic;
using Tag4s.Data;

namespace Tag4s.Models
{
    public class UserContractParametersModel
    {
        public UserContract UserContract { get; set; }
        public UserContractUri UserContractUri { get; set; }
        public IEnumerable<ContractRedirectParameterModel> ParameterModel { get; set; }
        public IEnumerable<ContractRedirectRedirectTypeModel> RedirectTypeModel { get; set; }
    }
}