Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5BNXj027096
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 19:33:45 -0400
Received: from linda-1.paradise.net.nz (bm-1a.paradise.net.nz [202.0.58.20])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5BNXdXn011258
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 19:33:40 -0400
Received: from smtp-1.paradise.net.nz (smtp-1b.paradise.net.nz [202.0.32.210])
	by linda-1.paradise.net.nz (Paradise.net.nz)
	with ESMTP id <0HZ6001CP442QE@linda-1.paradise.net.nz> for
	linux-lvm@redhat.com; Sat, 12 Jun 2004 11:33:38 +1200 (NZST)
Received: from fosi (203-79-83-162.cable.paradise.net.nz [203.79.83.162])
	by smtp-1.paradise.net.nz (Postfix) with ESMTP id 6D92D82783	for
	<linux-lvm@redhat.com>; Sat, 12 Jun 2004 11:33:38 +1200 (NZST)
Date: Sat, 12 Jun 2004 11:33:50 +1200
From: Steve Wray <steve.wray@paradise.net.nz>
Message-id: <001601c4500c$8cb7c560$0201a8c0@fosi>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] decommision disks in LVM2 & 2.6 kernel? (pvmove broken)
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

Hi there!

I have two disks which I need to decommission.

I'm running mandrake 10 official, LVM2, 2.6.3-13 kernel.

Naturally, pvmove doesn't work.

I get "Temporary mirror activation failed"; I googled for that
and it wasn't much helpt. In fact I've spent a good couple of
hours googling for hints on this problem and it hasn't helped. 
Maybe my google-fu isn't that hot.

I only need a kernel which can perform pvmove just the once.
I don't care what other features it has, I just want to boot
into single user, pvmove, pvremove and bring it back up
with my regular, distribution kernel.

Can anyone please direct me to a 2.6 kernel which supports
pvmove? (or of course, appropriate patches. Oh and I am not
particularly interested in EVMS support, just pvmove :)

Alternatively, if I could find out which files are on the PV's which
I want to decommision, I could just move the files off and then pvremove
without having to pvmove, right? Suggestions?

Thanks!
