Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2LN8LQm007818
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 21 Mar 2015 19:08:21 -0400
Received: from esa2.ucsf.iphmx.com (unknown [68.232.143.34])
	by mx1.redhat.com (Postfix) with ESMTPS id 56FAAB6A27
	for <linux-lvm@redhat.com>; Sat, 21 Mar 2015 23:08:14 +0000 (UTC)
Received: from exht05.net.ucsf.edu (mx.ucsf.edu [64.54.247.193]) by
	bcuda1.ucsf.edu with ESMTP id qlbTSl3c8iw2s3mr (version=TLSv1
	cipher=AES128-SHA bits=128 verify=NO) for
	<linux-lvm@redhat.com>; Sat, 21 Mar 2015 16:08:03 -0700 (PDT)
From: "Boylan, Ross" <Ross.Boylan@ucsf.edu>
Date: Sat, 21 Mar 2015 23:08:03 +0000
Message-ID: <F1F13E14A610474196571953929C02096976D9@ex08.net.ucsf.edu>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Questions about invalid snapshot
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

The kernel logs show
Mar 21 03:39:06 markov00 kernel: [809931.281437] device-mapper: snapshots: Invalidating snapshot: Unable to allocate exception.
Mar 21 03:39:06 markov00 kernel: [809931.283835] Buffer I/O error on device dm-52, logical block 3882845
Mar 21 03:39:06 markov00 kernel: [809931.283838] lost page write due to I/O error on dm-52
Mar 21 03:39:06 markov00 kernel: [809931.283840] Buffer I/O error on device dm-52, logical block 3882811
Mar 21 03:39:06 markov00 kernel: [809931.283843] lost page write due to I/O error on dm-52
# and many more such messages
Mar 21 03:39:33 markov00 kernel: [809957.940036] lost page write due to I/O error on dm-52
Mar 21 03:39:36 markov00 kernel: [809961.553242] sched: RT throttling activated
Mar 21 03:39:37 markov00 kernel: [809962.062074] Buffer I/O error on device dm-52, logical block 256
Mar 21 03:39:37 markov00 kernel: [809962.062416] Buffer I/O error on device dm-52, logical block 256
Mar 21 03:39:37 markov00 kernel: [809962.063086] Buffer I/O error on device dm-52, logical block 256
Mar 21 03:39:37 markov00 kernel: [809962.063406] Buffer I/O error on device dm-52, logical block 256
Mar 21 03:39:37 markov00 kernel: [809962.063714] Buffer I/O error on device dm-52, logical block 256

and the snapshot volume is inactive.
# lvchange -ay bigboy/capsdt02
File descriptor 3 (/dev/tty) leaked on lvchange invocation. Parent PID 6544: /bin/bash
  /dev/bigboy/capsdt02: read failed after 0 of 4096 at 182536044544: Input/output error
  /dev/bigboy/capsdt02: read failed after 0 of 4096 at 182536101888: Input/output error
  /dev/bigboy/capsdt02: read failed after 0 of 4096 at 0: Input/output error
  /dev/bigboy/capsdt02: read failed after 0 of 4096 at 4096: Input/output error
Change of snapshot capsdt02 will also change its origin capsdt and 1 other snapshot(s). Proceed? [y/n]: n
  Logical volume capsdt02 not changed.

1) Is this from the snapshot filling, or something else going on?
2) Is it really true that changing the snapshot can change the origin and other snapshots?  I thought that should be impossible.
3) Is there any way to recover the state of the snapshot at some point before it filled?  The origin has been unchanged.
4) A recent thread on this lists suggests using thin provisioning for snapshots.  man lvcreate seems to indicate that this is only possible if the origin is thin provisioned ("Thin snapshot is created when the origin is a thin volume and the size is not specified.").  Is my understanding correct?

In this case I have an LV capsdt that is a bit-image of the disk of a physical machine, and 2 snapshots, capsdt01 and capsdt02 based on it.  I have run the snapshots as raw disks for 2 KVM virtual machines; the guest OS is Windows 7.  Otherwise I have not touched capsdt.

LVM 2.02.95 on Linux 3.2.0-4-amd64, Debian wheezy.

Thanks.
Ross Boylan
