Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3S9spO25482
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 05:54:51 -0400
Received: from servidor.isea-ing.com (171.Red-217-127-207.pooles.rima-tde.net
	[217.127.207.171])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3S9snqg031449
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 05:54:50 -0400
Received: from 113.red-83-49-30.pooles.rima-tde.net ([83.49.30.113]
	helo=servidor1.pk25.com)
	by servidor.isea-ing.com with asmtp (Exim 3.35 #1 (Debian))
	id 1DR5j8-000700-00
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 11:54:34 +0200
Received: from servidor1.pk25.com ([192.168.0.3] helo=pk25.com)
	by servidor1.pk25.com with esmtp (sendmail 9.99 #1 (Solaris))
	id 1DR5iu-0008UU-00
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 11:54:20 +0200
From: "Diaz Rodriguez, Eduardo" <ediaz@pk25.com>
Subject: Re: [linux-lvm] LVM VG keeps disappearing
Date: Thu, 28 Apr 2005 11:54:20 +0200
Message-Id: <20050428094958.M49763@pk25.com>
In-Reply-To: <5A14AF34CFF8AD44A44891F7C9FF410503ADFBFA@usahm236.amer.corp.eds.com>
References: <5A14AF34CFF8AD44A44891F7C9FF410503ADFBFA@usahm236.amer.corp.eds.com>
MIME-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>

It is only a sugestion.

lvm version.
fdisk for all patitions
vgscan -vv in verbose mode and debug mode (if you has complied with debug)
pvscan -vv
lvscan -vv
df -k
mount

all information that you can!

On Wed, 27 Apr 2005 12:00:38 -0400, Post, Mark K wrote
> Twice now, I've had a VG "disappear" on me when I reboot my system.  
> These two instances were widely separated in time, with several 
> reboots in between.
> 
> When the system comes up vgscan runs, but I get this error:
> vgscan -- reading all physical volumes (this may take a while...)
> 
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get 
> data of volume group "vg01" from physical volume(s)
> 
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> 
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
> 
> The first time this happened, I wound up just restoring all my 
> logical volumes from backup.  This time I would like to try to 
> figure out:
> 1. How to recover from this without restoring everything from backup.
> 2. Why this happens so that a fix can be created.
> 
> So, tell me what I need to provide in the way of diagnostic 
> information, and I'll collect that.  To start with, this system is a 
> slack/390 operating system, 64-bit, running a 2.4.26 kernel.  I'm 
> running LVM 1.0.8.
> 
> Thanks,
> 
> Mark Post
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


=======================================================================================
En tus apuros y afanes, acude a los refranes. 
=======================================================================================
