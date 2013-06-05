using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace J.BusinessLogics.Basic
{
	public class DynamicContractResolver : DefaultContractResolver
	{
		private readonly Dictionary<string, List<string>> TypeAndProperties;
		public DynamicContractResolver(Dictionary<string, List<string>> TypeAndProperties)
		{
			this.TypeAndProperties = TypeAndProperties;
		}

		protected override IList<JsonProperty> CreateProperties(Type type, MemberSerialization memberSerialization)
		{
			IList<JsonProperty> properties = base.CreateProperties(type, memberSerialization);

			List<string> CurrentList = new List<string>(); ;
			if (TypeAndProperties.ContainsKey(type.Name))
				CurrentList = TypeAndProperties[type.Name];
			else if (TypeAndProperties.ContainsKey(type.BaseType.Name))
				CurrentList = TypeAndProperties[type.BaseType.Name];

			properties = properties.Where(p => CurrentList.Contains(p.PropertyName)).ToList();

			return properties;
		}
	}
}
