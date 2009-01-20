Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0KBD22n000820
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 06:13:02 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n0KBD0Jf016655
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 06:13:00 -0500
Message-ID: <4975B1A6.3090902@redhat.com>
Date: Tue, 20 Jan 2009 11:12:38 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 2GB limit
References: <4975932A.6090902@bortal.de>
In-Reply-To: <4975932A.6090902@bortal.de>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

ml@bortal.de wrote:
> Hello List,
> 
> i have a 32bit Linux box with a 3Ware Raidcontroller and 4x 1TB disks. 
> After installing Debian Etch i had to find out that i am running into 
> some limits.
> 
> Is there a way to use a Partition >2GB with 32Linux/LVM?

You mean 2TiB? Partitions greater than 2GiB (but less than 2TiB) 
should "just work".

If that's the case, you need to use a real partition table as the 
traditional MSDOS partitioning scheme is limited to 2TiB partitions or 
devices (it can't address disk locations beyond this point).

The GPT partition format is widely used on ia64 and does not have this 
limitation. It's supported by parted and most distribution installers 
(even for non-Itanium systems).

Regards,
Bryn.
