Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7B1HHa12775
	for <linux-lvm@redhat.com>; Tue, 10 Aug 2004 21:17:17 -0400
Received: from chaos.ao.net (root@chaos.ao.net [208.5.40.6])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i7B1HBXn027277
	for <linux-lvm@redhat.com>; Tue, 10 Aug 2004 21:17:11 -0400
Received: from chaos.ao.net (harik@localhost [127.0.0.1])
	by chaos.ao.net (8.12.9/8.12.9/Debian-5) with ESMTP id i7B1HAGK004347
	for <linux-lvm@redhat.com>; Tue, 10 Aug 2004 21:17:10 -0400
Received: (from harik@localhost)
	by chaos.ao.net (8.12.9/8.12.9/Debian-5) id i7B1H9WN004345
	for linux-lvm@redhat.com; Tue, 10 Aug 2004 21:17:09 -0400
Date: Tue, 10 Aug 2004 21:17:09 -0400
From: Dan Merillat <dmerillat@sequiam.com>
Message-ID: <20040811011709.GK21230@chaos.ao.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] device-mapper: : dm-linear: Device lookup failed
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I can't use my CD-rom as a device-mapper target, is this intended?

"0 2048 linear /dev/hda1 0" works, "0 2048 linear /dev/hdc 0" does not.

(I'm actually trying to do encrypted CD-roms, but it's reproducable
using linear mappings as well.)

Right now I have to use a loopback device on the CD, then I can use
it as a device-mapper target.

--Dan
