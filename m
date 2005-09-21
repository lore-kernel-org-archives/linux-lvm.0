Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8LDUPV13336
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2005 09:30:25 -0400
Received: from mailout11.sul.t-online.com (mailout11.sul.t-online.com
	[194.25.134.85])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8LDUKOY030806
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2005 09:30:24 -0400
Received: from grandcentral.hilarenhaus.hilaritas.de (unknown [192.168.1.252])
	by nexus.hilarenhaus.hilaritas.de (Postfix) with ESMTP id DC879270107
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2005 15:29:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by grandcentral.hilarenhaus.hilaritas.de (Postfix) with ESMTP id
	980E584E2
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2005 15:29:44 +0200 (CEST)
Received: from grandcentral.hilarenhaus.hilaritas.de ([127.0.0.1])
	by localhost (grandcentral [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18052-04 for <linux-lvm@redhat.com>;
	Wed, 21 Sep 2005 15:29:42 +0200 (CEST)
Received: from simba (simba.hilarenhaus.hilaritas.de [192.168.1.132])
	by grandcentral.hilarenhaus.hilaritas.de (Postfix) with ESMTP id
	96F6D823C
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2005 15:29:42 +0200 (CEST)
From: "Fabian Aichele" <faichele@hilarenhaus.hilaritas.de>
Date: Wed, 21 Sep 2005 15:29:42 +0200
Message-ID: <000001c5beb0$8668e4f0$0109a8c0@hilarenhaus.hilaritas.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Lvm utility programs failure
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

Hello!

On two Debian machines with a custom-built kernel (version 2.6.5, patched
with the WOLK patch set from http://wolk.sourceforge.net) all LVM2 commands
fail with an identical error message. The LVM kernel code is compiled as a
module and loads correctly.

lvm version output:
  LVM version: 2.01.04 (2005-02-09)
  Library version: 1.01.00-ioctl (2005-01-17)
  Driver version: 4.1.0

The LVM2 utilities Debian package version is 2.0.1.04-5 from Debian testing.

For example, this is what a "lvscan" command results in:


  /dev/hda: open failed: Unbekannter Fehler 530
  /dev/loop0: open failed: Unbekannter Fehler 530
  /dev/hde: open failed: Unbekannter Fehler 530
  /dev/hda1: open failed: Unbekannter Fehler 530
  /dev/loop1: open failed: Unbekannter Fehler 530
  /dev/hde1: open failed: Unbekannter Fehler 530
  /dev/hda2: open failed: Unbekannter Fehler 530
  /dev/loop2: open failed: Unbekannter Fehler 530
  /dev/hda3: open failed: Unbekannter Fehler 530
  /dev/loop3: open failed: Unbekannter Fehler 530
  /dev/loop4: open failed: Unbekannter Fehler 530
  /dev/loop5: open failed: Unbekannter Fehler 530
  /dev/loop6: open failed: Unbekannter Fehler 530
  /dev/loop7: open failed: Unbekannter Fehler 530
  /dev/loop8: open failed: Unbekannter Fehler 530
  /dev/loop9: open failed: Unbekannter Fehler 530
  /dev/loop10: open failed: Unbekannter Fehler 530
  /dev/loop11: open failed: Unbekannter Fehler 530
  /dev/loop12: open failed: Unbekannter Fehler 530
  /dev/loop13: open failed: Unbekannter Fehler 530
  /dev/loop14: open failed: Unbekannter Fehler 530
  /dev/loop15: open failed: Unbekannter Fehler 530
  /dev/hdb: open failed: Unbekannter Fehler 530
  No volume groups found


German locale is set; "Unbekannter Fehler" translates to "Unknown error" 

A (hopefully) relevant excerpt from "strace lvscan" shows an "open" system
call failing with an error number -530.


stat64("/dev/hde1", {st_mode=S_IFBLK|0660, st_rdev=makedev(33, 1), ...}) = 0
stat64("/dev/hde1", {st_mode=S_IFBLK|0660, st_rdev=makedev(33, 1), ...}) = 0
open("/dev/hde1", O_RDONLY|O_LARGEFILE|0x40000) = -530
write(2, "  ", 2  )                       = 2
write(2, "/dev/hde1: open failed: Unbekann"..., 46/dev/hde1: open failed:
Unbekannter Fehle
r 530) = 46
write(2, "\n", 1
)                       = 1


On another host with a more recent kernel 2.6.12 the LVM2 commands work
without any errors.

My question: Is this due my kernel image being too old or misconfigured, or
did the LVM utilities change between kernel 2.6.5 and 2.6.12 in any way that
makes older 2.6 kernel releases malfunction?

I'd be grateful for suggestions.

Regards,
Fabian Aichele
