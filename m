Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4ABJBhH027754
	for <linux-lvm@redhat.com>; Wed, 10 May 2006 07:19:11 -0400
Received: from s1.ckr-solutions.com (s1.ckr-solutions.com [82.97.10.19])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4ABJ4Ru023742
	for <linux-lvm@redhat.com>; Wed, 10 May 2006 07:19:05 -0400
Received: from localhost (localhost [127.0.0.1])
	by s1.ckr-solutions.com (Postfix) with ESMTP id 21F371D093
	for <linux-lvm@redhat.com>; Wed, 10 May 2006 13:24:29 +0200 (CEST)
Date: Wed, 10 May 2006 13:24:29 +0200 (CEST)
From: Olivier Kaloudoff <kalou@kalou.net>
Message-ID: <Pine.LNX.4.64.0605101319450.21802@s1.ckr-solutions.com>
MIME-Version: 1.0
Subject: [linux-lvm] unable to remove lvm1 volume (can't remove open logical
	volume)
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello List,

 	I'm facing a weird problem with lvm on 2.4.21-40 and
lvm tools 1.0.8-13;

[root@shinwey root]# lvremove /dev/nr_180/B_FDB
lvremove -- can't remove open  logical volume "/dev/nr_180/B_FDB"

[root@shinwey root]# lvchange  -a n /dev/nr_180/B_FDB
lvchange -- operation not permitted for (open) logical volume 
"/dev/nr_180/B_FDB"

 	After looking into list archives, I tried the two things
below without success;

[root@shinwey root]# vgscan -f
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "nr_300"
vgscan -- found active volume group "nr_180"
vgscan -- found active volume group "nr_120"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
groups

[root@shinwey root]# ls /dev/*/group | sed 's!/group!!' | xargs rm -r ; 
vgmknodes
vgmknodes -- successfully made all nodes of volume group "nr_120"
vgmknodes -- successfully made all nodes of volume group "nr_180"
vgmknodes -- successfully made all nodes of volume group "nr_300"

[root@shinwey root]# lvremove /dev/nr_180/B_FDB
lvremove -- can't remove open  logical volume "/dev/nr_180/B_FDB"

[root@shinwey root]# lvchange  -a n /dev/nr_180/B_FDB
lvchange -- operation not permitted for (open) logical volume 
"/dev/nr_180/B_FDB"



Can someone help me with this ?


Best Regards,


Olivier Kaloudoff
