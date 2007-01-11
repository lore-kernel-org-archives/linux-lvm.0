Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0BHDfRV010288
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 12:13:41 -0500
Received: from tungsten.msp.technicality.org (tungsten.msp.technicality.org
	[216.250.164.46])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0BHDeYp013930
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 12:13:40 -0500
Received: from tungsten.msp.technicality.org (tungsten.msp.technicality.org
	[216.250.164.46])
	by tungsten.msp.technicality.org (8.13.4/8.13.4/Debian-3sarge3) with
	ESMTP id l0BHDXKI029803
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 11:13:33 -0600
Date: Thu, 11 Jan 2007 11:13:33 -0600 (CST)
From: Nate Carlson <natecars@natecarlson.com>
Message-ID: <Pine.LNX.4.63.0701111112520.28722@tungsten.msp.technicality.org>
MIME-Version: 1.0
Subject: [linux-lvm] Combination of clvm and non-cluster?
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

I'd like to have my local disks (including the root fs) on LVM, along with 
running CLVM for remote disks.. is it possible to mix both? Once I change 
the locking system in lvm.conf for clvm, I can no longer 
pvscan/lvscan/etc.  :(

------------------------------------------------------------------------
| nate carlson | natecars@natecarlson.com | http://www.natecarlson.com |
|       depriving some poor village of its idiot since 1981            |
------------------------------------------------------------------------
