Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9UAUvd5013074
	for <linux-lvm@redhat.com>; Thu, 30 Oct 2008 06:30:58 -0400
Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m9UAUv9T017694
	for <linux-lvm@redhat.com>; Thu, 30 Oct 2008 06:30:57 -0400
Message-ID: <49098ACA.9000409@redhat.com>
Date: Thu, 30 Oct 2008 10:22:02 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to make lvm error handling robust?
References: <91b13c310810300015j25be4feeqdab86d28ecfb0866@mail.gmail.com>
In-Reply-To: <91b13c310810300015j25be4feeqdab86d28ecfb0866@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

rae l wrote:
> How to make lvm error handling robust?
> 
> Steps:
> 1. create pv,vg,lv on multiple disks, one group (sda,sdb,sdc), other
> groups (sdd, sde, ...);
> 2. unplug one disk (sda, one pv);
> 
> then all LVM broken, even other unrelated groups of lvm cannot work
> from then on,

Not been the case when I've encountered this situation. The affected VG
can only be activated in partial mode but all other VGs should continue
to operate just fine.

> all lvm commands report error and stops executing.
> 
> How to solve this?

Plan your storage better. If you're placing VGs on single disk devices
then you should use LVM2's redundancy features - by creating mirrored
LVs you would avoid a single disk becoming a single point of failure.

Alternately, address redundancy further down the stack by using hardware
or software RAID to add redundancy and fault tolerance to the storage
being managed by LVM2.

Regards,
Bryn.
