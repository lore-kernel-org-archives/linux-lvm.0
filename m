Received: from [10.34.131.16] (dhcp131-16.brq.redhat.com [10.34.131.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t198s7qT014294
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2015 03:54:08 -0500
Message-ID: <54D875AF.8010705@redhat.com>
Date: Mon, 09 Feb 2015 09:54:07 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <646AF90A-464B-44EC-BE14-FCD4F888A3CB@gmail.com>
In-Reply-To: <646AF90A-464B-44EC-BE14-FCD4F888A3CB@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM disk power management
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 8.2.2015 v 19:59 Drew... napsal(a):
> Hi,
> I have 3 physical disks forming one volume group, with one logical volume.
> If i try to issue a standby command to the logical volume i get the following
> error..
>
> |sudo hdparm -y /dev/mapper/VG0-LVstorage
>
> /dev/mapper/VG0-LVstorage:
>
>   issuing standby command
>
>   HDIO_DRIVE_CMD(standby) failed: Inappropriate ioctl for device|
>
>
> But if i issue a standby command to the individual disks in the volume group..
>
> |sudo hdparm -y /dev/sda1 /dev/sdb1 /dev/sdc1
>
> /dev/sda1:
>
>   issuing standby command
>
> /dev/sdb1:
>
>   issuing standby command
>
> /dev/sdc1:
>
>   issuing standby command|
>
> This works fine!
> Is addressing individual disks the normal way to to spin down disks in a lvm
> volume group or will this cause file corruption.
> And if not, is there a safe way to achieve this or is it just not possible to
> spin down disks in a lvm.
> I would be grateful of any advice you could offer. I have spent some time
> searching around for some information on this & i can not find any documented
> on this anywhere.
> Thanks,


Yes - you need to 'hdparm' control  'real' devices/PVs.
There is no point to try to control logical volumes.
Imagine you could have 1000LVs on a single PV.


Regards

Zdenek
