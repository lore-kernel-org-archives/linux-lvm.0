Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8NEYZdH026845
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2011 10:34:35 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8NEYY9o022553
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2011 10:34:34 -0400
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPA id ACA532147E
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2011 09:34:27 -0500 (CDT)
Date: Fri, 23 Sep 2011 09:34:27 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110923093427.70ad5d8d@bettercgi.com>
In-Reply-To: <CAA8akkrmfH0BnpX5s+4N5PBF19pXXVrzo5qYshvaBaZT9juO-A@mail.gmail.com>
References: <CAA8akko1QgMLPF66mE11bvZepV+0CqtfPfYoz9JjX6fk6Vy5-g@mail.gmail.com>
	<CAA8akkrmfH0BnpX5s+4N5PBF19pXXVrzo5qYshvaBaZT9juO-A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [LVM] Extending LV
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

> aha: that is something:
> 
> 
> Command (m for help): v
> 286690436 unallocated sectors
> 
> Command (m for help): n
> 
> Probably I need to add that the c0d0p2 with fdisk first

You could enlarge c0d0p2, but LVM makes that unnecesary. You can just
add c0d0p3, run pvcreate on it:
pvcreate /dev/cciss/c0d0p3
then:
vgextend VolGroup00 /dev/cciss/c0d0p3

Since all of the partitions end up in the pool called VolGroup00
anyway, it makes no difference if there's one large paritition or 
two smaller ones. Once they are part of VolGroup00 you just work 
with the group without ever thinking about partitions again.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Thu, 22 Sep 2011 14:46:08 +0200
Michaël Berger <miberger79@gmail.com> wrote:

> aha: that is something:
> 
> 
> Command (m for help): v
> 286690436 unallocated sectors
> 
> Command (m for help): n
> 
> Probably I need to add that the c0d0p2 with fdisk first
> 
> On Thu, Sep 22, 2011 at 2:32 PM, Michaël Berger
> <miberger79@gmail.com>wrote:
> 
> > Hello,
> >
> > I am very new to LVM. Trying to extend a LV after I added a 4th
> > disk in a HW RAID, but I don't have much luck. I am really hoping
> > someone out there can help me.
> >
> > Here is my setup:
> >
> > [root@sk-nas ~]# fdisk /dev/cciss/c0d0
> >
> > The number of cylinders for this disk is set to 53535.
> > There is nothing wrong with that, but this is larger than 1024,
> > and could in certain setups cause problems with:
> > 1) software that runs at boot time (e.g., old versions of LILO)
> > 2) booting and partitioning software from other OSs
> >    (e.g., DOS FDISK, OS/2 FDISK)
> >
> > Command (m for help): p
> >
> > Disk /dev/cciss/c0d0: 440.3 GB, 440345714688 bytes
> > 255 heads, 63 sectors/track, 53535 cylinders
> > Units = cylinders of 16065 * 512 = 8225280 bytes
> >
> >            Device Boot      Start         End      Blocks   Id
> > System /dev/cciss/c0d0p1   *           1          13      104391
> > 83  Linux /dev/cciss/c0d0p2              14       35690
> > 286575502+  8e  Linux LVM
> >
> > Command (m for help):
> >
> > As one can see /dev/cciss/c0d0 is now 440.3GB, which means that my
> > 4th disk is "physically" seen in the array. so far so good.
> >
> > First issue, looks like the 4th disk in not seen by pvscan?
> >
> > [root@sk-nas ~]# pvscan
> >   PV /dev/cciss/c0d0p2   VG VolGroup00   lvm2 [273.28 GB / 0
> > free] Total: 1 [273.28 GB] / in use: 1 [273.28 GB] / in no VG: 0
> > [0   ] [root@sk-nas ~]#
> >
> > [root@sk-nas ~]# pvdisplay
> >   --- Physical volume ---
> >   PV Name               /dev/cciss/c0d0p2
> >   VG Name               VolGroup00
> >   PV Size               273.30 GB / not usable 18.89 MB
> >   Allocatable           yes (but full)
> >   PE Size (KByte)       32768
> >   Total PE              8745
> >   Free PE               0
> >   Allocated PE          8745
> >   PV UUID               07qmA3-5eD9-klBa-OzWp-XDz1-pUvX-KGXAji
> >
> > [root@sk-nas ~]#
> >
> > What should I do, looks like my first disk is not seen by lvm?
> >
> > Thanks!
> >
> > Michael
> >
