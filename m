Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0T7u0dt004373
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 02:56:00 -0500
Received: from buexe.b-5.de (buexe.b-5.de [84.19.0.30])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0T7tfNt024568
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 02:55:42 -0500
Received: from alanya.lupe-christoph.de (alanya.lupe-christoph.de
	[172.17.0.19])
	by buexe.b-5.de (8.13.8/8.13.8/b-5/buexe-3.6.3) with ESMTP id
	n0T7tcQ5017807
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 08:55:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by alanya.lupe-christoph.de (Postfix) with ESMTP id 850E72C0B1
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 08:55:22 +0100 (CET)
Received: from alanya.lupe-christoph.de ([127.0.0.1])
	by localhost (alanya.lupe-christoph.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id lfEECp45fO+h for <linux-lvm@redhat.com>;
	Thu, 29 Jan 2009 08:55:22 +0100 (CET)
Date: Thu, 29 Jan 2009 08:55:21 +0100
From: Lupe Christoph <lupe@lupe-christoph.de>
Message-ID: <20090129075521.GB9988@lupe-christoph.de>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvcreate --mirror, specifying multiple PVs per copy
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi!

I'm still integrating mirrored LVM volumes in our configuration
management system, and the most recent challenge is a volume that is
explicitly placed by specifying the PVs the original, the mirror copies,
and the mirror log reside on.

lvcreate builds a mirrored volume OK that requires multiple segments per
copy when you let it determine where to place the segments. But this is
not acceptable when you have disks that are located in different
locations for fault tolerance = you must be sure that all the segments
of a copy reside on disks in a single location.

The manpage or the command help for lvcreate do not specify the
algorithm that is used in picking the PVs lvcreate uses for the mirror
copies or the mirror log.

I tried "lvcreate --mirror 1 ... testvg PV0a,PV0b PV1a,PV1b PV2" but
that does not work...

Please advise. Thank you!
Lupe Christoph
-- 
| There is no substitute for bad design except worse design.                   |
| /me                                                                          |
