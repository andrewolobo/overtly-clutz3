using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Tag4s.Helpers
{
    public static class SessionExtensions
    {
        /// <summary>
        /// Replaces an element in the session-state collection.
        /// If session-state collection does not contain the element the specified key - value pair will be added
        /// No exception is thrown.
        /// </summary>
        public static void Replace(this HttpSessionStateBase session, string key, object val)
        {
            if (string.IsNullOrEmpty(key)) return;

            session.Remove(key);
            session.Add(key, val);
        }

        /// <summary>
        /// Returns the session-state collection for given key.
        /// If the session-state collection does not contain the key, the collection remains unchanged. 
        /// No exception is thrown.
        /// </summary>
        public static object Pop(this HttpSessionStateBase session, string key)
        {
            if (string.IsNullOrEmpty(key)) return null;

            var val = session[key];
            session.Remove(key);

            return val;
        }
    }
}