Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6EGhRmd025750
	for <linux-lvm@redhat.com>; Fri, 14 Jul 2006 12:43:27 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6EGhQwt009486
	for <linux-lvm@redhat.com>; Fri, 14 Jul 2006 12:43:26 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 7885A1F4245
	for <linux-lvm@redhat.com>; Fri, 14 Jul 2006 18:43:20 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32697-02 for <linux-lvm@redhat.com>;
	Fri, 14 Jul 2006 18:43:02 +0200 (CEST)
Message-ID: <44B7C996.8030307@conterra.de>
Date: Fri, 14 Jul 2006 18:43:02 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM question on move and resize
References: <20060714151524.37351.qmail@web50702.mail.yahoo.com>
In-Reply-To: <20060714151524.37351.qmail@web50702.mail.yahoo.com>
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

John Koshi wrote:
> Actually I do have a large USB disk (Seagate 160GB)
> and had considered using it during this expansion of 
> the Linux installation. I'm interested in seeing your
> solution, in this case.

Hi John,

i frequently reorganized my data by extending my VG by 
a new disk (vgextend) and moved all data off the unwanted
disk using "vgmove". Afterwards I may unplug the unwanted disk
from my VG (vgreduce). All this may be performed, while people
are working on this server! But I'm using hot-plugable
SATA disks on a raid controller.

But you talk about a laptop and an USB disk, and the device to
replace is an extended partition, not a hot pluggable SATA disk.
So I think there are too much traps in your case to fail.

Instead I would simply install a plain ext2 partition on the
USB disk, mount it and copy all data using simple "cp -a" to
the USB disk. Then erase hda4 and recreate it as a plain primary
partition, install LVM again and copy the data back. This is
not as fancy as using LVM, but much saver in your case.

After all I even think: it may be currently ugly, but it works. 
So may be you should keep this setup until you really need
to change it.

regards, Dieter.

 
