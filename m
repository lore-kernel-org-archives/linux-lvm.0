Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1QGbI123987
	for <linux-lvm@redhat.com>; Sun, 26 Feb 2006 11:37:18 -0500
Received: from mtaout2.barak.net.il (mtaout2.barak.net.il [212.150.49.172])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1QGbEKQ029887
	for <linux-lvm@redhat.com>; Sun, 26 Feb 2006 11:37:14 -0500
Received: from default.domain ([10.11.5.43])
	by mtaout2.barak.net.il (Sun Java System Messaging Server 6.1 HotFix
	0.02 (built Aug 25 2004)) with ESMTP id
	<0IVA00KAVZLM56F0@mtaout2.barak.net.il> for
	linux-lvm@redhat.com; Sun, 26 Feb 2006 18:39:22 +0200 (IST)
Date: Sun, 26 Feb 2006 18:39:22 +0200
From: karl shaul <shaulk@013.net>
Message-id: <25b1c5291717.4401f5da@default.domain>
MIME-version: 1.0
Content-language: en
Content-transfer-encoding: 7bit
Content-disposition: inline
Subject: [linux-lvm] Manually creating device files in /dev for lvm.
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

  Can I manually  create device files (in /dev) for lvm? If so, where can I learn which
files are needed?
  I want to have a simple lvm configuration for a desktop: just one hard disk with a 
few LVs. I believe I can apriori determine the names involved, uuid, etc. Can I mknod
the device files so that no such files will be created dynamically?
