using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.Mvc;
using Tag4s.Data;

namespace Tag4s.Helpers
{
    /// <summary>
    /// 
    /// </summary>
    public static class Extensions
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dictionary"></param>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <typeparam name="TKey"></typeparam>
        /// <typeparam name="TValue"></typeparam>
        /// <exception cref="ArgumentNullException"></exception>
        /// <returns></returns>
        public static TValue SafeValue<TKey, TValue>(this Dictionary<TKey, TValue> dictionary, TKey key, TValue value)
        {
            if (dictionary.ContainsKey(key))
            {
                return dictionary[key];
            }
            using (var db = new Tag4sEntities())
            {
                var _key = key as string;
                if (_key == null)
                {
                    throw new ArgumentNullException("_key");
                }
                var exists = db.Translations.SingleOrDefault(row => row.Name == _key);
                if (exists == null)
                {
                    exists = new Translation();
                    exists.Name = key as string;
                    exists.EN = key as string;
                    exists.NL = value as string;
                    exists.Id = Guid.NewGuid();
                    db.Translations.Add(exists);
                    db.SaveChanges();
                }
                else
                {
                    if (string.IsNullOrWhiteSpace(exists.EN))
                    {
                        exists.EN = key as string;
                    }
                    if (string.IsNullOrWhiteSpace(exists.NL))
                    {
                        exists.NL = value as string;
                    }
                    if (string.IsNullOrWhiteSpace(exists.DE))
                    {
                        exists.DE = value as string;
                    }
                    db.SaveChanges();

                }
            }
            if (value == null)
                return Activator.CreateInstance<TValue>();
            return value;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="controller"></param>
        /// <param name="imageStream"></param>
        /// <param name="contentType"></param>
        /// <returns></returns>
        public static ImageResult Image(this Controller controller, Stream imageStream, string contentType)
        {
            return new ImageResult(imageStream, contentType);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="controller"></param>
        /// <param name="imageBytes"></param>
        /// <param name="contentType"></param>
        /// <returns></returns>
        public static ImageResult Image(this Controller controller, byte[] imageBytes, string contentType)
        {
            return new ImageResult(new MemoryStream(imageBytes), contentType);
        }
    }




}