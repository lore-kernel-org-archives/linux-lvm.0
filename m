Return-Path: <jss@kevorkian.evcom.net>
From: Jesse Sipprell <jss@evcom.net>
Date: Tue, 2 Jan 2001 09:36:16 -0500
Subject: Re: [linux-lvm] 0.8 to 0.9 problems, odd vg corruption
Message-ID: <20010102093616.A3827@kevorkian.evcom.net>
References: <20001227165905.A24456@kevorkian.evcom.net> <20001230190420.B6496@jensbenecke.de> <3A4E4F6A.8AE39C23@wrkhors.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3A4E4F6A.8AE39C23@wrkhors.com>; from lembark@wrkhors.com on Sat, Dec 30, 2000 at 03:11:06PM -0600
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

On Sat, Dec 30, 2000 at 03:11:06PM -0600, Steven Lembark wrote:
> 
> > After about half an hour of fiddling with the LVM tools and reading the
> > FAQ, I found out that I could access the LV if and ONLY IF I did EXACTLY
> > this:
> > 
> >         vgcfgrestore -n data /dev/hd[ac]1
> >         pvscan
> >         vgchange -a y
> >         mount /dev/data/archive
> > 
> > Any call to vgscan brings me back to the beginning ("unknown VG").
> > 
> > The problem however is this: Since then, even when booting cleanly vgscan
> > doesn't detect any VGs any more. Before, it worked. I have compiled LVM
> > into the kernel (no module) and attached the Debian startup script which I
> > have modified slightly to accommodate for the no-module situation.
> 
> 
> try:
> 
> 	vgexport /dev/vgname;
> 	vgimport /dev/vgname /devices/in/the/vg;
> 
> should save you the problems.  

I should have tried that, however I did "fix" the problem by copying the data
elsewhere (it's on a large external RAID device, so I just created a new
temporary vg/lv), deleting the original VG, re-creating and copying back.  All
appears to be well.

-- 
Jesse Sipprell
Technical Operations Director
Evolution Communications, Inc.
800.496.4736

* Finger jss@evcom.net for my PGP Public Key *
