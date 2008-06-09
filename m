Received: from pobox.stuttgart.redhat.com (pobox.stuttgart.redhat.com
	[172.16.2.10])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m59DqXsN001054
	for <linux-lvm@redhat.com>; Mon, 9 Jun 2008 09:52:33 -0400
Received: from [10.34.32.183] (mazybook.englab.brq.redhat.com [10.34.32.183])
	by pobox.stuttgart.redhat.com (8.13.1/8.13.1) with ESMTP id
	m59DqWaX019672
	for <linux-lvm@redhat.com>; Mon, 9 Jun 2008 09:52:32 -0400
Message-ID: <484D3574.9000403@redhat.com>
Date: Mon, 09 Jun 2008 15:51:48 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Re: Re: Loopback mount a disk image with lvm
References: <2122f0920806090646h46bb29cds76fb957a2b8e0cbe@mail.gmail.com>
In-Reply-To: <2122f0920806090646h46bb29cds76fb957a2b8e0cbe@mail.gmail.com>
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

Girish V wrote:
> Incidentally, how do I free the loop (/dev/loop0) associated with
> disk.img. I tried "sudo losetup -d /dev/loop0", but I get the error
> message "ioctl: LOOP_CLR_FD: Device or resource busy".
> 
> I tried looking at mount, ps, top etc - but the disk.img associated
> with loop0, was not being used.
> 
> Any ideas?

kpartx -d /dev/loop0

to remove partitions mappings?

Milan
