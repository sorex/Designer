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
    
    public partial class materialpricelog
    {
        public string GUID { get; set; }
        public string MaterialID { get; set; }
        public decimal Price { get; set; }
        public System.DateTime CreateTime { get; set; }
    
        public virtual material material { get; set; }
    }
}
