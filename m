Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k28GMw109853
	for <linux-lvm@redhat.com>; Wed, 8 Mar 2006 11:22:58 -0500
Received: from tungsten.msp.technicality.org (tungsten.msp.technicality.org
	[216.250.164.46])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k28GMi40016470
	for <linux-lvm@redhat.com>; Wed, 8 Mar 2006 11:22:49 -0500
Received: from tungsten.msp.technicality.org (tungsten.msp.technicality.org
	[216.250.164.46])
	by tungsten.msp.technicality.org (8.13.4/8.13.4/Debian-3) with ESMTP id
	k28GMaK1005270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 8 Mar 2006 10:22:37 -0600
Date: Wed, 8 Mar 2006 10:22:36 -0600 (CST)
From: Nate Carlson <natecars@natecarlson.com>
Message-ID: <Pine.LNX.4.63.0603081020340.848@tungsten.msp.technicality.org>
MIME-Version: 1.0
Subject: [linux-lvm] Problem creating snapshot with 2.6.15, lvm2
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hey all,

I'm running lvm2 on a Debian box; LVM utilities version 2.01.04-5 and 
kernel version 2.6.15. I'm trying to create a snapshot, and get the 
following error:

fs:~# lvcreate -L1G -s -n Documents-backup /dev/HomeVG/Documents
   LV HomeVG/Documents-backup in use: not removing
   Couldn't deactivate new snapshot.
fs:~# lvscan
   ACTIVE            '/dev/HomeVG/Documents' [10.00 GB] inherit
   ACTIVE            '/dev/HomeVG/Documents-backup' [1.00 GB] inherit

Any idea what I can do to debug the above error? Documents-backup does not 
have a valid filesystem structure on it, but I can kill it with a 
lvremove.

Thanks!

------------------------------------------------------------------------
| nate carlson | natecars@natecarlson.com | http://www.natecarlson.com |
|       depriving some poor village of its idiot since 1981            |
------------------------------------------------------------------------
