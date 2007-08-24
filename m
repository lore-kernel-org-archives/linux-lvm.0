Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7O3NMbV004633
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2007 23:23:22 -0400
Received: from host.cxdhosting.com (host.cxdhosting.com [66.98.192.74])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7O3NL3o014518
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2007 23:23:21 -0400
Received: from 64-205-249-2.client.dsl.net ([64.205.249.2]
	helo=[192.168.217.59])
	by host.cxdhosting.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.63) (envelope-from <hans@cyberxdesigns.com>)
	id 1IOPit-00064I-9V
	for linux-lvm@redhat.com; Thu, 23 Aug 2007 23:20:35 -0400
Message-ID: <46CE4F11.4050901@cyberxdesigns.com>
Date: Thu, 23 Aug 2007 23:22:57 -0400
From: "Hans C. Kaspersetz" <hans@cyberxdesigns.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshot Full
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I hate to have to ask this, but how do I handle a full snapshot that has 
been disabled?  I would like to extend the lv, remout it and keep using 
it.  However, I am getting superblock errors and the like.

I have been searching through the archives and on Google for hours and I 
must not be looking for the right thing.

Thanks in advance,
Hans


# uname -a
Linux foobar.com 2.6.9-5.ELsmp #1 SMP Wed Jan 5 19:30:39 EST 2005 i686 
i686 i386 GNU/Linux
# lvm version
  LVM version:     2.02.21-RHEL4 (2007-03-26)
  Library version: 1.02.17-RHEL4 (2007-04-24)
  Driver version:  4.1.0
