Subject: Re: [linux-lvm] [Patch] Latest device-mapper snapshot
Message-ID: <20021024083552.GA1435@fib011235813.fsnet.co.uk>
References: <20021023165627.CZKM23449.imf01bis.bellsouth.net@TAZ2>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021023165627.CZKM23449.imf01bis.bellsouth.net@TAZ2>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Thu Oct 24 03:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Oct 23, 2002 at 12:54:37PM -0400, Greg Freemyer wrote:
> Joe,
> 
> I haven't kept up.
> 
> What is LVM's status relative to the 2.5 feature freeze that is coming up?

We have posted the code a couple of times, the latest time the only
point that came up was that people don't like ioctl interfaces.  So we
are currently planning on submitting again at the end of the week with
a choice of own filesystem based interface (not driverfs) or the
current ioctl one.

dm has its supporters, as does EVMS (I don't agree that only one of
these drivers can go in), it's hard to second guess Linus as to which
he'll merge.

- Joe
