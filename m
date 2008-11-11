Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mABALaYT000330
	for <linux-lvm@redhat.com>; Tue, 11 Nov 2008 05:21:36 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id mABALZsT011553
	for <linux-lvm@redhat.com>; Tue, 11 Nov 2008 05:21:36 -0500
Message-ID: <49195C23.8050400@redhat.com>
Date: Tue, 11 Nov 2008 10:19:15 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM without LVMtools
References: <586971226398277@webmail83.yandex.ru>
In-Reply-To: <586971226398277@webmail83.yandex.ru>
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

Dmitry Mishin wrote:
> Where I can know about co-operation LVM tools and kernels?
> 
> Whether it is possible to activate LVs (lvchange -a y) without a package LVM?

The tools read and interpret metadata stored on the physical devices, or 
in the file system. They use this data to instruct the kernel 
device-mapper to create mapped devices that correspond to the volumes 
described in the metadata using the device-mapper ioctl interface (via 
libdevmapper).

See Alasdair's talks for more information on how all the pieces fit 
together:

http://people.redhat.com/agk/talks/

Regards,
Bryn.
