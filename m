Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9NHt5V07681
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2005 13:55:05 -0400
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.198])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9NHsxdP010197
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2005 13:54:59 -0400
Received: by xproxy.gmail.com with SMTP id h30so127454wxd
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2005 10:54:59 -0700 (PDT)
Message-ID: <abe3cc840510231054y749bb92fv@mail.gmail.com>
Date: Sun, 23 Oct 2005 19:54:59 +0200
From: Nicolas CERISIER <nicolas.cerisier@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] loose partition... loose lvm ?
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
To: linux-lvm@redhat.com

Hello,

I have a problem with my LVM (on Fedora Core 3 / 64 Bits).
The LVM is setup on 2 disks:
/dev/sda, with swap partition and first Lvm Partition (sda1)
/dev/sdb, with partition sdb1

Yesterday, the server crashed and when it tried to reboot, it has not
found the system.
Using the Fedora Rescue Disk, I get some informations:
- both partitions on sda have disappeared,
- /dev/sdb1 seems to be always here

Lvscan and other LVM informations tools can obtain the LVM parameters
(uuid, volume name, size, ...)

As I'm not really confident with LVM (my LVM knowledge is very poor),
I need your help ..
In your opinion, it is possible to rescover the LVM and Datas ?  and
how can I do ?

Thanks for your help,

 Nicolas.
