Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k85JUKxn028546
	for <linux-lvm@redhat.com>; Tue, 5 Sep 2006 15:30:20 -0400
Received: from smtp3-g19.free.fr (smtp3-g19.free.fr [212.27.42.29])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k85JUI54014879
	for <linux-lvm@redhat.com>; Tue, 5 Sep 2006 15:30:19 -0400
Received: from cim06-1-82-228-240-152.fbx.proxad.net
	(cim06-1-82-228-240-152.fbx.proxad.net [82.228.240.152])
	by smtp3-g19.free.fr (Postfix) with ESMTP id 629A549B0A
	for <linux-lvm@redhat.com>; Tue,  5 Sep 2006 21:30:16 +0200 (CEST)
From: Fabien Shum-King <fabsk@free.fr>
Date: Tue, 05 Sep 2006 21:30:29 +0200
Message-Id: <1157484629.7166.13.camel@hobbes.fbx.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Restore after lvmove crash
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

Hi,

I'm sorry that this message doesn't appear in the existing thread, but I
received the mails in digest mode.

Summary: I used "pvmove /dev/sda2 /dev/sda7", the system crashed and I
get a invalid "pvmove0" LV I could not remove and prevented most actions
on the VG (including destroying the VG!).
"pvmove --abord" did not work (I searched a lot before asking here).

In fact, LVM was still scanning /dev/sda7 even if it was not used as a
physical volume and if I change the type of partition.
I don't know exactly which of these two actions solved the problem
(maybe both), but it did it:
- I removed the unused partition /dev/sda7 (and filled the free space
with /dev/zero so I don't get any problem in the future)
- I restored the metadata under another VG name (so my existing physical
volumes did not appear under the old corrupted VG), and I remove
everything. Then I restored the metadata onder the previous VG name. And
it worked

I hope that it could help someone in the future.

Fabien
