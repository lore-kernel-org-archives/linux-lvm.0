Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rBU0wU8c015868
	for <linux-lvm@redhat.com>; Sun, 29 Dec 2013 19:58:30 -0500
Received: from mail-qe0-f51.google.com (mail-qe0-f51.google.com
	[209.85.128.51])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBU0wOrT019192
	for <linux-lvm@redhat.com>; Sun, 29 Dec 2013 19:58:24 -0500
Received: by mail-qe0-f51.google.com with SMTP id 1so10802629qee.38
	for <linux-lvm@redhat.com>; Sun, 29 Dec 2013 16:58:24 -0800 (PST)
Received: from [127.0.0.1] (pool-71-126-174-26.washdc.fios.verizon.net.
	[71.126.174.26]) by mx.google.com with ESMTPSA id
	l17sm56053430qej.13.2013.12.29.16.58.23 for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 29 Dec 2013 16:58:23 -0800 (PST)
Message-ID: <52C0C51C.7060806@gmail.com>
Date: Sun, 29 Dec 2013 19:58:04 -0500
From: Guy Rouillier <guy.rouillier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvremove is not deleting the file system
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
To: linux-lvm@redhat.com

I'm using xen-create-image in an attempt to set up a new VM; host OS is 
Ubuntu Server 13.10, and I'm using LVM.  I failed in my first attempt 
due to my inexperience, so I changed some input parameters and I'm 
trying again.  The first attempt had successfully created the target LVM 
volumes for boot, root and swap, so I used lvremove to delete them.  All 
that went without error.

However, now when I try to run xen-create-image, I get the following 
error at the beginning when xen-create-image tries to create the target 
volumes:

Creating btrfs filesystem on /dev/dell-vg/oraclelinux-root
/dev/dell-vg/oraclelinux-root appears to contain an existing filesystem 
(btrfs).
Error: Use the -f option to force overwrite.
Running command 'mkfs.btrfs /dev/dell-vg/oraclelinux-root 2>&1' failed 
with exit code 256.
Aborting

I've tried searching for this error but can't find anything helpful. 
I've rerun this a dozen times and get the same result each time 
(deleting the created volumes and rebooting between each attempt.)  I 
looked in the /dev tree, and I see the dm node (dm-4) disappears after I 
run lvremove.  But apparently, lvremove doesn't delete the filesystem. 
So when I recreate the same volume in the same order, the filesystem is 
still there from the previous attempt.

How do I fix this?  Thanks.

-- 
Guy Rouillier

---
This email is free from viruses and malware because avast! Antivirus protection is active.
http://www.avast.com
