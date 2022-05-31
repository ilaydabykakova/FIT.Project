using FIT.Project.data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;

namespace FIT.Project
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string prefixText = context.Request.QueryString["term"];
            using (WikiEntities entities = new WikiEntities())
            {
                var tags = entities.Tag.Where(a => a.Keys.Contains(prefixText))
                    .Select(s => new { ID = s.ID, Keys = s.Keys,
                     label = s.Keys
                    }).ToList();

                context.Response.Write(new JavaScriptSerializer().Serialize(tags));
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}