using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace SGUMusicShop.Models
{
    public class CommonInfo
    {
        private QLSSNDKEntities db;
        public CommonInfo()
        {
            this.db = new QLSSNDKEntities();
        }
        public IEnumerable<Part> BoPhan
        {
            get
            {
                return this.db.Parts;
            }
        }
        public IEnumerable<Brand> ThuongHieu
        {
            get
            {
                return this.db.Brands;
            }
        }
        public IEnumerable<SanPham> SanPhamMoi(int n)
        {
            return this.db.SanPhams;
        }
        public IEnumerable<SanPham> SanPhamGuitar(int n)
        {
            return db.SanPhams.OrderByDescending(x => x.MaParts == 1).Take(n);
        }
        public IEnumerable<SanPham> SanPhamViolin(int n)
        {
            return db.SanPhams.OrderByDescending(x => x.MaParts == 2).Take(n);
        }
        public IEnumerable<SanPham> SanPhamPiano(int n)
        {
            return db.SanPhams.OrderByDescending(x => x.MaParts == 3).Take(n);
        }
        public IEnumerable<SanPham> SanPhamOrgan(int n)
        {
            return db.SanPhams.OrderByDescending(x => x.MaParts == 4).Take(n);
        }
        public IEnumerable<SanPham> SanPhamHarmonica(int n)
        {
            return db.SanPhams.OrderByDescending(x => x.MaParts == 5).Take(n);
        }
        public IEnumerable<SanPham> SanPhamDrum(int n)
        {
            return db.SanPhams.OrderByDescending(x => x.MaParts == 6).Take(n);
        }
    }
}