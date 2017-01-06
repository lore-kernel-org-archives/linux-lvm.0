Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v06JAMtO004749
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 6 Jan 2017 14:10:22 -0500
Received: from smtp1.dds.nl (smtp1.dds.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B8DD3F21F
	for <linux-lvm@redhat.com>; Fri,  6 Jan 2017 19:10:22 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 40C728E530
	for <linux-lvm@redhat.com>; Fri,  6 Jan 2017 20:10:20 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 06 Jan 2017 20:10:20 +0100
From: Xen <list@xenhideout.nl>
Message-ID: <78cb8a27a39f59bc31b11e1044af620f@dds.nl>
Subject: [linux-lvm] how to change UUID of PV of duplicate partition
	(followup)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux lvm <linux-lvm@redhat.com>

I mean,

This is what I mean:

   Found duplicate PV 3U9ac3Ah5lcZUf03Iwm0cgMMaKxdflg0: using /dev/sdb4 
not /dev/sdc4
   Using duplicate PV /dev/sdb4 without holders, replacing /dev/sdc4
   Volume group containing /dev/sdb4 has active logical volumes
   Physical volume /dev/sdb4 not changed
   0 physical volumes changed / 1 physical volume not changed

It immediately replaced the good PV with the bad PV (that I was trying 
to change) so I cannot actually get to the "bad" PV (which is duplicate) 
to change it without booting an external system in which I can effect 
one disk in isolation.

But, after running that command my root filesystem was now mounted 
read-only instantly so even just attaching the disk basically causes the 
entire system to instantly fail.

Real good right.

Probably my entire fault right :-/.

"Let's cause this system to crash, we'll attach a harddisk." "Job done!"

Actually I guess in this case it replaced the bad with the good but 
behind the scenes something else happened as well. This time it is 
hiding /dev/sdc4, the other time it was hiding /dev/sdb4, it seems to be 
random.

Basically any eSata system that a disk gets attached to could cause the 
operating system to fail. The same would probably be true of regular USB 
disks.

Even inserting a USB stick could crash a system like this.
