Received: from [172.16.45.118] (dhcp-118.brisbane.redhat.com [172.16.45.118])
	by pobox.brisbane.redhat.com (8.13.1/8.13.1) with ESMTP id
	lBIM0bLc020179
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 08:00:38 +1000
Message-ID: <47684253.4000404@gmail.com>
Date: Wed, 19 Dec 2007 07:57:39 +1000
From: David Robinson <zxvdr.au@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Resize LVM2 partition under VMware
References: <73BD1CEC958A564DB6771C5E97339F280167D03B@SMAIL.eu.lectra.com>
In-Reply-To: <73BD1CEC958A564DB6771C5E97339F280167D03B@SMAIL.eu.lectra.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> Now I try to extend my volume using lvextend command:
> 
> [root@devcentos5 ~]# lvextend -L+10G /dev/VolGroup00/LogVol00 
>   Extending logical volume LogVol00 to 27.94 GB
>   Insufficient free space: 320 extents needed, but only 0 available
> 
> I tried system-config-lvm utility, but there is no unallocated space to use.
> 
> How can I get the additional 10G that I added to the /dev/sda2 partition?

You missed "pvresize /dev/sda2". If the physical volume has changed size 
the pvresize command will resize the physical volume and therefore the 
volume group its within. If you were to run "vgdisplay VolGroup00" does 
it show the Free PE/Size that you expect?

--Dave
