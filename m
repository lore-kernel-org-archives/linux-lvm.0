Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8PDJhr31793
	for <linux-lvm@redhat.com>; Sat, 25 Sep 2004 09:19:43 -0400
Received: from mwinf0907.wanadoo.fr (smtp9.wanadoo.fr [193.252.22.22])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i8PDJWxV002044
	for <linux-lvm@redhat.com>; Sat, 25 Sep 2004 09:19:38 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf0907.wanadoo.fr (SMTP Server) with SMTP id 445B518000FD
	for <linux-lvm@redhat.com>; Sat, 25 Sep 2004 15:19:25 +0200 (CEST)
Received: from [192.168.0.35] (AVelizy-151-1-39-70.w82-120.abo.wanadoo.fr
	[82.120.21.70])
	by mwinf0907.wanadoo.fr (SMTP Server) with ESMTP id DD1211800082
	for <linux-lvm@redhat.com>; Sat, 25 Sep 2004 15:19:24 +0200 (CEST)
From: Pascal Garcia dld <dld.pascal.garcia@wanadoo.fr>
Message-Id: <1096118366.3170.64.camel@localhost>
Mime-Version: 1.0
Date: Sat, 25 Sep 2004 15:19:26 +0200
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem at boot time with Mandrake 10.1 community
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
Content-Type: text/plain; charset="us-ascii"
To: lvm-linux <linux-lvm@redhat.com>

Hello,
here is my problem :
I installed on a test disk the new version of Mandrake, kernel
2.6.8.1mdk.
I have one partition, unique element of a VG named rootvg.
On the vg I created 2 reiserfs partitions one for / and one for /home,
and a swap partition.

No problem with the installation as long as I create the vg or use an
existing vg. (In an other mail, I will detail the problem entcountered
when freeing a vg during installation process).

When booting, I can select the kernel I want with lilo and then, in the
list of messages 2 concerning the vg, saying approximately :
- The lv is not available
- The lv is not complete and mounted read only.

Then a kernel panic occurs.

An install without LVM works. The same configuration works fine with
Mandrake 10.0 and kernel 2.6.3.16mdk. I think the problem is related to
the LVM, but do not know what to do.


Help

Thanks

Pascal Garcia
