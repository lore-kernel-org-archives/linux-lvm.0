From: Craig Tierney <ctierney@hpti.com>
Subject: Re: [linux-lvm] Can no longer mount lvm striped volume
Message-Id: <20020502150302.H4131@hpti.com>
References: <20020502121825.B3956@hpti.com>
    <Pine.SGI.4.33.0205021333290.5694922-100000@erc2000.erc.wisc.edu>
    <20020502130722.E4053@hpti.com> <20020502193610.GA810@tykepenguin.com>
    <20020502134547.A4131@hpti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020502134547.A4131@hpti.com>; from ctierney@hpti.com on
    Thu, May 02, 2002 at 01:45:47PM -0600
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
Date: Thu May  2 16:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Problem solved.  I rebooted the node, and I still had problems.
Then I explicitly ran "vgchange -a y sdd_vol4".  That seemed to
do the trick.  My startup scripts do run "vgchange -a y" which
wasn't adequate.

Thanks for the help.
Craig



> On Thu, May 02, 2002 at 08:36:10PM +0100, Patrick Caulfield wrote:
> > On Thu, May 02, 2002 at 01:07:22PM -0600, Craig Tierney wrote:
> > > Things are getting better.  I found 2 of the
> > > 3 lv's that were missing.  I am trying to find the last
> > > one.  
> > 
> > Try vgscan -f, it will replace all the LV numbers with new ones rather than try
> > to preserve them.
> 
> I tried vgscan -f, but it did not help.
> 
> I get different results if I run vgdisplay with and without
> the -D option.  With the -D option, the volume group looks correct.
> I did remember to update the lvm tools and not just the kernel
> patch.
> 
> (The wrong results)
> [root@x05 /root]# vgdisplay -v sdd_vol4
> --- Volume group ---
> VG Name               sdd2_vol12 
> VG Access             read/write
> VG Status             available/resizable
> VG #                  19
> MAX LV                255
> Cur LV                0
> Open LV               0
> MAX LV Size           511.98 GB
> Max PV                255
> Cur PV                1
> Act PV                1
> VG Size               499.98 GB
> PE Size               8 MB
> Total PE              63998
> Alloc PE / Size       0 / 0
> Free  PE / Size       63998 / 499.98 GB
> VG UUID               f9oa9Y-OsTL-Yypp-2KCK-kVzG-Vinb-c2eQlg
> 
> --- No logical volumes in "sdd2_vol12" ---
> 
> 
> --- Physical volumes ---
> PV Name (#)           /dev/sdaa (1)
> PV Status             available / allocatable
> Total PE / Free PE    63998 / 63998
> 
> 
> (The right results)
> [root@x05 /root]# vgdisplay -D -v sdd_vol4
> --- Volume group ---
> VG Name               sdd_vol4 
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  19
> MAX LV                255
> Cur LV                1
> Open LV               0
> MAX LV Size           511.98 GB
> Max PV                255
> Cur PV                2
> Act PV                2
> VG Size               488.27 GB
> PE Size               8 MB
> Total PE              62498
> Alloc PE / Size       62498 / 488.27 GB
> Free  PE / Size       0 / 0
> VG UUID               cBSzp4-kauE-Tv0N-SC3r-6mAi-RGw0-zwTbDC
> 
> --- Logical volume ---
> LV Name                /dev/sdd_vol4/lv1
> VG Name                sdd_vol4
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 0
> LV Size                488.27 GB
> Current LE             62498
> Allocated LE           62498
> Stripes                2
> Stripe size (KByte)    64
> Allocation             next free
> Read ahead sectors     10000
> Block device           58:7
> 
> 
> --- Physical volumes ---
> PV Name (#)           /dev/sdo (1)
> PV Status             NOT available / allocatable
> Total PE / Free PE    31249 / 0
> 
> PV Name (#)           /dev/sdh (2)
> PV Status             NOT available / allocatable
> Total PE / Free PE    31249 / 0
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
Craig Tierney (ctierney@hpti.com)
