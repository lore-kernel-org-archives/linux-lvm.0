Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6UBFmJx023922
	for <linux-lvm@redhat.com>; Sun, 30 Jul 2006 07:15:48 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6UBFdSb031610
	for <linux-lvm@redhat.com>; Sun, 30 Jul 2006 07:15:40 -0400
Message-ID: <44CC94C8.1080306@conterra.de>
Date: Sun, 30 Jul 2006 13:15:20 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] root partition
References: <20060729081733.88249.qmail@web26602.mail.ukl.yahoo.com>
In-Reply-To: <20060729081733.88249.qmail@web26602.mail.ukl.yahoo.com>
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
To: ramsis farhat <sismar2002@yahoo.fr>, LVM general discussion and development <linux-lvm@redhat.com>

ramsis farhat wrote:
> Hello every body. I'm student and I have training in a company that wants to put LVM partitions in its server.
> The problem is that they do not want to format the hard disk.
> For the moment, I'm working on a virtual machine with Red Hat Entreprise 3.
> I'm working with 2 hard disks of 8GB. The first is partitioned like this
> sda1 boot (101 MB)
> sda2 /      (7400MB)
> sda3 swap (573 MB)
>  
> I followed exactly the steps in the LVM-HOWTO excepted that I added the second Hard disk sdb.
> I made a lvm partion sdb1 and I put all the root data on it.
> Then, I had 2 problems. The first is that the RAM disk can't be created because of the lack of space ( I'm not sure of that)
> And the second is that the server is using GRUB and not LILO, so I don't know How rebooting on the new root file.

What do you mean by "RAM disk"? Is it a problem while preparing the
ramdisk (initrd) by mkinited, or is it a problem to startup the
ramdisk during boot?

Both, grub and lilo need sda1 (/boot) to boot, load the kernel and
the initrd (ram disk). There are two things you should verify:
1) For the new root partition (more correct: root LV), be sure,
/boot still comes from /dev/sda1 (should be, as it was before).
2) the initrd (ram disk) created by mkinitrd, must know about
using LVM. This may be achieved either via some configuration
(my SuSE system looks into /etc/sysconfig/kernel) or by "-f lvm2".
See "man mkinitrd".

Dieter.
