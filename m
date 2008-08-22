Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7MFNQa5008480
	for <linux-lvm@redhat.com>; Fri, 22 Aug 2008 11:23:26 -0400
Received: from mail-gx0-f15.google.com (mail-gx0-f15.google.com
	[209.85.217.15])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m7MFN9qf001945
	for <linux-lvm@redhat.com>; Fri, 22 Aug 2008 11:23:09 -0400
Received: by gxk8 with SMTP id 8so1897024gxk.3
	for <linux-lvm@redhat.com>; Fri, 22 Aug 2008 08:23:04 -0700 (PDT)
Message-ID: <db9fa2350808220823p38bb2d71gb19b76956fee3b7e@mail.gmail.com>
Date: Fri, 22 Aug 2008 17:23:03 +0200
From: "Kevin Maguire" <k.c.f.maguire@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] lvm mirrors
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

Hello

I am using LVM on SLES 10+sp2 on a test server.

$ lvs --version
  LVM version:     2.02.17 (2006-12-14)
  Library version: 1.02.13 (2006-11-28)
  Driver version:  4.7.0

I have only 2 disk devices, but noticed that newer versions of LVM
allow me to do mirroring directly in VM.  So I created a mirror via:

vgcreate vg01 /dev/sda5 /dev/sdb5
lvcreate vg01 --corelog --mirrors 1 --name XX-m \
 --size 125G

I have used /dev/md* type mirrors, built via mdadm  before.

What are the pros and cons of the 2 approaches? I have read the man
page entry for --corelog option, and appreciate the re-sync on reboot
for the mirror.

I also know that with md* type mirrors I can see current status via
/proc/mdstat, is there an equivalent for LVM mirrors? Even if I had an
extra device for logs, is there any advantage in the LVM mirroring
over the md* mirroring?

Thanks,
KM
