Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6RARBV23624
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2005 06:27:11 -0400
Received: from hathor.necrofish.org.uk (no-reverse.as5587.net [213.253.141.5]
	(may be forged))
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6RAQxtF021010
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2005 06:27:04 -0400
Message-ID: <42E76159.5050808@dsvr.co.uk>
Date: Wed, 27 Jul 2005 11:26:33 +0100
From: Ceri Storey <ceri.storey@dsvr.co.uk>
MIME-Version: 1.0
References: <42E4B322.6070600@dsvr.co.uk>
	<200507252245.13317.russell@coker.com.au>
In-Reply-To: <200507252245.13317.russell@coker.com.au>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Linux LVM snmp MIB.
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
To: russell@coker.com.au
Cc: linux-lvm@redhat.com

Russell Coker wrote:
> On Monday 25 July 2005 19:38, Ceri Storey <ceri.storey@dsvr.co.uk> wrote:

> It's been ages since I looked at that.  Nothing that I devised became 
> official.  It would be best if someone else took over that, I'm sure that 
> Wichert would be happy to delegate it to someone else instead of me.
> 
> Any volunteers?  Ceri, maybe you should do this.

Fair enough; although I'd welcome feedback. Also, I only really plan to
do monitoring of logical volumes for the moment.

Here's a preliminary suggestion (LVM standing for 1.3.6.1.4.1.9586.100.1)
NAME
LVM.physicalVolume			LVM.1
LVM.volumeGroup				LVM.2
LVM.volumeGroup.groupName		LVM.2.1
LVM.volumeGroup.extentSize		LVM.2.2		The size of each extent in bytes
LVM.volumeGroup.extentCount		LVM.2.3
LVM.volumeGroup.extentFree		LVM.2.4
LVM.volumeGroup.writable		LVM.2.5
LVM.volumeGroup.resizeable		LVM.2.6
LVM.volumeGroup.exported		LVM.2.7
LVM.volumeGroup.partial			LVM.2.8
LVM.logicalVolume			LVM.3		A table of devices
LVM.logicalVolume.volumeName		LVM.3.1		
LVM.logicalVolume.volumeGroup		LVM.3.2		
LVM.logicalVolume.extentCount		LVM.3.3		the number of extents in this volume
LVM.logicalVolume.reads			LVM.3.4		the number of extents in this volume
LVM.logicalVolume.writes		LVM.3.5		the number of extents in this volume

Comments? Suggestions?
-- 
ceri.storey@dsvr.co.uk (Ceri Storey)
Systems Administrator
