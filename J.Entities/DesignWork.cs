//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class designwork
    {
        public designwork()
        {
            this.orders = new HashSet<order>();
        }
    
        public string GUID { get; set; }
        public string DesignerID { get; set; }
        public string MaterialID { get; set; }
        public string MaterialColorID { get; set; }
        public int SalesGoal { get; set; }
        public decimal BasePrice { get; set; }
        public decimal SellingPrice { get; set; }
        public System.DateTime StartTime { get; set; }
        public System.DateTime EndTime { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }
        public Nullable<int> SalesVolume { get; set; }
        public int State { get; set; }
        public Nullable<decimal> ProcurementCost { get; set; }
        public Nullable<decimal> ProductionCost { get; set; }
        public Nullable<decimal> SendCost { get; set; }
        public Nullable<System.DateTime> CompletionTime { get; set; }
    
        public virtual user user { get; set; }
        public virtual material material { get; set; }
        public virtual materialcolor materialcolor { get; set; }
        public virtual ICollection<order> orders { get; set; }
    }
}
