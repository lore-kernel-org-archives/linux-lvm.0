Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8MDIip6010764
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 09:18:44 -0400
Received: from relay03.mail-hub.dodo.com.au (relay03.mail-hub.dodo.com.au
	[123.2.6.238])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8MDIP4f009901
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 09:18:26 -0400
Received: from 123-2-156-143.static.dsl.dodo.com.au ([123.2.156.143]
	helo=fc11-64.localdomain)
	by relay03.mail-hub.dodo.com.au with esmtp (Exim 4.68)
	(envelope-from <whobedobe@dodo.com.au>) id 1Mq5G6-0003ti-1y
	for linux-lvm@redhat.com; Tue, 22 Sep 2009 23:18:25 +1000
From: Hugh <whobedobe@dodo.com.au>
Subject: Re: [linux-lvm] I've tried to get some support on this list about lvm
Date: Tue, 22 Sep 2009 23:18:17 +1000
References: <200909152137.44474.whobedobe@dodo.com.au>
	<200909172059.49369.whobedobe@dodo.com.au>
	<4AB88C0B.6020203@redhat.com>
In-Reply-To: <4AB88C0B.6020203@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <200909222318.17782.whobedobe@dodo.com.au>
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
Content-Type: Text/Plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tuesday 22 September 2009 18:34:19 Marian Csontos wrote:
> Hugh wrote:
> > On Tuesday 15 September 2009 21:49:39 Alasdair G Kergon wrote:
> >> On Tue, Sep 15, 2009 at 09:37:44PM +1000, Hugh wrote:
> >>> Sep 10 20:55:46 fc11-64 kernel: device-mapper: table: device 8:18
> >>> too small for target
> >>
> >> There's your answer: You're trying to make it bigger than the underlying
> >> device.
> >>
> >> Use pvs -v to check device sizes for discrepancies.
> >> (--units s if necessary).
> >>
> >> Alasdair
> >
> > Thanks, now I can see what the problem is:
> >
> > [root@fc11-64 ~]# pvs -v
> >     Scanning for physical volume names
> >   PV         VG         Fmt  Attr PSize  PFree  DevSize PV UUID
> >   /dev/sda2  vg_fc1164  lvm2 a-   99.80G     0   99.80G
> > qunnek-OG2y-hp2j-31J8- J3HT-0Aye-3w2rMN
> >   /dev/sdb2  VolGroup00 lvm2 a-   67.91G 20.00G  47.93G
> > eCuGyH-jV7L-Tgdg-JyYW- sWK1-ehZY-OLw0WS
> >
> >
> > How is this possible?
> > What's the solution?
> > How can I grow the DevSize?
> > Probably a better question to ask is, how can I add the unused space into
> > the device and then the volume?
> 
> Hi Hugh,
> 
> taking into account this:
> > Maybe I should provide some more background.
> > I have a vmware virtual disk and I have grown the disk size by 20G.
> 
> and...
> 
> > [root@fc11-64 ~]# parted -l
> > Model: VMware, VMware Virtual S (scsi)
> > Disk /dev/sda: 107GB
> > Sector size (logical/physical): 512B/512B
> > Partition Table: msdos
> >
> > Number  Start   End    Size   Type     File system  Flags
> >  1      32.3kB  210MB  210MB  primary  ext3         boot
> >  2      210MB   107GB  107GB  primary               lvm
> >
> >
> > Model: VMware, VMware Virtual S (scsi)
> > Disk /dev/sdb: 73.0GB
> > Sector size (logical/physical): 512B/512B
> > Partition Table: msdos
> 
> ...this:
> > Number  Start   End     Size    Type     File system  Flags
> >  1      32.3kB  74.0MB  74.0MB  primary  ext3         boot
> >  2      74.0MB  51.5GB  51.5GB  primary               lvm
> 
> you have to resize sdb2 partition first.
> 
> Though I do not understand why it is possible to resize PV beyond end of
> device (doing that should display a warning message, but command will
> pass), this is definitely not a LVM bug.
> 
> HTH,
> 
> -- Marian
> 
> > Model: Linux device-mapper (dm)
> > Disk /dev/mapper/VolGroup00-LogVol00: 49.3GB
> > Sector size (logical/physical): 512B/512B
> > Partition Table: loop
> >
> > Number  Start  End     Size    File system  Flags
> >  1      0.00B  49.3GB  49.3GB  ext3
> >
> >
> > Model: Linux device-mapper (dm)
> > Disk /dev/mapper/VolGroup00-LogVol01: 2114MB
> > Sector size (logical/physical): 512B/512B
> > Partition Table: loop
> >
> > Number  Start  End     Size    File system  Flags
> >  1      0.00B  2114MB  2114MB  linux-swap
> >
> >
> > Model: Linux device-mapper (dm)
> > Disk /dev/mapper/vg_fc1164-lv_swap: 4194MB
> > Sector size (logical/physical): 512B/512B
> > Partition Table: loop
> >
> > Number  Start  End     Size    File system  Flags
> >  1      0.00B  4194MB  4194MB  linux-swap
> >
> >
> > Model: Linux device-mapper (dm)
> > Disk /dev/mapper/vg_fc1164-lv_root: 103GB
> > Sector size (logical/physical): 512B/512B
> > Partition Table: loop
> >
> > Number  Start  End    Size   File system  Flags
> >  1      0.00B  103GB  103GB  ext3
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

Thank Marian,

Any idea how to resize sdb2? It's lvm and maybe I could delete it and recreate 
it with fdisk but maybe it will break and everything will be lost.

Hugh
