From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Recovering a volume after OS upgrade (lost /etc/lvm*)
Message-ID: <20011119014754.A1308@lynx.no>
References: <20011119032207.97984.qmail@web12306.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011119032207.97984.qmail@web12306.mail.yahoo.com>; from thelars@yahoo.com on Sun, Nov 18, 2001 at 07:22:07PM -0800
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
Date: Mon Nov 19 02:46:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars Kellogg-Stedman <thelars@yahoo.com>
Cc: linux-lvm@sistina.com

On Nov 18, 2001  19:22 -0800, Lars Kellogg-Stedman wrote:
> I just upgraded a system to RedHat 7.2 (+ XFS from SGI) (lvm-1.0.1RC4),
> and I'm trying to mount a LVM-based logical volume created using LVM
> 0.9mumble.  The volume group consisted of a single PV on opt of a
> software RAID5 device.
> 
> pvscan says:
> 
>   pvscan -- reading all physical volumes (this may take a while...)
>   pvscan -- WARNING: physical volume "/dev/sda" belongs to a meta
> device
>   pvscan -- inactive PV "/dev/md0"  is associated to an unknown VG (run
> vgscan)
>   pvscan -- total: 2 [8.48 GB] / in use: 2 [8.48 GB] / in no VG: 0 [0]
> 
> And pvdisplay says:
> 
>   --- Physical volume ---
>   PV Name               /dev/md0
>   VG Name               vg0
>   PV Size               8.48 GB / NOT usable 2.75 MB [LVM: 129.00 KB]
>   PV#                   1
>   PV Status             NOT available
>   Allocatable           yes (but full)
>   Cur LV                1
>   PE Size (KByte)       4096
>   Total PE              2169
>   Free PE               0
>   Allocated PE          2169
>   PV UUID               HHv1Tm-79Hx-uk4m-caqb-QUA5-8WGF-0yUe4Q
> 
> Which looks great.  But I can't for the life of me figure out how to
> turn this back into a valid volume group.  Vgscan doesn't pick up this
> device:
> 
>   vgscan -- reading all physical volumes (this may take a while...)
>   vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
>   vgscan -- WARNING: This program does not do a VGDA backup of your
> volume group

You may need to re-create your MD RAID device /dev/md0.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
