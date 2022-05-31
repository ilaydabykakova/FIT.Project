using FIT.Project.data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;

namespace FIT.Project.Pages
{
    public partial class Form : System.Web.UI.Page
    {

        WikiEntities entities = new WikiEntities();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private int CheckTag(string tagName)
        {
            var tag = entities.Tag.Where(a => a.Keys == tagName).FirstOrDefault();

            if (tag != null)
                return tag.ID;
            else
                return -1;
        }

        private int CheckUser(string username)
        {
            var result = entities.User.Where(a => a.Adi == username).FirstOrDefault();

            if (result != null)
                return result.ID;
            else
                return -1;
        }

        private int SaveTag(string etiket)
        {
            Tag tag = new Tag
            {
                Keys = etiket,
            };

            entities.Tag.Add(tag);
            entities.SaveChanges();

            return tag.ID;
        }

        private int SaveUser(string username, string mail)
        {
            User user = new User();
            user.Adi = username;
            user.EPosta = mail;

            entities.User.Add(user);
            entities.SaveChanges();

            return user.ID;
        }

        private int SaveEntry(string baslik, string icerik, int userid)
        {
            Entry entry = new Entry
            {
                Baslik = baslik,
                Icerik = icerik,
                UserID = userid
            };

            entities.Entry.Add(entry);
            entities.SaveChanges();

            return entry.ID;
        }

        private void SaveEntryTag(int entryID, List<int> tagIDList)
        {
            foreach (var item in tagIDList)
            {
                EntryTag tag = new EntryTag
                {
                    EnrtyID = entryID,
                    TagID = item
                };

                entities.EntryTag.Add(tag);
                entities.SaveChanges();
            }
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            #region ETİKET KONTROL VE KAYIT

            List<int> tagIDList = new List<int>();
            string[] etiketler = txtEtiket.Text.Trim().Split(',');

            foreach (var item in etiketler)
            {
                int tagid = CheckTag(item.Trim());

                if (tagid < 0)
                {
                    tagid = SaveTag(item.Trim());
                }

                tagIDList.Add(tagid);
            }

            #endregion

            #region USER KONTROL VE KAYIT

            int userid = CheckUser(txtKullanici.Text.Trim());

            if (userid < 0)
            {
                userid = SaveUser(txtKullanici.Text.Trim(), "");
            }

            #endregion

            int icerikID = SaveEntry(txtBaslik.Text.Trim(), ckeditor.Text, userid);

            SaveEntryTag(icerikID, tagIDList);

            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string contentType = FileUpload1.PostedFile.ContentType;
            using (Stream fs = FileUpload1.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    Document doc = new Document();
                    doc.EntryID = icerikID;
                    doc.BinaryData = bytes;

                    entities.Document.Add(doc);
                    entities.SaveChanges();
                }
            }
        }

    }

}