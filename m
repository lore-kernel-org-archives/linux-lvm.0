Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1SDX1117477
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2006 08:33:01 -0500
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1SDWxg2027741
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2006 08:33:00 -0500
Received: from wolverine (unknown [192.168.0.5])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id 29FE612ED4
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2006 13:32:54 +0000 (GMT)
From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: [linux-lvm] Situation with PVRESIZE command
Date: Tue, 28 Feb 2006 13:32:52 -0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20060221180029.B14FF12ECC@bluewhale.planbit.co.uk>
Message-Id: <20060228133254.29FE612ED4@bluewhale.planbit.co.uk>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi,

I've found Alasdair's mail from ~1 year ago on something in this area, but
it isn't quite the answer that I was looking for.

http://www.redhat.com/archives/linux-lvm/2004-December/msg00049.html

Is there anyone on this mailing list that can help with my PVRESIZE
questions below?

Thanks,

Roger


> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Roger Lucas
> Sent: 21 February 2006 18:01
> To: 'LVM general discussion and development'
> Subject: [linux-lvm] Situation with PVRESIZE command
> 
> Hi,
> 
> I am running LVM on top of a large RAID controller with a 16-drive
> capability (of which just 4 disks are currently active).  The RAID array
> appears as a single SCSI disk, "/dev/sda".  A quick summary of the LVM
> information is below.
> 
> tiger:~# lvm version
>   LVM version:     2.01.04 (2005-02-09)
>   Library version: 1.01.00-ioctl (2005-01-17)
>   Driver version:  4.4.0
> tiger:~# pvs
>   PV         VG      Fmt  Attr PSize   PFree
>   /dev/sda   storage lvm2 a-   745.05G 39.05G
> tiger:~# vgs
>   VG      #PV #LV #SN Attr  VSize   VFree
>   storage   1   3   0 wz--n 745.05G 39.05G
> tiger:~# lvs
>   LV   VG      Attr   LSize Origin Snap%  Move Copy%
>   home storage -wi-ao 2.00G
>   root storage -wi-ao 2.00G
>   var  storage -wi-ao 2.00G
>   main storage -wi-ao 700.0G
> tiger:~# mount
> /dev/mapper/storage-root on / type reiserfs (rw)
> proc on /proc type proc (rw)
> sysfs on /sys type sysfs (rw)
> devpts on /dev/pts type devpts (rw,gid=5,mode=620)
> tmpfs on /dev/shm type tmpfs (rw)
> /dev/hda1 on /boot type ext3 (rw,noatime)
> /dev/mapper/storage-home on /home type reiserfs (rw)
> /dev/mapper/storage-var on /var type reiserfs (rw)
> /dev/mapper/storage-main on /main type reiserfs (rw)
> usbfs on /proc/bus/usb type usbfs (rw)
> tmpfs on /dev type tmpfs (rw,size=10M,mode=0755)
> tiger:~#
> 
> I now need to increase my RAID capacity.  I can increase the physical RAID
> capacity by adding another disk to the controller and getting it to re-
> build
> the array in the background, thus increasing the size of "/dev/sda", but I
> am not clear as to how I can increase the PV size in LVM.
> 
> I have seen some references to a "pvresize" command, but it isn't in the
> latest 2.01.15 stable release (although it does appear in the 2.02.02
> development release).
> 
> Hence, my questions are:
> 
> - Is it possible to re-size a PV whilst the system is online using the
> 2.01.15 tools?
> 
> - Is it possible to re-size a PV whilst the system is online using the
> 2.02.02 tools?
> 
> - How "stable" are the 2.02.02 tools, and are there any specific bugs in
> them that may cause problems during typical usage.
> 
> Thanks,
> 
> Roger
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
