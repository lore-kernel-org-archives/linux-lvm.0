Subject: Re: [linux-lvm] pvremove won't work
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <4A2E096F.1010203@nektulos.de>
References: <4A2E0396.4030006@nektulos.de>
	<20090609065405.GB10101@maude.comedia.it>
	<4A2E096F.1010203@nektulos.de>
Date: Tue, 09 Jun 2009 10:46:23 +0100
Message-Id: <1244540783.18101.184.camel@breeves.fab.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: stefan@nektulos.de, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2009-06-09 at 09:04 +0200, Stefan Radovanovici wrote:
> 
> On 6/9/2009 8:54 AM, Luca Berra wrote:
> >> However, I can't remove /dev/sda4 (the partition on the failing disk)
> >> from the group:
> >> root@neriak:~# pvremove /dev/sda4
> >>  Can't open /dev/sda4 exclusively - not removing. Mounted filesystem?
> > what is the use of doing pvremove on sda4?? you just rip the disk off
> > and dump it in the wastebin.
> 
> Well, yeah, I just wanted to make sure that removing the disk while
>  some of its partitions are part of the LVM won't cause any problems. I
>  can't remove it just yet anyway, the OS is also installed on other
>  partitions on sda. So basically as long as I did a vgreduce, I can
>  take the disk out, is that right? I am assuming /dev/sda4 is still
>  showing in the pvdisplay output because it's still a LVM-type
>  partition. 

It is still labeled. LVM2 PV metadata has two components; a label in the
2nd sector that identifies the device as an LVM2 PV and includes the
UUID and a metadata buffer further into the device that stores details
like the VG the PV belongs to and the LVs that are allocated.

Running vgreduce for a PV edits the metadata on all PVs in the
appropriate VG to remove references to the PV being removed.

The pvremove command just wipes the label from the PV.

> > check /sys/block/sda/sda4/holders
> 
> I did: 
> 
> root@neriak:/sys/block/sda/sda4/holders# l
> total 0
> drwxr-xr-x 2 root root 0 2009-06-09 08:55 .
> drwxr-xr-x 4 root root 0 2009-06-09 08:43 ..
> lrwxrwxrwx 1 root root 0 2009-06-09 08:55 dm-1 -> ../../../../../../../../../virtual/block/dm-1
> root@neriak:/sys/block/sda/sda4/holders# cd dm-1
> root@neriak:/sys/block/sda/sda4/holders/dm-1# l
> total 0

> lrwxrwxrwx  1 root root    0 2009-06-09 08:55 bdi -> ../../bdi/252:1

> I have to admit I don't know what I am looking at. What's the dm-1 ?

Use dmsetup:

$ dmsetup info --maj 252 --min 1

(the output above shows dm is using 252 as its major number for this
device on your system).

At a guess it looks like you somehow removed the PV from the VG while a
logical volume was mapped on it.

Regards,
Bryn.
