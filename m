Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2JIDXRx029301
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2010 14:13:33 -0400
Received: from EXHUB016-1.exch016.msoutlookonline.net
	(exhub016-1.exch016.msoutlookonline.net [207.5.72.163])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2JIDKXu027565
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2010 14:13:20 -0400
Message-ID: <4BA3BEBE.2010204@cfl.rr.com>
Date: Fri, 19 Mar 2010 14:13:18 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Data alignment
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

I have been trying to get my logical volume to be aligned to a 512 KB
boundary on my SSD so it lines up with the flash erase block.  I thought
I could do this with pvcreate --dataalign 1024, but this caused the data
to be aligned to a 1024 sector boundary within the partition, which
itself starts on sector 63.  I then thought the --dataalignoffsest
switch would help, but specifying 63 there caused the data to be moved
to sector 1087.  I tried giving it -63, but was told that a negative
number is not allowed.  Why not?  How can I get the data to start on
sector 1024-63 of the partition so it ends up on pysical sector 1024 of
the disk?
