using System.Linq;

namespace PuestoDeQuipes.Models
{
    public class InMemoryUserStore
    {
           private static System.Collections.Concurrent.ConcurrentBag<FacebookUser> users = new System.Collections.Concurrent.ConcurrentBag<FacebookUser>();

            public static void Add(FacebookUser user)
            {
                if (users.SingleOrDefault(u => u.FacebookId == user.FacebookId) != null)
                {
                    return;
                   // throw new InvalidOperationException("User already exists.");
                }

                users.Add(user);
            }

            public static FacebookUser Get(string facebookId)
            {
                return users.SingleOrDefault(u => u.FacebookId == facebookId);
            }

            public static FacebookUser GetUser()
            {
                return users.SingleOrDefault();
            }

        }
}