Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6EJiO007049
	for <linux-lvm@redhat.com>; Wed, 14 Jul 2004 15:44:24 -0400
Received: from stl.rural.usda.gov ([199.159.138.244])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6EJiIXn031748
	for <linux-lvm@redhat.com>; Wed, 14 Jul 2004 15:44:18 -0400
Message-ID: <40F58CDF.3010100@charter.net>
Date: Wed, 14 Jul 2004 14:43:27 -0500
From: James <superfueld@charter.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] wrong data unit in lvdiskplay?
References: <1089746889.2988.20.camel@Smeagol.geministorage.com>
In-Reply-To: <1089746889.2988.20.camel@Smeagol.geministorage.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mingz@ele.uri.edu, LVM general discussion and development <linux-lvm@redhat.com>

I don't think this is your error. I'm seeing th same output on my systems and I don't like it. Thanks for pointing this out before I wrote some script to parse the INCORRECT output of lvdisplay -c.

FYI: I checked the redhat bugzilla and couldn't find a mention of this, so I entered this as bug #127858.

Ming Zhang wrote:
> I am not sure if this is a bug or my stupid error.
> 
> I am using lvm-1.0.3-13, which come from Fedora core 1. I created a
> lvol1 with size -L 2000M. then
> 
> # lvdisplay /dev/vg1/lvol1
> --- Logical volume ---
> LV Name                /dev/vg1/lvol1
> VG Name                vg1
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 0
> LV Size                1.95 GB
> Current LE             500
> Allocated LE           500
> Allocation             next free
> Read ahead sectors     1024
> Block device           58:0
> 
> # lvdisplay -c /dev/vg1/lvol1
> /dev/vg1/lvol1:vg1:3:1:0:0:4096000:500:500:0:1024:58:0
>                                                                                            here i found that its size is 4096000. base on the document of lvdiskplay, this should be in KB unit. so two output from lvdisplay is mismatched. can anybody tell me why?
> 
> 
> 
> ming
> 
> 
