Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2UCaJO04501
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2005 07:36:19 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.205])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2UCaDkF012605
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2005 07:36:13 -0500
Received: by rproxy.gmail.com with SMTP id g11so167928rne
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2005 04:36:08 -0800 (PST)
Message-ID: <bf024e9005033004367d15c2ba@mail.gmail.com>
Date: Wed, 30 Mar 2005 14:36:08 +0200
From: <talosso@gmail.com>
Subject: Re: [linux-lvm] vg OK --> reboot --> vg KO
In-Reply-To: <F1AF8CC9F864B04DAC52ECBB82D5AF5A1961C9@dealer.corp.snocap.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <F1AF8CC9F864B04DAC52ECBB82D5AF5A1961C9@dealer.corp.snocap.com>
Reply-To: talosso@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Hector Villalobos <hector@snocap.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

At startup I run the necessary boot scripts, the problem was more subtle and 
I have solved it, reading another thread on this mailing list....what
caused the problem still remains a mystery for me, perhaps you can
enlight my mind :)

I solved my issue simply by removing the partition table from the head
of the two
incriminate HDs and re-activating the volume group.
The mysterious questions are: who creates those partitions on the two
disks, and even if those partitions existed from the creation of the
two physical volumes and their insertion into the the volume group (in
the scenario that I was the one that created the partitions onto the
disks and I have now completely lost my mind), why did this problem
manifest itself only at this reboot? (I'm sure I have made many other
reboots since the creation of that volume group).

I'm looking for an explanation
Kind regards.

Livio



On Fri, 25 Mar 2005 16:59:33 -0800, Hector Villalobos <hector@snocap.com> wrote:
> Have you checked that on startup your are running the boot scripts for
> lvm.
> 
> Look here
> 
> http://www.tldp.org/HOWTO/LVM-HOWTO/initscriptredhat.html
> 
> Good Luck.
> 
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of talosso@gmail.com
> Sent: Friday, March 25, 2005 5:18 AM
> To: linux-lvm@redhat.com
> Subject: [linux-lvm] vg OK --> reboot --> vg KO
> 
> Hi guys,
> 
> I got stuck in a painful problem with lvm.
> I have 4 SATA HD handled by lvm as physical volumes into one large
> logical volume.
> Everything worked nice, until the last reboot.
> 
> A couple of info on the configuration:
> 
> root # lvmdiskscan
>  /dev/cdrom [      492.05 MB]
>  /dev/hda1  [      190.94 MB]
>  /dev/sda1  [      189.92 GB]
>  /dev/hda2  [       17.51 GB]
>  /dev/hda3  [      973.05 MB]
>  /dev/sdb1  [      189.92 GB]
>  /dev/sdc   [      189.92 GB] LVM physical volume
>  /dev/sdd   [      189.92 GB] LVM physical volume
>  1 disk
>  5 partitions
>  2 LVM physical volume whole disks
>  0 LVM physical volumes
> 
> Ok, /dev/hda is the system disk and it's not managed by lvm, thus the
> four HD are the /dev/sd*. As you can see the first two devices have one
> partition each, while the last two don't have it. The big lvm volume
> group (disks_vg) was created at first using the two disks /dev/sda and
> /dev/sdb, where I create the two physical volumes.
> Later the other two disks has been added to the volume group and
> accordingly the logical volume has been extended.
> Well, this was the story and everything worked fine.
> Then I rebooted and after that I find out that my volume group has not
> been created...
> 
> root # vgdisplay -v
>  Finding all volume groups
>  Finding volume group "disks_vg"
> Couldn't find device with uuid 'XBrEsM-mSRT-vuDl-XwxU-Ae5Q-kIQr-nkm4gi'.
> Couldn't find all physical volumes for volume group disks_vg.
> Couldn't find device with uuid 'XBrEsM-mSRT-vuDl-XwxU-Ae5Q-kIQr-nkm4gi'.
> Couldn't find all physical volumes for volume group disks_vg.
> Volume group "disks_vg" doesn't exist
> 
> and when I check the physical volumes I get the following message:
> 
> root # pvdisplay -v
>    Scanning for physical volume names
>  Couldn't find device with uuid
> 'XBrEsM-mSRT-vuDl-XwxU-Ae5Q-kIQr-nkm4gi'.
>  Couldn't find device with uuid
> 'ChG7VP-E1Bn-EUY3-krvx-2NJu-iHiC-0ByaEZ'.
>  Couldn't find device with uuid
> 'XBrEsM-mSRT-vuDl-XwxU-Ae5Q-kIQr-nkm4gi'.
>  Couldn't find device with uuid
> 'ChG7VP-E1Bn-EUY3-krvx-2NJu-iHiC-0ByaEZ'.
>  --- Physical volume ---
>  PV Name               unknown device
>  VG Name               disks_vg
>  PV Size               189.92 GB / not usable 0
>  Allocatable           yes (but full)
>  PE Size (KByte)       4096
>  Total PE              48620
>  Free PE               0
>  Allocated PE          48620
>  PV UUID               XBrEsM-mSRT-vuDl-XwxU-Ae5Q-kIQr-nkm4gi
> 
>  --- Physical volume ---
>  PV Name               unknown device
>  VG Name               disks_vg
>  PV Size               189.92 GB / not usable 0
>  Allocatable           yes (but full)
>  PE Size (KByte)       4096
>  Total PE              48620
>  Free PE               0
>  Allocated PE          48620
>  PV UUID               ChG7VP-E1Bn-EUY3-krvx-2NJu-iHiC-0ByaEZ
> 
>  --- Physical volume ---
>  PV Name               /dev/sdc
>  VG Name               disks_vg
>  PV Size               189.92 GB / not usable 0
>  Allocatable           yes (but full)
>  PE Size (KByte)       4096
>  Total PE              48620
>  Free PE               0
>  Allocated PE          48620
>  PV UUID               Sh64Kk-w7Ac-FFpj-v2ck-3XKT-sdbc-VuYozC
> 
>  --- Physical volume ---
>  PV Name               /dev/sdd
>  VG Name               disks_vg
>  PV Size               189.92 GB / not usable 0
>  Allocatable           yes (but full)
>  PE Size (KByte)       4096
>  Total PE              48620
>  Free PE               0
>  Allocated PE          48620
>  PV UUID               hilXy6-nvxA-xMxQ-Wrht-gRM6-ltfU-4gt8SJ
> 
> I think that the volume is still recoverable (that is what I need) and
> that something damaged the first bytes of the first two physical
> volumes... but after all I'm not so sure.
> Can anybody help me recovering the LVM volume and thus my data?
> Thanks a lot
> 
> Best regards.
> 
> Livio
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> This e-mail and any attachments are for the authorized use by the intended recipient only. It may contain proprietary material, confidential information and/or be subject to legal privilege. It should not be copied, disclosed to, retained or used by, any other party. If you are not an intended recipient then please promptly delete this e-mail and any attachments and all copies and inform the sender. Thank you.
> 
>
