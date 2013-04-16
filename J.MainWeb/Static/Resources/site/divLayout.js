/// <reference path="../jquery/jquery-1.9.0.intellisense.js" />

jQuery.fn.extend({
	divLayout: function (postions)
	{
		//var postions = [
		//	{ id: "A", top: 0, left: 0 },
		//	{ id: "B", top: 0, left: 55 },
		//	{ id: "C", top: 25, left: 0 },
		//	{ id: "D", top: 110, left: 0 },
		//	{ id: "E", top: 110, left: 105 }
		//];

		var $body = $(this),
			MaxHeight = 0;

		for (var i = 0, len = postions.length; i < len; i++)
		{
			var d = postions[i],
				$d = $("#" + d.id, $body),
				tempMaxHeight = d.top + $d.outerHeight();

			if (MaxHeight < tempMaxHeight)
				MaxHeight = tempMaxHeight;

			$d.css({ position: "absolute", top: d.top, left: d.left });
		}

		$body.css("height", MaxHeight);
	}
});

jQuery.extend({
	formValueObject:function(ids)
	{
		var valueList = [];
		for (var i = 0; i < ids.length; i++)
		{
			var id = ids[i];
			var $self = $("#" + id);

			if ($self.length == 0)
				throw "DOM 中不存在ID为 [" + id + "] 的元素。";
			else if ($self.length > 1)
				throw "DOM 中存在" + $self.length + "个ID为 [" + id + "] 的元素。";
			else
			{
				var $element = $self[0];
				switch ($element.nodeName.toLowerCase())
				{
					case "input":
						switch ($element.attr("type"))
						{
							case "reset":
							case "submit":
							case "button":
								break;
							case "text":
							case "password":
							case "hidden":
								valueList.push({ name: $element.attr("name"), value: $element.val() });
								break;
							case "radio":
								valueList.push({ name: $element.attr("name"), value: $(":radio:checked[name='" + $element.attr("name") + "']").val() });
								break;
							case "checkbox":
								var tempList = [];
								$(":checkbox:checked[name='" + $element.attr("name") + "']").each(function ()
								{
									tempList.push(this.value);
								});
								valueList.push({ name: $element.attr("name"), value: tempList });
								break;
							case "image":
							case "file":
								break;
							default:
								break;
						}
						break;
					case "select":
						if ($element.attr("multiple") == "undefined")
						{
							valueList.push({ name: $element.attr("name"), value: $("option:selected", $element).val() });
						}
						else
						{
							var tempList = [];
							$("option:selected", $element).each(function ()
							{
								tempList.push(this.value);
							});
							valueList.push({ name: $element.attr("name"), value: tempList });
						}
						break;
					case "textarea":
						valueList.push({ name: $element.attr("name"), value: $element.val() });
						break;
					default:
						break;
				}
			}
		}
		valueList.sort(function (a, b)
		{
			//按name进行升序排列
			return a.name > b.name ? 1 : -1
		});
		var valueObject = {};
		for (var i = 0; i < valueList.length; i++)
		{
			valueObject[valueList[i].name] = valueList[i].value;
		}
		return valueObject;
	}
});