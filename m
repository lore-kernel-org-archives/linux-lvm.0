Subject: Re: [linux-lvm] Re: [lvm-devel] [ANNOUNCE] LVM reimplementation
    ready for beta testing
Message-Id: <20020130230150.C7763@fib011235813.fsnet.co.uk>
References: <20020130202254.A7364@fib011235813.fsnet.co.uk>
    <20020130145408.I763@lynx.adilger.int> <1012428221.1750.253.camel@lapcat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1012428221.1750.253.camel@lapcat>; from Jim@mcdee.net on Wed,
    Jan 30, 2002 at 10:03:40PM +0000
From: Joe Thornber <thornber@fib011235813.fsnet.co.uk>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Jan 31 03:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim McDonald <Jim@mcdee.net>
Cc: Andreas Dilger <adilger@turbolabs.com>, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, lvm-devel@sistina.com

On Wed, Jan 30, 2002 at 10:03:40PM +0000, Jim McDonald wrote:
> Also, does/where does this fit in with EVMS?

EVMS differs from us in that they seem to be trying to move the whole
application into the kernel, whereas we've taken the opposite route
and stripped down the kernel side to just provide services.

This is fine, I think there's room for both projects.  But it is worth
noting that EVMS could be changed to use device-mapper for it's low
level functionality.  That way they could take advantage of the cool
work we're doing with snapshots and pvmove, and we could take
advantage of having more eyes on the core driver.

LVM2 may not seem that exciting initially, since the first release is
just concentrating on reproducing LVM1 functionality.  But a lot of
the reason for this rewrite is to enable us to add in the new features
that we want (such as a transaction based disk format).  It's on this
new feature list that we'll be mainly competing with EVMS.

- Joe
