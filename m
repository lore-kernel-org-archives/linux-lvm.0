From: Matthew Johnson <mjj29@hermes.cam.ac.uk>
Subject: Re: [linux-lvm] recovering a bad physical volume
In-Reply-To: <20020719064133.GA1184@tykepenguin.com>
Message-ID: <Pine.SOL.4.44.0207191201590.3998-100000@yellow.csi.cam.ac.uk>
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
Date: Fri Jul 19 06:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 19 Jul 2002, Patrick Caulfield wrote:

> Other than fdisk and parted I don't know of any other way of doing it. and parted
> works in MB/GB rather than cylinders so I doubt you'd get the control you need
> here.
>
> Don't worry about the partition numbers being the same, LVM doesn't care what the
> partitions are called, as long as it can find the PV metadata (which contains a
> UUID)and a complete PV somewhere it should be able to activate the VG. LVM is
> designed to cope with things like SCSI devices which rename themselves if you move
> them around of the SCSI chain so IDE partitions that do the same will be no
> problem.

It complained that /de/hde8 was not part of the volumegroup, so I just
made sure the partition numbers were correct.

Anyway, I still get the "vgcfgrestore -- size of physical volume /dev/hde6
differs from backup" [from vgcfgrestore -n lvm1 /dev/hde6]. So, heres a
few details - see if ou can see the
problem.

vgcfgrestore -n lvm1 -ll :

[cut lv & pv details]
--- Physical volume ---
PV Name               /dev/hde6
VG Name               lvm1
PV Size               2.96 GB [6204177 secs] / NOT usable 4.19 MB [LVM:
130 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              756
Free PE               0
Allocated PE          756
PV UUID               9F9nNV-cQS2-BSl6-Ex72-NV1J-9J2v-2wE04a

now, 4096*1024*756 = 3170893824

fdisk -l /dev/hde:

Disk /dev/hde: 16 heads, 63 sectors, 116336 cylinders
Units = cylinders of 1008 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hde1             1     62415  31457128+   b  Win95 FAT32
/dev/hde2         62416     83221  10486224   83  Linux
/dev/hde3         83222    116336  16689960    5  Extended
/dev/hde5         83222     85302   1048792+  83  Linux
/dev/hde6        104039    110182   3096576   8e  Linux LVM
/dev/hde7        110183    116336   3101584+  8e  Linux LVM

here we have 3096576*1024 = 3170893824
or (10182 - 104039 + 1)*1008*512 = 3170893824 [note that this includes
both the end and start cylinder, hence the +1]

so, it looks to be the correct size, as far as I can see.

Any more ideas?

(btw, thanks - you've been really helpful so far)

Note that /dev/hde7 works fine with those cylinder numbers, so if anything
is incorrect its the value of 104039.

Matt
