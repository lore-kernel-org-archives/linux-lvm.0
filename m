Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5OIah014604
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 14:36:43 -0400
Received: from mail.gmx.net (imap.gmx.net [213.165.64.20])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i5OIafe1028535
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 14:36:41 -0400
Received: from pavian (pavian.at.ds9 [192.168.0.104])
	by mailer.at.ds9 (Postfix) with ESMTP id 9183476246
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 20:36:34 +0200 (CEST)
From: "Cisco" <cisco66@gmx.de>
Date: Thu, 24 Jun 2004 20:36:33 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20040624183634.9183476246@mailer.at.ds9>
Subject: [linux-lvm] pvcreate  Couldn't find device ... 
Reply-To: cisco66@gmx.de,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi all,

since upgrading to LVM2 i have a big problem.

I'm running Debian and Kernel 2.6.7

After reading the whole web and all available man pages i decided to delete
my volume group and start from a clean basis.
I erased all config files and purged all packages (debian) and reinstalled
everything (exept lvm10)
(i _do_ have backups of my data :))

Now to the problem:

I have 3 IDE disks: /dev/hde, /dev/hdg and /dev/hdh

Before the upgrade to lvm2 i just took the whole unpartitioned disks as PV's
and made a VG0 out of them with 9 LV's


Now i wanted to do the same and did a "pvcreate /dev/hde"
The result was "/dev/hde: Couldn't find device"
The disk is accessible for the system, because i can work with fdisk or "dd"
it to /dev/null without any errors !

I tried all possible (vcfgrestore and tried to restore the uuid and so on)
but nothing helped.
So I decided to partition the disk with fdisk and created one single
partition.(/dev/hde1)

Now "pvcreate /dev/hde1" worked fine so i did the same with /dev/hdg and
/dev/hdh

The problem now is that it worked on /dev/hdh1 but when i try to "pvcreate
/dev/hdg1" i again get the error above.

In the meantime I'm rather desperated...

Any idea would be greatly appreciated !

Thanks

Tom
