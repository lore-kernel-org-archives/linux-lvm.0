Message-ID: <1106275121.41f06b3135b75@www.eiler.net>
Date: Thu, 20 Jan 2005 18:38:41 -0800
From: joe@eiler.net
Subject: Re: [linux-lvm] Data corruption on large, multi-device filesystem
References: <20050118091059.GC27553@pcnocjb.dlan.cinetic.de>
	<1106172883.41eedbd386498@www.eiler.net>
	<20050120165317.GA14093@agk.surrey.redhat.com>
In-Reply-To: <20050120165317.GA14093@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>, Alasdair G Kergon <agk@redhat.com>

Thanks, I'll give it(the patch you sent) a try and let you know what I see.

When you say "chunk size" what lvcreate arg does that map to? the stripe
size(-I) or the chunk size(-c) that goes along with snapshots?

Joe

Quoting Alasdair G Kergon <agk@redhat.com>:

> On Wed, Jan 19, 2005 at 02:14:43PM -0800, joe@eiler.net wrote:
> > I don't see any corruption on the files unless I specify the -i option to
> > lvcreate.
>
> That's a useful observation: different code gets run when -i is used, and
> I've taken a look and there are two 32-bit limits in that code.
>
> One appears to be intentional for performance reasons and can be worked
> around by increasing the chunk size (default 64K), though it really should
> detect when the limit is exceeded and tell you!
>
> The other unintentional limit (which is the one affecting you I think)
> leads to wrap-around at striped device offsets beyond ~2^32 sectors
> i.e. 2^39 bytes into a PV, or ~2^40 bytes (2TB) into an LV in your
> case of 2 stripes.  The fix for that is a basic exercise in C.
> [Ref.  stripe_map() in drivers/md/dm-stripe.c]
>
> Alasdair
> --
> agk@redhat.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
