Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pAE4UZ0h012107
	for <linux-lvm@redhat.com>; Sun, 13 Nov 2011 23:30:36 -0500
Received: from mail.ynet.co.nz (mail.ynet.co.nz [210.48.92.21])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pAE4UXKY000399
	for <linux-lvm@redhat.com>; Sun, 13 Nov 2011 23:30:34 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.ynet.co.nz (Postfix) with ESMTP id 7DB1D27223B
	for <linux-lvm@redhat.com>; Mon, 14 Nov 2011 17:30:32 +1300 (NZDT)
Received: from mail.ynet.co.nz ([127.0.0.1])
	by localhost (mail.ynet.co.nz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JgiVahowNoBC for <linux-lvm@redhat.com>;
	Mon, 14 Nov 2011 17:30:29 +1300 (NZDT)
Received: from [10.10.10.10] (unknown [210.48.92.11])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: omiha@ynet.co.nz)
	by mail.ynet.co.nz (Postfix) with ESMTPSA id 1A751272237
	for <linux-lvm@redhat.com>; Mon, 14 Nov 2011 17:30:29 +1300 (NZDT)
Message-ID: <4EC09964.1080305@omiha.com>
Date: Mon, 14 Nov 2011 17:30:28 +1300
From: Jan Bakuwel <jan.bakuwel@omiha.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Unable to remove LVs
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

LVM 2.02.39-7 on Debian Lenny 64 bit with Xen 3.2-1

I have a few LVs that I can't get rid of:

server1:/# ls -al /dev/mapper/*oa*
brw-rw---- 1 root disk 254,  7 2011-07-22 19:40 /dev/mapper/d-pdc.oa.c
brw-rw---- 1 root disk 254, 78 2011-10-30 13:04 /dev/mapper/d-pdc.oa.cp1
server1:/# kpartx -l /dev/mapper/d-pdc.oa.c
d-pdc.oa.c1 : 0 71103627 /dev/mapper/d-pdc.oa.c 63
server1:/# kpartx -d /dev/mapper/d-pdc.oa.c
server1:/# kpartx -d /dev/mapper/d-pdc.oa.c1
failed to stat() /dev/mapper/d-pdc.oa.c1
server1:/# lvs | grep oa
  pdc.oa.c         d    -wi-ao  37.00G                                    

There were a couple of other open LVs that I could successfully delete
using the method described above but this one seems to be a bit harder
to convince. The LV surely isn't open by anything I can identify (not
mounted etc), but the kernel seems to think otherwise.

Any suggestions?

kind regards,
Jan
