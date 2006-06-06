Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k570sCKb011947
	for <linux-lvm@redhat.com>; Tue, 6 Jun 2006 20:54:12 -0400
Received: from mailout07.sul.t-online.com (mailout07.sul.t-online.com
	[194.25.134.83])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k570s9pF018964
	for <linux-lvm@redhat.com>; Tue, 6 Jun 2006 20:54:10 -0400
Received: from localhost ([127.0.0.1])
	by linuxserver.dasralph.de with esmtp (Exim 4.61)
	(envelope-from <ralph@dasralph.de>) id 1Fnk5w-0008OG-9Q
	for linux-lvm@redhat.com; Wed, 07 Jun 2006 00:32:16 +0200
Received: from linuxserver.dasralph.de ([127.0.0.1])
	by localhost (linuxserver.dasralph.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id JdSB6wXr48bK for <linux-lvm@redhat.com>;
	Wed,  7 Jun 2006 00:32:13 +0200 (CEST)
Received: from debian.dasralph.de ([192.168.1.9])
	by linuxserver.dasralph.de with esmtp (Exim 4.61)
	(envelope-from <ralph@dasralph.de>) id 1Fnk5t-0008O4-GG
	for linux-lvm@redhat.com; Wed, 07 Jun 2006 00:32:13 +0200
Message-ID: <4486026D.7050504@dasralph.de>
Date: Wed, 07 Jun 2006 00:32:13 +0200
From: Ralph Bergmann <ralph@dasralph.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Segment with extent 19632 in PV /dev/hda2 not found
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

Hello!


When I restore the configuration with:

debian:/opt# vgcfgrestore computer100 -v -f /opt/neu2.vg

i retrieve the following errormessage:

File descriptor 3 left open
File descriptor 5 left open
File descriptor 7 left open
   Incorrect metadata area header checksum
   Segment with extent 19632 in PV /dev/hda2 not found
   Couldn't read all logical volumes for volume group computer100.
   Restore failed.


What does it mean? What can I do?



Best regards! Ralph
