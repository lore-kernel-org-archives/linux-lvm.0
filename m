Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n14EFmVR016919
	for <linux-lvm@redhat.com>; Wed, 4 Feb 2009 09:15:48 -0500
Received: from mxh.seznam.cz (mxh.seznam.cz [77.75.72.26])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n14EFSTb023740
	for <linux-lvm@redhat.com>; Wed, 4 Feb 2009 09:15:29 -0500
Date: Wed, 04 Feb 2009 15:15:26 +0100 (CET)
From: =?us-ascii?Q?d0nald=20d0nald?= <d0nald86@seznam.cz>
Mime-Version: 1.0
Message-Id: <3780.13470-7335-1307775745-1233756926@seznam.cz>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to rescue broken RAID?
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
To: linux-lvm@redhat.com

hi, could someone help me with recover my backup partition, i got raid1 over LVM(2xWD 500GB first approximiate 470GB of both disks are linear and rest about 30GB is raid1 with mirror log on other device) and somehow both disk starts failure at same time and now i have two damaged disks. i've saved almost all data from linear part(almost 1TB). at begining it act like there's broken only sdb but when i degraded the raid partition into two separate linear the sda device srtart breaking too. so now i have partition on sda which i can mount but cant recognize all data and partition on sdb which i cannot even mount. is there any tool(or procedure) how to merge these two partition into one working?
i appriciate any kind of help.
