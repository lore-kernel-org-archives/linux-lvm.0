Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l494t14J018508
	for <linux-lvm@redhat.com>; Wed, 9 May 2007 00:55:01 -0400
Received: from mail.opendreams.net (mail.opendreams.net [69.88.106.142])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l494sxL9003735
	for <linux-lvm@redhat.com>; Wed, 9 May 2007 00:54:59 -0400
Message-ID: <4641541D.2010709@opendreams.net>
Date: Tue, 08 May 2007 21:54:53 -0700
From: Jesse Molina <jesse@opendreams.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Can't use LVM1 VG/LVs under LVM2;
 LV xxx: inconsistent LE count 32 != 64
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


I'm having a problem getting a Debian system from Linux kernel 2.4 to 
2.6 due to LVM.  On the 2.4 kernel/LVM1, the VGs and LVs work fine, 
mount up, and show absolutely no sign of any problem.  However, I can't 
get the 2.6 kernel/LVM2 to activate the VGs at all.

I've filed a Debian bug, which has additional information, here;
	http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=422963



The interesting error messages under 2.6 include;

	"LV tmp: inconsistent LE count 32 != 64"
	
	"System ID sorrows1107837513 on /dev/sdd3 differs from 
sorrows1107837515 for volume group"

Notice how the LE count is about half of what it should be (reports 32, 
but is actually 64).  These LVs are striped across the two disks, thus 
two 32 LE stripes in each PV that make up the VG upon which this LV exists.

Bad error checking, or actual problem?  I don't know.



This person seems to have had the same problem, though he had four stripes;
	http://www.redhat.com/archives/linux-lvm/2006-October/msg00109.html

I originally reported this problem roughly eight months ago, with no 
resolution or response;
	http://www.redhat.com/archives/linux-lvm/2006-September/msg00010.html



Help?



-- 
# Jesse Molina
# Mail = jesse@opendreams.net
# Page = page-jesse@opendreams.net
# Cell = 1.602.323.7608
# Web  = http://www.opendreams.net/jesse/
