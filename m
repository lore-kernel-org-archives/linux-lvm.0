Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3RG1RO19683
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 12:01:27 -0400
Received: from ahmler4.mail.eds.com (ahmler4.mail.eds.com [192.85.154.77])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3RG1C8R025355
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 12:01:14 -0400
Received: from ahmlir5.mail.eds.com (ahmlir5-2.mail.eds.com [192.85.154.135])
	by ahmler4.mail.eds.com (8.13.2/8.12.10) with ESMTP id j3RG13nV002354
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 12:01:03 -0400
Received: from ahmlir5.mail.eds.com (localhost [127.0.0.1])
	by ahmlir5.mail.eds.com (8.13.2/8.12.10) with ESMTP id j3RG0jkr027883
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 12:00:45 -0400
Received: from USAHM101.amer.corp.eds.com (usahm101.exmi01.exch.eds.com
	[207.37.138.189])
	by ahmlir5.mail.eds.com (8.13.2/8.12.10) with ESMTP id j3RG0jnc027878
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 12:00:45 -0400
Message-ID: <5A14AF34CFF8AD44A44891F7C9FF410503ADFBFA@usahm236.amer.corp.eds.com>
From: "Post, Mark K" <mark.post@eds.com>
Date: Wed, 27 Apr 2005 12:00:38 -0400
MIME-Version: 1.0
Subject: [linux-lvm] LVM VG keeps disappearing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

Twice now, I've had a VG "disappear" on me when I reboot my system.  These
two instances were widely separated in time, with several reboots in
between.

When the system comes up vgscan runs, but I get this error:
vgscan -- reading all physical volumes (this may take a while...)

vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume 
group "vg01" from physical volume(s)

vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created

vgscan -- WARNING: This program does not do a VGDA backup of your volume
group  

The first time this happened, I wound up just restoring all my logical
volumes from backup.  This time I would like to try to figure out:
1. How to recover from this without restoring everything from backup.
2. Why this happens so that a fix can be created.

So, tell me what I need to provide in the way of diagnostic information, and
I'll collect that.  To start with, this system is a slack/390 operating
system, 64-bit, running a 2.4.26 kernel.  I'm running LVM 1.0.8.


Thanks,

Mark Post
