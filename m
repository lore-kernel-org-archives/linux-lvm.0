Return-Path: <bluca@comedia.it>
Date: Sat, 17 Feb 2001 11:16:25 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Newbie question: ERROR "pv_move_pe(): PE lock" pv_move_pe
Message-ID: <20010217111625.B32060@colombina.comedia.it>
References: <20010214191831.A12417@trez42.net> <E14U3db-0006f9-00@whittlesey.cl.cam.ac.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E14U3db-0006f9-00@whittlesey.cl.cam.ac.uk>; from Piete.Brooks@cl.cam.ac.uk on Sat, Feb 17, 2001 at 09:26:43AM +0000
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

On Sat, Feb 17, 2001 at 09:26:43AM +0000, Piete Brooks wrote:
> I was unable to create RAID1 PVs under 0.9.1_beta2 (RH 7.0.90 - Fisher), so I 
> used some raw partitions. I upgraded to 0.9.1_beta4 (which fixed the OOPS or 
> boot - great!) and have managed to create and add the RAID PV.
> 
> I'd like to remove the old PVs, and the empty one was `vgreduce's OK, but I 
> can't pvmove the data from the old one.
> 
> # pvmove /dev/hda9 
> pvmove -- moving physical extents in inactive volume group "vg01"
> pvmove -- WARNING: moving of active logical volumes may cause data loss!
> pvmove -- do you want to continue? [y/n] y
> pvmove -- ERROR "pv_move_pe(): PE lock" pv_move_pe
> 
> pvmove -- ERROR "pv_move_pe(): PE lock" moving physical extents

i believe the vg should be active....

> I was hoping to HACK it pro tem, and create new LVs by specifying the PVs to 
> use, but this too failed:
> 
> # lvcreate -L 50M -n repl vg01 /dev/md8
> lvcreate -- rounding up size to physical extent boundary "52 MB"
> lvcreate -- couldn't read physical volume "/dev/md8"

it should can you send a debug output...

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
