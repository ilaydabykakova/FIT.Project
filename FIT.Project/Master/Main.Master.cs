using FIT.Project.data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Data.SqlClient;

namespace FIT.Project
{
    public partial class Main : System.Web.UI.MasterPage
    {
           WikiEntities db = new WikiEntities();
        public void Get(int TagID)
        {
            db = new WikiEntities();
            
            var con1 = (from A in db.EntryTag
                        join E in db.Entry on A.EnrtyID
                        equals E.ID
                        join T in db.Tag on A.TagID
                        equals T.ID 
                        group A by T into g
                        select new
                        {  
                            TagID=g.Key.ID,
                            g.Key.Keys,                           
                            ID = g.Count(),
                        }).ToList();
   

            //db.EntryTag.Where(a=>a.EnrtyID==a.Entry.ID).Where(a=>a.TagID==a.Tag.ID).GroupBy(a=>a.Tag).Select( g=> new { g.Key.ID == TagID, })



            Repeater1.DataSource = con1;
            Repeater1.DataBind();
           
        }
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var tagsList = db.Tag.ToList();
              
                int tagID = Convert.ToInt32(Request.QueryString["TagID"]);
            
                Get(tagID);

            }
            
            
        }
    
       

    }
}   
     