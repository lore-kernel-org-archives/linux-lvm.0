Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i46CQVv06023
	for <linux-lvm@redhat.com>; Thu, 6 May 2004 08:26:32 -0400
Received: from mx.laposte.net (mx.laposte.net [81.255.54.11])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i46CQU8c008417
	for <linux-lvm@redhat.com>; Thu, 6 May 2004 08:26:30 -0400
Received: from laPoste.net (212.195.249.170) by mx.laposte.net (7.0.024)
	id 409947080004680D for linux-lvm@redhat.com;
	Thu, 6 May 2004 14:26:24 +0200
Message-ID: <409A2F2E.6030106@laPoste.net>
Date: Thu, 06 May 2004 14:27:26 +0200
From: Gabriel de Perthuis <Gabriel.de-Perthuis@laPoste.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] infinite loop in /dev/discs
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

     Hello,
I am encountering problems with lvm and devfs. lvm version says:
   LVM version:     2.00.08 (2003-11-14)
   Library version: 1.00.07-ioctl (2003-11-21)
   Driver version:  4.1.0
When running any lvm command (even version), lvm runs into an infinite
loop, looking for devices like /dev/discs/disc2/discs/disc2..., disc2
being a symlink to its parent. Many more symlinks appear named
/dev/discs[2-9]* and /dev/disc1[0-9]*, instead of only disc0 and disc1.
A strace gives me lots of stat64. A temporary solution is to rm the
/etc/lvm/.cache, rm all strange devices in /dev/discs, and launch lvm
anew. I think LVM should prevent these infinite loops from occurring,
since this prevented my computer from booting; even though this could be
a problem with devfs.
It seems the download page has moved to redhat's site, with slightly
newer versions I have not yet tested.
     Thank you
