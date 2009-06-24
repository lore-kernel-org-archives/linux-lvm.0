Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5OFDq9O030507
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 11:13:52 -0400
Received: from mail.ilcampo.com (mail.ilcampo.com [193.172.126.47])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5OFDO0n016944
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 11:13:24 -0400
Received: from unknown (HELO [172.16.50.55])
	(mark.ruijter_siennax@[84.105.188.162])
	(envelope-sender <mruijter@gmail.com>)
	by mail.ilcampo.com (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 24 Jun 2009 15:13:23 -0000
Message-ID: <4A42424B.1080208@gmail.com>
Date: Wed, 24 Jun 2009 17:12:11 +0200
From: Mark Ruijter <mruijter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Data deduplication for Linux : lessfs
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

For those who need OpenSource data deduplication today instead of
tomorrow one might take a look at lessfs.
http://www.lessfs.com
I am thinking about starting to work on a data deduplicating
blockdevice, a kernel module called blockless.
For the time being lessfs is now stable and even usable as a blockdevice
with the help of ietd, loop or nbd.

Mark Ruijter
