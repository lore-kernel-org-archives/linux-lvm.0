Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1CNRti28923
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 18:27:55 -0500
Received: from steelemr-loadb-nat-49.caltech.edu (SteeleMR-loadb-NAT-49.caltech.edu [131.215.49.69])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1CNRtb31085
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 18:27:55 -0500
Received: from earth-dog (earth-dog [192.168.1.3])
	by water-ox-postvirus (Postfix) with ESMTP id A9F5C26AD59
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 15:27:49 -0800 (PST)
Received: from caltech.edu (good.work.caltech.edu [131.215.164.3])
	by water-ox.its.caltech.edu (Postfix) with ESMTP id BC2A026AD59
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 15:27:48 -0800 (PST)
Message-ID: <402C0BF4.3000102@caltech.edu>
From: Ling Li <ling@caltech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2 full disk & Grub
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Feb 12 18:27:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

When I was going to install a full-disk LVM2 PV on my hard disk (not for 
the root partition) with grub installed, I had very bad experience. I 
searched the internet for possible warnings. All I got were 1. LVM1 was 
known to be "unfriendly" to boot loader when the full disk is created as 
one PV. and 2. LVM2 solves this problem by allowing the label sector to 
be any of the first 4 sectors in the disk.

However, grub needs more than 3 sectors (in my system, 16 sectors), 
which still conflicts with LVM2 when the full disk is used. So if you 
happen to want to use LVM2 and grub in the same disk, you have to create 
some partitions... NOT the full disk.

I don't know why I couldn't find this kind of information on the 
internet or grub manual or LVM howto. In case there are also other users 
as "careless" as me, my this post might be useful.

By the way, is there an LVM2 howto available somewhere?

--Ling
