Return-Path: <mjt@tls.msk.ru>
Message-ID: <3A2BAD46.F2A21349@tls.msk.ru>
Date: Mon, 04 Dec 2000 17:42:14 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Using Oracle with lvm AND rawio: read(512) from
References: <200012020529.WAA00876@lynx.turbolabs.com> <3A298498.86AB907B@tls.msk.ru> <3A29A31E.BC6A6243@tls.msk.ru> <3A2B58EA.71F92196@tls.msk.ru> <3A2BA6C4.A752DBE8@freeler.nl>
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


Jorg de Jong wrote:
> 
> Hi Michael,
> 
> I had a look at you original message and I found two things;
> 
> - the man page of raw says that you can not use dd on a raw device !?!

This is because of (possible) alignment problems.  Dd command that I use aligns
data accordingly, it seemed to be.  At least I didn't noticied any problems
using it with plain "rawed" partitions, as shown by my examples, and it
works well with raw device on top of lvm volume, as long as I specify
block size 1024, 2048 etc, but NOT with 512 (default) blocksize.

> - further more I suspect that it might be the case that our logical volume is
> to small to create the requested table on.

I'd think that 128Mb volume is sufficient for 10Mb tablespace... ;)

> The oracle documentation says on the subject :
> 
> >Raw Device Setup
> >
> >Keep in mind the following items when creating raw devices:
> >
> >    When creating the volumes, ensure that the owner and group are oracle and oinstall, respectively.

If oinstall group used at all.  That devices simple should be read/writable by
oracle process owner, that's ok in my case:
  # ls -l /dev/raw/raw100
  crw-rw----    1 oracle   disk     162, 100 Aug 14 19:26 /dev/raw/raw100
  # _
If it where due to permissions problems, then plain partitions also
should not work (them works well), and oracle should return "permission
denied" error (that it does if I change permissions).

Regards,
 Michael.
