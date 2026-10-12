using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace EstateX
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            // The project's own "Properties" folder (AssemblyInfo.cs) sits in the
            // web root, so ASP.NET sees "/Properties" as an existing directory and
            // skips routing for it - which shadows Properties.aspx and ends in a
            // 403. Routing paths that already exist lets the friendly URL win;
            // static files still fall through, because the friendly-URL resolver
            // only claims a path when it maps to a page.
            routes.RouteExistingFiles = true;

            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);
        }
    }
}
