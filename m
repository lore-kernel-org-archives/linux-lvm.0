Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBG9A4xS004593
	for <linux-lvm@redhat.com>; Tue, 16 Dec 2008 04:10:04 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id mBG9A30O029369
	for <linux-lvm@redhat.com>; Tue, 16 Dec 2008 04:10:03 -0500
Message-ID: <49477013.8090504@redhat.com>
Date: Tue, 16 Dec 2008 09:08:35 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Large disk problem with LVM2...
References: <4946B2B8.2000801@skywaywest.com>
In-Reply-To: <4946B2B8.2000801@skywaywest.com>
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

Greg Varga wrote:
> device-mapper: table: device 8:3 too small for target
> device-mapper: table: 253:7: linear: dm-linear: Device lookup failed
> device-mapper: ioctl: error adding target to table

How was the underlying device (sda) partitioned? For a device this 
large, you'll need to use a GPT partition table, rather than the 
traditional MSDOS MBR. Some versions of tools may allow you to create 
large partitions on MSDOS which later cause problems, since the MSDOS 
format is limited to 2TiB addressing.

The output of "fdisk -l /dev/sda" and "parted /dev/sda p", as well as 
the content of /proc/partitions would help to confirm if this is the 
problem.

> Anyone have any ideas why pvs shows the DevSize of 1.09TB?

There have been some cosmetic bugs that caused the wrong device sizes to 
be reported, but this doesn't look like one of those cases - since 
you're getting errors from the kernel when mapping LVs onto the
device, it really does appear that it's not as big as we're expecting.

Regards,
Bryn.
