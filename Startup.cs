using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TesterukASP.Startup))]
namespace TesterukASP
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
