Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2QJRmO28775
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2005 14:27:48 -0500
Received: from natsmtp00.rzone.de (natsmtp00.rzone.de [81.169.145.165])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2QJRfmM015563
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2005 14:27:42 -0500
Received: from linux.local.domain (p3E9900F6.dip.t-dialin.net [62.153.0.246])
	by post.webmailer.de (8.13.1/8.13.1) with ESMTP id j2QJRd6J004544
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2005 20:27:40 +0100 (MET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by linux.local.domain (Postfix) with ESMTP id 0F1A280C6
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2005 20:27:32 +0100 (CET)
Message-ID: <4245B79B.9040205@boerkel.de>
Date: Sat, 26 Mar 2005 20:27:23 +0100
From: =?ISO-8859-1?Q?Thomas_B=F6rkel?= <thomas@boerkel.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] FC3 does not recognize LVM from FC1
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

HI!

I have a working FC1 system with an LVM1 volume group (with non-system 
files on it) on 2 physical volumes with 1 logical volume.

I tried to migrate that FC1 system to FC3 by restoring the backup (with 
mondorescue) from another FC3 system.

After restoring, the system booted OK but did not find my VG. pvscan 
found LVM on the 2 physical volumes, but said, they were part of 0 VGs. 
vgscan found nothing.

After some fiddling and googling, I gave up and restored FC1 on the 
system. Now FC1 did not find my VG either. Luckily, I could restore the 
LVM config data with vcfgrestore.

Now, what went wrong here or what should I have done?

I could do a fresh FC3 install and hopefully (as I have read somewhere) 
Anaconda would find my VG, but then I would have to completely configure 
(install additional software etc.) the system and I'd rather use the 
readily configured FC3 backup.

If Anaconda can do that, maybe I could do something manually? Like, 
maybe, after booting FC3 restoring the LVM1 config from the FC1 backup?

Thanks!

Thomas
