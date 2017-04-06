using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WatcherSistec.Startup))]
namespace WatcherSistec
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
