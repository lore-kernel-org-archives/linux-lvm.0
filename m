Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m37Jiqbx030827
	for <linux-lvm@redhat.com>; Mon, 7 Apr 2008 15:44:52 -0400
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m37Jie26011219
	for <linux-lvm@redhat.com>; Mon, 7 Apr 2008 15:44:40 -0400
Date: Mon, 7 Apr 2008 21:44:01 +0200 (CEST)
From: Stephan Schulz <ss.c@gmx.net>
Message-ID: <Pine.LNX.4.64.0804072139280.15243@p3-700.home.all>
MIME-Version: 1.0
Subject: [linux-lvm] LVM-Metadata
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi!

As no one seems to answer my previous post, I will try to solve my problem 
by recreating the metadata. Therefore I need to know the size and location 
of the lvm-metadata of a physical volume: Is it located at the beginning 
af a disk (the whole disk is a physical volume) or also at the end? 
Overwriting the metadata should be done with

dd if=/dev/zero of=/dev/sda bs=512 count=??? (how big is the metadata? I 
don't want to overwrite portions of the data part of a physical volume)

Any help?

Regards,
Stephan

-- 

A computer is like an Old Testament god, with a lot of rules and no mercy.
- Joseph Campbell
