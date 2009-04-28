Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3S1raSb000708
	for <linux-lvm@redhat.com>; Mon, 27 Apr 2009 21:53:37 -0400
Received: from mail.idrift.no (mail.idrift.no [83.242.12.60])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3S1qQnp009373
	for <linux-lvm@redhat.com>; Mon, 27 Apr 2009 21:52:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.idrift.no (Postfix) with ESMTP id 355C231403E
	for <linux-lvm@redhat.com>; Tue, 28 Apr 2009 03:52:24 +0200 (CEST)
Received: from mail.idrift.no ([127.0.0.1])
	by localhost (elros.idrift.no [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 09142-02 for <linux-lvm@redhat.com>;
	Tue, 28 Apr 2009 03:52:24 +0200 (CEST)
Received: from leyla (unknown [172.16.30.34])
	by mail.idrift.no (Postfix) with ESMTP id 08A8B314030
	for <linux-lvm@redhat.com>; Tue, 28 Apr 2009 03:52:24 +0200 (CEST)
From: "Gaute Lund" <gaute@idrift.no>
Date: Tue, 28 Apr 2009 03:52:23 +0200
Message-ID: <003a01c9c7a3$fa10a000$ee31e000$@no>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: nn-no
Subject: [linux-lvm] Random file system errors
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

I have searched the web and the mailing list without finding anything
similar to this.

At home I have an LVM setup. Reading data gives random errors. I only
recently discovered it's an LVM issue. I think.

The issue: If I md5sum largeish files, or test archives, I sometimes get
errors or randomly different md5sums. Like now, I have 11 folders, all with
rar files in parts: some 300 15MB pieces in 6 folders/sets, totaling 4,2GB,
and 560 50MB pieces in 5 folders/sets, totaling 23G.

OK, so I "rar t" all of these 5 times over. Errors pop up randomly, 52 times
in the 50MB pieces, 10 times in the 15MB pieces. That's about 1 error for
every 2,1GB of data read. Md5suming multiple files gives about the same
error rate.

If I run repeated test on a rar set small enough to fit in cache mem, I get
errors, but they are indentical with each run. 

Is it really an lvm problem? Well, I have created new LVs and use different
filesystems, ext3, xfs, jfs - they're all the same. If I create an md on
some other disks, and put a filesystem on it, without LVM, no problems.

I can't find any other errors, in any logs or dmesg. The errors weren't
there to begin with, they came at one point and got worse. It took a while
before I realized it was a generic disk problem, and for a period I kind of
gave up on it. So it's been there for ... maybe six months?

The VG consist of two software RAID 5 md's, one consisting of four 200GB
IDEs, one of five 500GB SATAs, yielding av VG totaling 2,37TB. Other
hardware is 4GB memory and a Core 2 Duo 6600 CPU.

Machine runs Ubuntu 8.10 with kernel 2.6.27-11, and
  LVM version:     2.02.39 (2008-06-27)
  Library version: 1.02.27 (2008-06-25)
  Driver version:  4.14.0

But the VG was originally created long ago, on LVM1 even.

Well, I guess that's it. Any other information that could be helpful? Any
way I could debug this?

Best regards
Gaute Lund
