Return-Path: <austin@coremetrics.com>
Date: Wed, 30 May 2001 16:30:02 -0500 (CDT)
From: Austin Gonyou <austin@coremetrics.com>
Subject: Re: [linux-lvm] Re: Help! Upgrade 2.2.18 -> 2.4.4 killed a PV
In-Reply-To: <991255964.19428.3.camel@jesseDEB>
Message-ID: <Pine.LNX.4.33.0105301629400.17597-100000@UberGeek.coremetrics.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Kewl. That's it! Thanks a lot. Now I can try to debug my other problem.

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com

On Wed, 30 May 2001, Jesse Stockall wrote:

> On 30 May 2001 15:17:50 -0500, Austin Gonyou wrote:
> > Recompiling an XFS 2.4.5 tree, after patching with LVM 0.9.1b7, which
> went
> > fine except for the drivers/md/Makefile( stuff already exists in this
> > tree), no other changes, checked the .rej file, I get the following
> > failure when trying to make the kernel:
> >
> > drivers/md/mddev.o: In function `__update_hardblocksize':
> > drivers/md/mddev.o(.text+0xaba1): undefined reference to
> > `get_hardblocksize'
> > drivers/md/mddev.o(.text+0xabed): undefined reference to
> > `get_hardblocksize'
> > make[1]: *** [kallsyms] Error 1
> > make[1]: Leaving directory `/usr/src/linux-2.4-xfs/linux'
> > make: *** [vmlinux] Error 2
> >
> > Any ideas?
> >
> > --
> > Austin Gonyou
> > Systems Architect, CCNA
> > Coremetrics, Inc.
> > Phone: 512-796-9023
> > email: austin@coremetrics.com
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
> I had the same problem a couple of nights ago.
>
> Replace `get_hardblocksize` with `get_hardsect_size` there should be 2
> instances of it in lvm.c
>
> Enjoy
>
>
