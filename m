Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8JNMJV17969
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2005 19:22:19 -0400
Received: from florence.buici.com (qmailr@florence.buici.com [206.124.142.26])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id j8JNMCO6012681
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2005 19:22:13 -0400
Date: Mon, 19 Sep 2005 16:22:12 -0700
From: Marc Singer <elf@buici.com>
Message-ID: <20050919232212.GB12742@buici.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Two physical volumes disappeared
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On reboot, I've found that two physical volumes, the only two volumes
in a volume group, are no longer recognized.  Is there something I can
do to recover aside from rebuilding the VG?

There are two IDE drives, hdb and hdd, that were in the VG.  Here's a
dump of the start of hdb:

  000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ................
  *
  0001b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 01  ................
  0001c0  01 00 8e fe ff ff 3f 00  00 00 82 e4 50 09 00 00  ...���?....�P...
  0001d0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ................
  *
  0001f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 55 aa  ..............U�
  000200  4c 41 42 45 4c 4f 4e 45  01 00 00 00 00 00 00 00  LABELONE........
  000210  ce 01 f0 6f 20 00 00 00  4c 56 4d 32 20 30 30 31  �.�o ...LVM2 001
  000220  55 61 6b 63 33 45 56 31  6d 47 30 45 66 70 4b 64  Uakc3EV1mG0EfpKd
  000230  4d 65 69 62 36 57 6b 4e  51 37 53 42 30 33 56 30  Meib6WkNQ7SB03V0
  000240  00 60 ee a1 12 00 00 00  00 00 03 00 00 00 00 00  .`�............
  000250  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ................
  000260  00 00 00 00 00 00 00 00  00 08 00 00 00 00 00 00  ................
  000270  00 f8 02 00 00 00 00 00  00 00 00 00 00 00 00 00  .�..............
  000280  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ................
  *
  000800  37 e1 0e 18 20 4c 56 4d  32 20 78 5b 35 41 25 72  7�.. LVM2 x[5A%r
  000810  30 4e 2a 3e 01 00 00 00  00 08 00 00 00 00 00 00  0N*>............
  000820  00 f8 02 00 00 00 00 00  00 34 00 00 00 00 00 00  .�.......4......
  000830  a4 05 00 00 00 00 00 00  fd dd 68 4f 00 00 00 00  �.......��hO....
  000840  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  ................
  *
  000a00  63 61 63 68 65 20 7b 0a  69 64 20 3d 20 22 78 46  cache {.id = "xF
  000a10  53 4b 50 64 2d 76 4b 48  79 2d 64 36 48 51 2d 77  SKPd-vKHy-d6HQ-w

It looks like the right data is there, but pvdisplay says that it
doesn't recognize it.  Is there something I can do to diagnose the
failure?
