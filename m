Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q5PEZFZ5001987
	for <linux-lvm@redhat.com>; Mon, 25 Jun 2012 10:35:15 -0400
Received: from blade3.isti.cnr.it (blade3.isti.cnr.it [194.119.192.19])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q5PEZD9E011849
	for <linux-lvm@redhat.com>; Mon, 25 Jun 2012 10:35:14 -0400
Received: from [192.168.7.52] ([155.253.6.254])
	by mx.isti.cnr.it (PMDF V6.5-x6 #31988)
	with ESMTPSA id <01OH3Y77Q96OOQA4S5@mx.isti.cnr.it> for
	linux-lvm@redhat.com; Mon, 25 Jun 2012 16:34:11 +0200 (MEST)
Date: Mon, 25 Jun 2012 16:34:52 +0200
From: Spelic <spelic@shiftmail.org>
Message-id: <4FE8770C.7090502@shiftmail.org>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] Still missing for supporting dm-thin
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-lvm@redhat.com

Hello all,
thanks for your hard work in supporting dm-thin from LVM

There are still 2 important features missing that I noticed when I tried it:

1) It is not possible to backup and restore a VG config (vgcfgrestore in 
particular refuses to work) if there is a dm-thin volume. This is a very 
serious problem that does not allow to recover even non-thin volumes if 
there is a thin volume around. Even automatic backups from 
/etc/lvm/archive cannot be restored/used. This puts data at risk, please 
fix this.

2) less important: it is apparently not possible to change the --zero 
flag for a thin pool once created. This is a quite important flag that 
should be tweakable IMHO... however if #1 is fixed, one could backup the 
config, modify the flag, and restore the config to achieve that.

Thanks for your work
S.
