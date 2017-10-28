using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Travelopedia.Startup))]
namespace Travelopedia
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            
            ConfigureAuth(app);

        }
    }
}
