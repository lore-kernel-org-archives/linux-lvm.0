From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] recovering a bad physical volume
Message-ID: <20020722082919.GA1096@tykepenguin.com>
References: <20020719064133.GA1184@tykepenguin.com> <Pine.SOL.4.44.0207191201590.3998-100000@yellow.csi.cam.ac.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.SOL.4.44.0207191201590.3998-100000@yellow.csi.cam.ac.uk>
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
Date: Mon Jul 22 03:29:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jul 19, 2002 at 12:10:30PM +0100, Matthew Johnson wrote:
> On Fri, 19 Jul 2002, Patrick Caulfield wrote:
> 
> > Other than fdisk and parted I don't know of any other way of doing it. and parted
> > works in MB/GB rather than cylinders so I doubt you'd get the control you need
> > here.
> >
> > Don't worry about the partition numbers being the same, LVM doesn't care what the
> > partitions are called, as long as it can find the PV metadata (which contains a
> > UUID)and a complete PV somewhere it should be able to activate the VG. LVM is
> > designed to cope with things like SCSI devices which rename themselves if you move
> > them around of the SCSI chain so IDE partitions that do the same will be no
> > problem.
> 
> It complained that /de/hde8 was not part of the volumegroup, so I just
> made sure the partition numbers were correct.
> 
> Anyway, I still get the "vgcfgrestore -- size of physical volume /dev/hde6
> differs from backup" [from vgcfgrestore -n lvm1 /dev/hde6]. So, heres a
> few details - see if ou can see the
> problem.
> 
> vgcfgrestore -n lvm1 -ll :
> 
> [cut lv & pv details]
> --- Physical volume ---
> PV Name               /dev/hde6
> VG Name               lvm1
> PV Size               2.96 GB [6204177 secs] / NOT usable 4.19 MB [LVM:
> 130 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              756
> Free PE               0
> Allocated PE          756
> PV UUID               9F9nNV-cQS2-BSl6-Ex72-NV1J-9J2v-2wE04a
> 
> now, 4096*1024*756 = 3170893824

Ah yes, but you should be using the PV size rather than the number of PEs to
work out the partition size! The PV is greater than the aggregated size of the
PEs because of the space needed for the LVM metadata.

So I make it that 6204177 sectors is 3176538624 bytes so you're still a little
short.


patrick
