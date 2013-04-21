using System.Web;
using System.Web.Optimization;

namespace J.MainWeb
{
	public class BundleConfig
	{
		// 有关 Bundling 的详细信息，请访问 http://go.microsoft.com/fwlink/?LinkId=254725
		public static void RegisterBundles(BundleCollection bundles)
		{
			#region CSS
			#region Site CSS
			bundles.Add(new StyleBundle("~/Static/Resources/site/css").Include(
						"~/Static/Resources/site/reset.css",
						"~/Static/Resources/site/site.css"));
			#endregion

			#region jquery ui CSS
			bundles.Add(new StyleBundle("~/Static/Resources/jquery-ui/css").Include(
						"~/Static/Resources/jquery-ui/jquery-ui-{version}.css",
						"~/Static/Resources/jquery-ui/freehand.css"));
			#endregion

			#region jquery layout CSS
			bundles.Add(new StyleBundle("~/Static/Resources/jquery.layout/css").Include(
						"~/Static/Resources/jquery.layout/layout-default.css"));
			#endregion

			#region uploadify CSS
			bundles.Add(new StyleBundle("~/Static/Resources/uploadify/css").Include(
						"~/Static/Resources/uploadify/uploadify.css"));
			#endregion
			#endregion

			#region JS
			#region Modernizr
			// 使用 Modernizr 的开发版本进行开发和了解信息。然后，当你做好
			// 生产准备时，请使用 http://modernizr.com 上的生成工具来仅选择所需的测试。
			bundles.Add(new ScriptBundle("~/Static/Resources/modernizr/js").Include(
						"~/Static/Resources/modernizr/modernizr-*"));
			#endregion

			#region jquery
			bundles.Add(new ScriptBundle("~/Static/Resources/jquery/js").Include(
						"~/Static/Resources/jquery/jquery-{version}.js",
						"~/Static/Resources/jquery/jquery-migrate-{version}.js"));
			#endregion

			#region jquery ui
			bundles.Add(new ScriptBundle("~/Static/Resources/jquery-ui/js").Include(
						"~/Static/Resources/jquery-ui/jquery-ui-{version}.js",
						"~/Static/Resources/jquery-ui/jquery.ui.datepicker-zh-CN.js"));
			#endregion

			#region jquery validate
			//bundles.Add(new ScriptBundle("~/Static/Resources/jquery.validate/files").Include(
			//			"~/Static/Resources/jquery.validate/jquery.validate*"));
			#endregion

			#region jquery layout
			bundles.Add(new ScriptBundle("~/Static/Resources/jquery.layout/js").Include(
						"~/Static/Resources/jquery.layout/jquery.layout*"));
			#endregion

			#region json2
			bundles.Add(new ScriptBundle("~/Static/Resources/json2/js").Include(
						"~/Static/Resources/json2/json2.js"));
			#endregion

			#region uploadify
			bundles.Add(new ScriptBundle("~/Static/Resources/uploadify/js").Include(
						"~/Static/uploadify/Resources/jquery.uploadify.js"));
			#endregion

			#region extendjs
			bundles.Add(new ScriptBundle("~/Static/Resources/extendjs/js").Include(
						"~/Static/Resources/extendjs/extendjs*"));
			#endregion
			#endregion


		}
	}
}