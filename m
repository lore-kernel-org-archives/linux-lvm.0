Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9NMePV12756
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2005 18:40:25 -0400
Received: from webd.globtel.pl (webd.globtel.pl [193.110.231.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9NMeGM5021236
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2005 18:40:16 -0400
From: szym@globtel.pl
Message-Id: <20051023224004.76D5A3ACF8@webd.globtel.pl>
Date: Mon, 24 Oct 2005 00:40:04 +0200 (CEST)
Subject: [linux-lvm] LVM 2.01.15  Internal lvm error, check syslog
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

ccHI,

I try to use clustered lvm, change locking_type to 2, 
use library /lib/liblvm2clusterlock.so lunch clvmd 
but something is wrong
Every time i put 'vgchange -ay' on gfs node i see
Error locking on node node1: Internal lvm error, check syslog
Error locking on node node2: Internal lvm error, check syslog
Error locking on node node3: Internal lvm error, check syslog


Szym
