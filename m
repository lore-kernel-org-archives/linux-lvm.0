Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j59CtEP09484
	for <linux-lvm@redhat.com>; Thu, 9 Jun 2005 08:55:14 -0400
Received: from mail.funsoft.com ([71.129.27.18])
	by mx2.redhat.com (8.12.11/8.12.11) with ESMTP id j59DQdHm019505
	for <linux-lvm@redhat.com>; Thu, 9 Jun 2005 09:26:40 -0400
Received: from [192.168.5.27] (funsoft.funsoft.com [192.168.11.1])
	by mail.funsoft.com (8.11.6/8.11.0) with ESMTP id j59Csqf14426
	for <linux-lvm@redhat.com>; Thu, 9 Jun 2005 05:54:53 -0700
Message-ID: <42A83B85.6060208@funsoft.com>
Date: Thu, 09 Jun 2005 08:52:21 -0400
From: Gary Eheman <eheman@funsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Raw device usage with LVM2 question
Reply-To: eheman@funsoft.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux-lvm <linux-lvm@redhat.com>

I am moving some LVM1 use to a system with LVM2.

Under LVM1, I was creating my own  /dev/raw  device nodes with mknod and 
would use the raw command to point my raw devices at a logical volume. 
The raw command would be issued to link each of my created /dev/raw/ 
devices to  "/dev/volume-group-name/logical-volume-name"

With LVM2, it appears that "/dev/volume-group-name/logical-volume-name" 
is a symbolic link to /dev/mapper/volumegroupname-logical-volume-name.
Should my raw device be pointing to the same thing (now a symlink under 
LVM2) as under LVM1?  Or should I change the raw command to point my 
/dev/raw device to the /dev/mapper/ device?

I am using SuSE 9.3 Pro, if it matters.
-- 
Gary Eheman
Fundamental Software, Inc.
http://www.funsoft.com
