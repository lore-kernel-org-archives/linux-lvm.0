Return-Path: <scott@dixie.dyndns.org>
Date: Tue, 2 Jan 2001 10:18:55 -0500
Message-Id: <200101021518.f02FItB03895@dixie.dyndns.org>
From: "S. Michael Denton" <scott@dixie.dyndns.org>
Subject: Re: Re: [linux-lvm] 0.8 to 0.9 problems, odd vg corruption
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

jss@evcom.net wrote:
> On Sat, Dec 30, 2000 at 03:11:06PM -0600, Steven Lembark wrote:
> > 
> > > After about half an hour of fiddling with the LVM tools and reading
the
> > > FAQ, I found out that I could access the LV if and ONLY IF I did
EXACTLY
> > > this:
> > > 
> > >	      vgcfgrestore -n data /dev/hd[ac]1
> > >	      pvscan
> > >	      vgchange -a y
> > >	      mount /dev/data/archive
> > > 
> > > Any call to vgscan brings me back to the beginning ("unknown VG").
> > > 
> > > The problem however is this: Since then, even when booting cleanly
vgscan
> > > doesn't detect any VGs any more. Before, it worked. I have compiled
LVM
> > > into the kernel (no module) and attached the Debian startup script
which I
> > > have modified slightly to accommodate for the no-module situation.
> > 
> > 
> > try:
> > 
> >	vgexport /dev/vgname;
> >	vgimport /dev/vgname /devices/in/the/vg;
> > 
> > should save you the problems.  
> 
> I should have tried that, however I did "fix" the problem by copying the
data
> elsewhere (it's on a large external RAID device, so I just created a new
> temporary vg/lv), deleting the original VG, re-creating and copying back.
 All
> appears to be well.

I had the same problem not too long ago when I tried to go from 0.8i (IOP
5) to 0.9x (IOP 10), it was able to recognize that the vgs were exported
but could not import them; there appears to be an on-disk structure change
between IOP 5 and IOP 10 that makes it unable to import an IOP 5 exported
vg... I eventually just backrev'd to 0.8i so I could use my vg's again (not
enough temp space to do a total vg conversion).

> -- 
> Jesse Sipprell
> Technical Operations Director
> Evolution Communications, Inc.
> 800.496.4736
> 
> * Finger jss@evcom.net for my PGP Public Key *
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
> 

--------------------------------------------------------------------------
Scott Denton
smdenton@bellsouth.net
EFNet Handle: SteelWyng
