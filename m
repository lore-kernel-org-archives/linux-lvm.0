Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2TNwvO30039
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2005 18:58:57 -0500
Received: from seeker3.pacific.net.ph (seeker3.pacific.net.ph [210.23.235.106])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2TNwoL3000568
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2005 18:58:51 -0500
Received: from congo2.pacific.net.ph (congo2.pacific.net.ph [210.23.235.89])
	by seeker3.pacific.net.ph with ESMTP
	id j2TNwmk9021913 for <linux-lvm@redhat.com>;
	Wed, 30 Mar 2005 07:58:48 +0800
Received: from [210.1.105.9] (ppp9.dyn1.105.pacific.net.ph [210.1.105.9] (may
	be forged)) by congo2.pacific.net.ph with ESMTP
	id j2TNwlmb028193 for <linux-lvm@redhat.com>;
	Wed, 30 Mar 2005 07:58:47 +0800 (PHT)
Message-ID: <4249EC29.5000706@nospam.com>
Date: Wed, 30 Mar 2005 08:00:41 +0800
From: Andy Sy <andy@nospam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Putting lvm autodetect into the kernel
Reply-To: andy@neotitans.com,
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Just like the kernel is now able to autodetect and
autoenable md RAID arrays, are there plans to make
lvm do the same?  (i.e integrate the functionality
of vgscan / vgchange -ay,-an into the kernel)

If lvm really introduces as negligible an overhead
as it is touted to, there really seems to be no
reason to go with 'physical' partitions anymore and
it should go the way of the dodo.  I can see a future
where everyone installs their Linux distros on logical
volumes.



-- 
reply-to: a n d y @ n e o t i t a n s . c o m
