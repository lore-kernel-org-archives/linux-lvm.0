Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5I0dU013802
	for <linux-lvm@redhat.com>; Thu, 17 Jun 2004 20:39:30 -0400
Received: from mail.2thebatcave.com (CPE-65-30-20-102.kc.rr.com [65.30.20.102])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5I0dUe1002626
	for <linux-lvm@redhat.com>; Thu, 17 Jun 2004 20:39:30 -0400
Message-ID: <54553.192.168.1.12.1087519164.squirrel@192.168.1.12>
Date: Thu, 17 Jun 2004 19:39:24 -0500 (CDT)
From: "Nick Bartos" <spam99@2thebatcave.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvm2 & e2fsadm (or safe scripted resizing)
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
To: linux-lvm@redhat.com

From what I can see, there is no e2fsadm util for lvm2.

I want to script parition resizes, but without that tool I cringe a
little.  I need to write a script that automates this in a distro, so it
needs to be completely scripted and very reliably reproduceable.  I am
using e2fsadm now which works very well since I can just tell it how much
to shrink/grow the partition, without getting the size first.

I don't mind doing this manually, but I want to make damn sure that I
calculate everything right.  I don't want to miss something by a byte here
or there.

If someone could contribute a good script or some directions on exactly
how I get the right numbers, I would appreciate it.  I could just start
doing it myself, but I am afraid that I would make it work, but then miss
something where in some case of rounding I would mess up the partition.

I was also looking at the reiserfs utility, it looks like that works
nicely as far as I can tell, there wouldn't seem to be any need to
calculate anything.  Possibly I will consider upgrading the ext3 paritions
to reiserfs as well.
