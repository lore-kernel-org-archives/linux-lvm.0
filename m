Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j06Ht1r29596
	for <linux-lvm@redhat.com>; Thu, 6 Jan 2005 12:55:01 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.193])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j06Ht0Fa005860
	for <linux-lvm@redhat.com>; Thu, 6 Jan 2005 12:55:00 -0500
Received: by wproxy.gmail.com with SMTP id 67so116951wri
	for <linux-lvm@redhat.com>; Thu, 06 Jan 2005 09:54:55 -0800 (PST)
Message-ID: <87f94c37050106094874d055a5@mail.gmail.com>
Date: Thu, 6 Jan 2005 12:48:13 -0500
From: Greg Freemyer <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] hardware snapshots: uuid issue
In-Reply-To: <OF6D261918.6339F0E9-ONC1256F81.0057C65C-C1256F81.005939C1@restena.lu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <OF6D261918.6339F0E9-ONC1256F81.0057C65C-C1256F81.005939C1@restena.lu>
Reply-To: Greg Freemyer <greg.freemyer@gmail.com>,
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I use XFS when I am going to use snapshots.

It has a mount option to ignore the UUID conflict.


On Thu, 6 Jan 2005 17:14:34 +0100, gilles.massen@restena.lu
<gilles.massen@restena.lu> wrote:
> Hello everyone,
> 
> Some time ago I had a problem accessing a hardware snapshot of an LVM2
> partition. The reason: different physical volumes having the same UUIDs.
> The advice I was given was to use the "pvchange --uuid" command, but I'm
> unable to use that command whitout making the PV unusable.
> 
> What happens is this: the PV is there, it is found, but  becomes an
> "unknown" device. pvdisplay and pvdisplay <device> disagree somewhat,
> andit seems as if the old uuid is sticking around. vgscan or pvscan are of
> no use.
> 
> Now I have no idea what else to try... BTW, I also failed having two
> instances of LVM by setting LVM_SYSTEM_DIR: the second instance still
> finds the PVs of the first even...even with the appropriate filters.
> 
> Any ideas how to continue here? For the time beeing the hardware snapshots
> are not very useful...
> 
> Best,
> Gilles
> 
> Example: initial pvdisplay:
> 
>   --- Physical volume ---
>   PV Name               /dev/sdb1
>   VG Name               vg-test
>   PV Size               1020.00 MB / not usable 0
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              255
>   Free PE               0
>   Allocated PE          255
>   PV UUID               v3Oknf-6Rqa-Gh72-k0GO-c3I6-eoKS-odPWVr
> 
> # pvchange -v --uuid /dev/sdb1
>     Using physical volume(s) on command line
>     Finding volume group of physical volume "/dev/sdb1"
>     Archiving volume group "vg-test" metadata.
>     Updating physical volume "/dev/sdb1"
>     Creating volume group backup "/etc/lvm/backup/vg-test"
>   Physical volume "/dev/sdb1" changed
>   1 physical volume changed / 0 physical volumes not changed
> 
> #pvdisplay -v
>     Scanning for physical volume names
>   Couldn't find device with uuid 'GaTpFU-XgFz-HRH2-Mtyb-GI1f-4LN4-TOe8FK'.
>   --- Physical volume ---
>   PV Name               unknown device
>   VG Name               vg-test
>   PV Size               1020.00 MB / not usable 0
>   Allocatable           yes (but full)
>   PE Size (KByte)       4096
>   Total PE              255
>   Free PE               0
>   Allocated PE          255
>   PV UUID               GaTpFU-XgFz-HRH2-Mtyb-GI1f-4LN4-TOe8FK
> 
> or else:# pvdisplay -v /dev/sdb1
>     Using physical volume(s) on command line
>   Couldn't find device with uuid 'GaTpFU-XgFz-HRH2-Mtyb-GI1f-4LN4-TOe8FK'.
>   Couldn't find all physical volumes for volume group vg-test.
>   format_text: _vg_read failed to read VG vg-test
>   Couldn't find device with uuid 'GaTpFU-XgFz-HRH2-Mtyb-GI1f-4LN4-TOe8FK'.
>   Couldn't find all physical volumes for volume group vg-test.
>   format_text: _vg_read failed to read VG vg-test
>   --- NEW Physical volume ---
>   PV Name               /dev/sdb1
>   VG Name
>   PV Size               1023.62 MB
>   Allocatable           NO
>   PE Size (KByte)       0
>   Total PE              0
>   Free PE               0
>   Allocated PE          0
>   PV UUID               v3Oknf-6Rqa-Gh72-k0GO-c3I6-eoKS-odPWVr
> 
> # pvscan -v
>     Wiping cache of LVM-capable devices
>     Wiping internal cache
>     Walking through all physical volumes
>   Couldn't find device with uuid 'GaTpFU-XgFz-HRH2-Mtyb-GI1f-4LN4-TOe8FK'.
>   PV unknown device      VG vg-test   lvm2 [1020.00 MB / 0    free]
>   PV /dev/cciss/c0d0p6   VG data-vg   lvm2 [8.00 GB / 0    free]
>   Total: 2 [9.00 GB] / in use: 2 [9.00 GB] / in no VG: 0 [0   ]
> 
> --
> RESTENA - DNS-LU
> 6, rue Coudenhove-Kalergi
> L-1359 Luxembourg
> tel: (+352) 424409
> fax: (+352) 422473
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
