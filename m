Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i88Kow327490
	for <linux-lvm@redhat.com>; Wed, 8 Sep 2004 16:50:58 -0400
Received: from mail.osdl.org (fw.osdl.org [65.172.181.6])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i88KoqS0018908
	for <linux-lvm@redhat.com>; Wed, 8 Sep 2004 16:50:57 -0400
Received: (from markw@localhost)
	by mail.osdl.org (8.11.6/8.11.6) id i88Kokw18116
	for linux-lvm@redhat.com; Wed, 8 Sep 2004 13:50:46 -0700
Date: Wed, 8 Sep 2004 13:50:46 -0700
From: Mark Wong <markw@osdl.org>
Message-ID: <20040908135046.A13487@osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] finding volumes when disks move
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

Hi,

I'm running linux-2.6.7 and lvm2-2.00.21 where vgscan (as well as the other
tools) can't seem to find my old volumes after I have added new devices
to my system.  The original device paths have been shifted.  Is there a
way to verify that vgscan is searching all of my new devices when it is
searching for volume groups?

-- 
Mark Wong - - markw@osdl.org
Open Source Development Lab Inc - A non-profit corporation
12725 SW Millikan Way - Suite 400 - Beaverton, OR 97005
(503) 626-2455 x 32 (office)
(503) 626-2436      (fax)
http://developer.osdl.org/markw/
