Return-Path: <list@showme.wox.org>
Message-ID: <004401c0ef19$ad99c2d0$0f01a8c0@ws1>
From: "Bas" <list@showme.wox.org>
Subject: Re: [linux-lvm] Re: 2.4.5 & Adaptec 7890 U2W Controller solved, LVM0.9.1 b7FAILS.
Date: Thu, 7 Jun 2001 08:18:32 +0200
MIME-Version: 1.0
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

> On 06 Jun 2001 21:44:34 -0700, Bas wrote:
> >
> > ----- Original Message -----
> > From: Seth Mos <knuffie@xs4all.nl>
> > To: Bas <list@showme.wox.org>; <linux-xfs@oss.sgi.com>
> > Cc: <linux-lvm@sistina.com>
> > Sent: Wednesday, June 06, 2001 11:30 AM
> > Subject: [linux-lvm] Re: 2.4.5 & Adaptec 7890 U2W Controller solved, LVM
> > 0.9.1 b7FAILS.
> >
> >
> > > At 18:18 6-6-2001 +0200, Bas wrote:
> > > >You're right. Today I downloaded the default kernel coming from
> > > >ftp.kernel.org. Patched it using 06042001-xfs-patch. It compiled and
it
> > > >runs. But when I patch this kernel to 0.9.1 beta 7, (CVS or standard
> > patch
> > > >makes no difference) it fails to compile.
> > > >
> > > >Now this:
> > > >
> > > >drivers/md/mddev.o: In function `__update_hardblocksize':
> > > >drivers/md/mddev.o(.text+0x22d6): undefined reference to
> > `get_hardblocksize'
> > > >drivers/md/mddev.o(.text+0x2312): undefined reference to
> > `get_hardblocksize'
> > > >make[1]: *** [kallsyms] Error 1
> > > >make: *** [vmlinux] Error 2
> > > >
> > > >How can I fix this.
> > > >
> > > >Thanks again,
> > > >Bas.
> > >
> > > Patch was posted on the list a few days ago
> > >
> > > Here you go
> > >
> > > --- linux-2.4.4/drivers/md/lvm.c.orig   Sun May  6 14:54:39 2001
> > > +++ linux-2.4.4/drivers/md/lvm.c        Sun May  6 14:55:06 2001
> > > @@ -1791,7 +1791,7 @@
> > >          int max_hardblocksize = 0, hardblocksize;
> > >
> > >          for (le = 0; le < lv->lv_allocated_le; le++) {
> > > -               hardblocksize =
> > get_hardblocksize(lv->lv_current_pe[le].dev);
> > > +               hardblocksize =
> > get_hardsect_size(lv->lv_current_pe[le].dev);
> > >                  if (hardblocksize == 0)
> > >                          hardblocksize = 512;
> > >                  if (hardblocksize > max_hardblocksize)
> > > @@ -1801,7 +1801,7 @@
> > >          if (lv->lv_access & LV_SNAPSHOT) {
> > >                  for (e = 0; e < lv->lv_remap_end; e++) {
> > >                          hardblocksize =
> > > -                               get_hardblocksize(
> > > +                               get_hardsect_size(
> > >
> > lv->lv_block_exception[e].rdev_new);
> > >                          if (hardblocksize == 0)
> > >                                  hardblocksize = 512;
> > >
> > > Hope it's complete and ok
> > > Otherwise you can find it the archives under "2.4.5 compiles almost"
> > >
> >
> > Thanks, but nothing there ... (Searched for 2.4.5, almost and browsed
> > throught the list (may & june)). Can't apply this patch by the way.
Thanks,
> > Bas.
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
> Replace `get_hardblocksize` with `get_hardsect_size` there should be 2
> instances of it in lvm.c

Thanks. It works.

>
> P.S. search for "hardsect" & you will see that this has been answered
> before.

Ok, will do that first.

Bas.
