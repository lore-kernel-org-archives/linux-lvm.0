Return-Path: <Jesse@cryptocard.com>
Subject: Re: [linux-lvm] Re: 2.4.5 & Adaptec 7890 U2W Controller solved, LVM
	0.9.1 b7FAILS.
From: Jesse Stockall <jesse@cryptocard.com>
In-Reply-To: <006201c0ef0c$8c9fc1e0$0e01a8c0@myplace.net>
References: 
	<Pine.BSF.4.33.0106041350560.1884-100000@rogue.tripp.org><01060413285600.099
	
	44@garfield.linux.localdomain><011501c0ed31$58a54360$0f01a8c0@ws1><200106051
	 02551.Z97441@boing.melbourne.sgi.com><3B1CE383.DCFED687@niehs.nih.gov>
	<4.3.2.7.2.20010606202731.0346bad0@pop.xs4all.nl> 
	<006201c0ef0c$8c9fc1e0$0e01a8c0@myplace.net>
Date: 06 Jun 2001 16:47:16 -0400
Message-Id: <991860437.18865.6.camel@jesseDEB>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On 06 Jun 2001 21:44:34 -0700, Bas wrote:
> 
> ----- Original Message -----
> From: Seth Mos <knuffie@xs4all.nl>
> To: Bas <list@showme.wox.org>; <linux-xfs@oss.sgi.com>
> Cc: <linux-lvm@sistina.com>
> Sent: Wednesday, June 06, 2001 11:30 AM
> Subject: [linux-lvm] Re: 2.4.5 & Adaptec 7890 U2W Controller solved, LVM
> 0.9.1 b7FAILS.
> 
> 
> > At 18:18 6-6-2001 +0200, Bas wrote:
> > >You're right. Today I downloaded the default kernel coming from
> > >ftp.kernel.org. Patched it using 06042001-xfs-patch. It compiled and it
> > >runs. But when I patch this kernel to 0.9.1 beta 7, (CVS or standard
> patch
> > >makes no difference) it fails to compile.
> > >
> > >Now this:
> > >
> > >drivers/md/mddev.o: In function `__update_hardblocksize':
> > >drivers/md/mddev.o(.text+0x22d6): undefined reference to
> `get_hardblocksize'
> > >drivers/md/mddev.o(.text+0x2312): undefined reference to
> `get_hardblocksize'
> > >make[1]: *** [kallsyms] Error 1
> > >make: *** [vmlinux] Error 2
> > >
> > >How can I fix this.
> > >
> > >Thanks again,
> > >Bas.
> >
> > Patch was posted on the list a few days ago
> >
> > Here you go
> >
> > --- linux-2.4.4/drivers/md/lvm.c.orig   Sun May  6 14:54:39 2001
> > +++ linux-2.4.4/drivers/md/lvm.c        Sun May  6 14:55:06 2001
> > @@ -1791,7 +1791,7 @@
> >          int max_hardblocksize = 0, hardblocksize;
> >
> >          for (le = 0; le < lv->lv_allocated_le; le++) {
> > -               hardblocksize =
> get_hardblocksize(lv->lv_current_pe[le].dev);
> > +               hardblocksize =
> get_hardsect_size(lv->lv_current_pe[le].dev);
> >                  if (hardblocksize == 0)
> >                          hardblocksize = 512;
> >                  if (hardblocksize > max_hardblocksize)
> > @@ -1801,7 +1801,7 @@
> >          if (lv->lv_access & LV_SNAPSHOT) {
> >                  for (e = 0; e < lv->lv_remap_end; e++) {
> >                          hardblocksize =
> > -                               get_hardblocksize(
> > +                               get_hardsect_size(
> >
> lv->lv_block_exception[e].rdev_new);
> >                          if (hardblocksize == 0)
> >                                  hardblocksize = 512;
> >
> > Hope it's complete and ok
> > Otherwise you can find it the archives under "2.4.5 compiles almost"
> >
> 
> Thanks, but nothing there ... (Searched for 2.4.5, almost and browsed
> throught the list (may & june)). Can't apply this patch by the way. Thanks,
> Bas.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

Replace `get_hardblocksize` with `get_hardsect_size` there should be 2
instances of it in lvm.c 

P.S. search for "hardsect" & you will see that this has been answered
before.

-- 
 Jesse Stockall                 |       Tel: 1+ 613.599.2441 ext. 243
 CRYPTOCard Corporation         |       Fax: 1+ 613.599.2442            
 Suite 304, 300 March Rd.       |       email: jesse@cryptocard.com
 Ottawa, ON, Canada K2K 2E2     |       web: www.cryptocard.com 
---------------------------------------------------------------------
