Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r63ETOM9004141
	for <linux-lvm@redhat.com>; Wed, 3 Jul 2013 10:29:24 -0400
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r63ETKcP013829
	for <linux-lvm@redhat.com>; Wed, 3 Jul 2013 10:29:22 -0400
Received: from zimbra39-e7.priv.proxad.net (unknown [172.20.243.189])
	by smtp4-g21.free.fr (Postfix) with ESMTP id E53524C81BB
	for <linux-lvm@redhat.com>; Wed,  3 Jul 2013 16:29:16 +0200 (CEST)
Date: Wed, 3 Jul 2013 16:29:15 +0200 (CEST)
From: georges.giralt@free.fr
Message-ID: <694672986.201875226.1372861755810.JavaMail.root@zimbra39-e7.priv.proxad.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Resising underlying array
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

Hello 
I've an old server which use software raid and lvm (Debian based). 
It is made on a set of 3 320 GB Sata disks. 
The system is build on a couple of software mirror (3 legged): md0 is at start of disk, 200 MB size, used for /boot.
md1 is made with the remainder of the disk space and is set up as a 3 legged mirror which is the sole pv of the volume group onto which the system is built.
200 MB for /boot was sensible years ago but now is a joke. So I plan to extend these 3 partitions up to a couple of GB. And of course reduce by the same amount the 3 remaining partitions making md1.
The volume group is far from using all PE in the PV, so I hope I will be able to reduce the PV size without harm. But I'm unable to decide on a workflow and loosing data or downtime are not acceptable options... 
So I'm begging your help on a suitable workflow to make this happen.
Many thanks in advance ! 
P.S. the 3 disk are here from a time when the system was set up using mirroring into the LVM... Time long gone. 
