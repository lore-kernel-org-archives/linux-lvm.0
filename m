Received: from [192.168.1.2] (vpn-68-1.surrey.redhat.com [10.32.68.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k21DLcOO009945
	for <linux-lvm@redhat.com>; Wed, 1 Mar 2006 13:21:38 GMT
Message-ID: <44059FE3.9020205@redhat.com>
Date: Wed, 01 Mar 2006 13:21:39 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Create a Logical volume with 100% of Volume groups
	size?
References: <44059BAB.6020307@telecyl.com>
In-Reply-To: <44059BAB.6020307@telecyl.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Alejandro Alfonso wrote:
> Hi everybody!
> 
> we only want to use LVM with one Logical volume, and want to use the
> 100% of available space.
> is there any way to create it? Look:
> 
> acrol ~ # vgdisplay
>   --- Volume group ---
>   VG Name               mirror
> [...]
>   VG Size               232.88 GB
>   PE Size               32.00 MB
>   Total PE              7452
>   Alloc PE / Size       7452 / 232.88 GB
>   Free  PE / Size       0 / 0
> [...]
> 
> acrol ~ # lvcreate -L232.88G -nlv00 mirrorPoe
>   Rounding up size to full physical extent 232.91 GB
>   Insufficient free extents (7452) in volume group mirrorPoe: 7453 required
> 
> How to use all the 7452 PE? Thanks in advance

lvcreate -l7452 -nlv00 mirrorPoe

see man lvcreate


-- 

patrick
