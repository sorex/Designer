﻿//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace J.Entities
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DBEntities : DbContext
    {
        public DBEntities()
            : base("name=DBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<address> addresses { get; set; }
        public DbSet<designwork> designworks { get; set; }
        public DbSet<materialcolor> materialcolors { get; set; }
        public DbSet<materialpicture> materialpictures { get; set; }
        public DbSet<materialpricelog> materialpricelogs { get; set; }
        public DbSet<material> materials { get; set; }
        public DbSet<materialsize> materialsizes { get; set; }
        public DbSet<materialtype> materialtypes { get; set; }
        public DbSet<orderdetail> orderdetails { get; set; }
        public DbSet<order> orders { get; set; }
        public DbSet<singlelogin> singlelogins { get; set; }
        public DbSet<user> users { get; set; }
    }
}
