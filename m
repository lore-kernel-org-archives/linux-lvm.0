Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i52LmF013567
	for <linux-lvm@redhat.com>; Wed, 2 Jun 2004 17:48:15 -0400
Received: from mx2.lost-oasis.net (eloise.lost-oasis.net [80.67.179.98])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i52Lm9Xn022880
	for <linux-lvm@redhat.com>; Wed, 2 Jun 2004 17:48:09 -0400
Received: from meuh by mx2.lost-oasis.net with local (Exim 3.35 #1 (Debian))
	id 1BVdai-0002f1-00
	for <linux-lvm@redhat.com>; Wed, 02 Jun 2004 23:48:08 +0200
From: Yann Droneaud <ydroneaud@meuh.eu.org>
Date: Wed, 02 Jun 2004 23:48:08 +0200
Message-ID: <82hdttvdgn.fsf@eloise.tuxfamily.net>
MIME-Version: 1.0
Subject: [linux-lvm] PV resizing
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

First, sorry to bother you with my stupid question.

I have a PV set in a partition (dos partition table).

Can i resize (grow) this partition so that the PV become bigger, 
and new space will be available to the VG the PV is currently inside.

To summary, will the PV/VG take account of the new partition size ?
I would know about LVM 1 and LVM 2.

Otherwise i will have to remove my current VG.

Regards.

-- 
Yann Droneaud      <ydroneaud@meuh.eu.org>     +33 6 88 40 82 43
<yann@droneaud.com>  <meuh@tuxfamily.org>  <ydroneaud@april.org>
http://droneaud.com/ http://meuh.org/ http://meuh.tuxfamily.org/
1024D/BEA43321 5D91 B5B0 5137 B8FE 6882 FE19 CAA0 6F05 BEA4 3321
