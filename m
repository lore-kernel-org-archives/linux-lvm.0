Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8RAMxr13659
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 06:22:59 -0400
Received: from gateway.unetix.nl (a213-84-10-61.adsl.xs4all.nl [213.84.10.61])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8RAMu6D000926
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 06:22:58 -0400
Received: from localhost (localhost [127.0.0.1])
	by gateway.unetix.nl (Postfix) with ESMTP id C53801F8FC2
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 12:22:50 +0200 (CEST)
Received: from [192.168.253.129] (unknown [192.168.253.129])
	by gateway.unetix.nl (Postfix) with ESMTP id B490A1F8FC2
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 12:22:50 +0200 (CEST)
From: Wim Bakker <wim@unetix.nl>
Date: Mon, 27 Sep 2004 12:22:55 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200409271222.55865.wim@unetix.nl>
Subject: [linux-lvm] Devive mapper compile error
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

System is slackware 10, gcc 3.4.0
compiling device-mapper (both 1.00.18 and 1.00.19) give the following error:
--------------------------------------------------------------
ioctl/libdm-iface.c: In function `_flatten':
ioctl/libdm-iface.c:924: error: invalid application of `sizeof' to an 
incomplete type
ioctl/libdm-iface.c:982: error: dereferencing pointer to incomplete type
ioctl/libdm-iface.c:983: error: dereferencing pointer to incomplete type
make[1]: *** [ioctl/libdm-iface.o] Error 1
---------------------------------------------------------------

What might be causing this?


TIA
Wim Bakker
