Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p3RC7E61013475
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2011 08:07:14 -0400
Received: from h1782359.stratoserver.net (h1782359.stratoserver.net
	[85.214.82.195])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3RC7Ava011117
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2011 08:07:11 -0400
Received: from imac-cmo.itso-berlin.de (dns.itso-berlin.de [62.96.12.227])
	(Authenticated sender: motschke@motschke.de)
	by h1782359.stratoserver.net (Postfix) with ESMTPSA id 44D59A6C07B
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2011 14:07:09 +0200 (CEST)
From: Christian Motschke <christian@motschke.de>
Date: Wed, 27 Apr 2011 14:07:08 +0200
Message-Id: <3DD55CB0-BD41-4518-B775-7ACC67601271@motschke.de>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Cluster snapshots
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

Hi,

I tried the unstable packages of lvm2 in debian with support for clustered snapshots (2.02.84). It is unusable (at least for me ;-).
I have corosync and clvm with openais support running. Locking type is set to 3 in lvm.conf. I have only 1 server with clvm in this test setup. I hope this is not the problem.

What I did:
gcc:~# vgchange -cy vgtest
 Volume group "vgtest" successfully changed
gcc:~# vgdisplay -C
 VG     #PV #LV #SN Attr   VSize VFree
 vgtest   1   1   0 wz--nc 4.00g 3.00g
gcc:~# lvdisplay -C
 LV      VG     Attr   LSize Origin Snap%  Move Log Copy%  Convert
 test-lv vgtest -wi-a- 1.00g                                      
gcc:~# 

gcc:~# lvchange -aey vgtest/test-lv
gcc:~# lvcreate -s -n test-lv-snap -L 100m vgtest/test-lv
 Logical volume "test-lv-snap" created
gcc:~# lvdisplay -C
 LV           VG     Attr   LSize   Origin  Snap%  Move Log Copy%  Convert
 test-lv      vgtest owi-a-   1.00g                                       
 test-lv-snap vgtest swi-a- 100.00m test-lv 100.00                        

So, after I created the snapshot it is immediately disabled and 100% full. What am I doing wrong?

With kind regards.
Christian Motschke
