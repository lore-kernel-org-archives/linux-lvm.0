Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA8Hm8ue006546
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 8 Nov 2015 12:48:08 -0500
Received: from bugzy.highpoweredhelp.com
	(173-165-161-162-atlanta.hfc.comcastbusiness.net [173.165.161.162])
	by mx1.redhat.com (Postfix) with ESMTP id A24E18E50E
	for <linux-lvm@redhat.com>; Sun,  8 Nov 2015 17:48:07 +0000 (UTC)
Received: from ABRAHAM.highpoweredhelp.local (highpoweredhelp.com
	[173.165.161.161])
	by bugzy.highpoweredhelp.com (Postfix) with ESMTPS id 323A81DA9
	for <linux-lvm@redhat.com>; Sun,  8 Nov 2015 12:38:33 -0500 (EST)
Received: from [IPv6:::1] (localhost [IPv6:::1])	by d7.highpoweredhelp.local
	(Postfix) with ESMTP id 3A1411E0187	for <linux-lvm@redhat.com>;
	Sun,  8 Nov 2015 12:41:20 -0500 (EST)
Message-ID: <563F8940.3020706@highpoweredhelp.com>
Date: Sun, 8 Nov 2015 12:41:20 -0500
From: Michael Munger <michael@highpoweredhelp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] dd on a lv?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

In preparing a lv for LUKS, I wanted to write random data to the
entirety of the logical volume.

(It's one of two lv's in the vg that are running LUKS, the other lv are
not encrypted, and all reside on the same pv, which is a linux-raid
(mdadm) device at /dev/md0).

I used dd if=/dev/urandom of=/dev/mygroup/mylogicalvolume to write
random data to the entirety of the lv device.

Here's the issue:

The lv is only 4TB (yes... this took days). I had estimated it would
stop some time early this morning. This afternoon when I checked it, dd
had claimed to have written 4.2 TB of data to a 4TB device.

I immediately thought: "How's that possible" and began to worry that it
escaped the logical volume and began to write other areas of the array.
But, dd if=/dev/mygroup/othervol1 bs=1K count=1 | hexdump -C showed a
LUKS header (as it should) and the same command on the other lv showed
the proper header as well. I took this to mean that those lv's were in tact.

How is it possible that I can write 4.2TB to a 4.0 TB logical volume?
Should I be worried that I have somehow overritten something somewhere
else? If so, how do I find and check that? (I have backups, so if I need
to restore, I need to do it now).

P.S. When I did this on the other lv, which is only 100GB, dd behaved as
expected, and wrote only 100GB of random data to the logical volume.


-- 
Michael Munger, dCAP, MCPS, MCNPS, MBSS
High Powered Help, Inc.
Microsoft Certified Professional
Microsoft Certified Small Business Specialist
Digium Certified Asterisk Professional
michael@highpoweredhelp.com
