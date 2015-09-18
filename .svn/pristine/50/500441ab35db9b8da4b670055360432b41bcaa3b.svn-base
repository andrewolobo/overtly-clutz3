using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;


namespace Tag4s.Data
{
    public partial class UserContractLog
    {
        private Dictionary<string, string> _localUserAgent;

        public Dictionary<string, string> LocalUserAgent
        {
            get
            {
                if (_localUserAgent == null)
                {
                    var userAgentSplit = UserAgent.Split(';');
                    foreach (var dictionarySplit in userAgentSplit)
                    {
                        var userDictionarySplit = dictionarySplit.Split(':');
                        _localUserAgent.Add(userDictionarySplit[0],userDictionarySplit[1]);
                    }
                }

                return _localUserAgent;
            }
        }
    }

    public class UserContractLogMetaData
    {
    }
}