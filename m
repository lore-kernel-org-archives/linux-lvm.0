Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3NCIC16015544
	for <linux-lvm@redhat.com>; Thu, 23 Apr 2009 08:18:12 -0400
Received: from extmail.tilak.at (extmail.tilak.at [193.171.79.34])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n3NCHxNb018108
	for <linux-lvm@redhat.com>; Thu, 23 Apr 2009 08:17:59 -0400
Message-Id: <49F07888020000CF0004DE8C@tilak.at>
Date: Thu, 23 Apr 2009 14:17:44 +0200
From: "=?ISO-8859-1?Q?Arthur=20ME=DFNER?=" <arthur.messner@tilak.at>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] CLVM mirror LV Recovery
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
To: linux-lvm@redhat.com

Hello,

We have two Datacenters with two HP EVA Storage Arrays.

We installed RH Cluster ( two Nodes ) and presented each
Node 50GB from each Storage Array.

Then created PV, VG and mirrored LV on top of this.
( formatted the resulting Block Device with GFS2 )

If i simulate Storage Failure ( unpresent LUN )
the Disk access will stuck for about 1 Minute,
then restarts.

Seems OK, but the failed PV is removed from the VG.
Linear LV, no more mirror available.

Storage 1 | Storage 2
LUN 1     | LUN 2
----------------------
Fabric A and Fabric B
----------------------
NODE 1    | Node 2
LUN1, LUN2| LUN1, LUN2
PV1 , PV2 | PV1 , PV2
VG        | VG
LV-MIRROR | LV-MIRROR

How can i readd this PV, and get a consistent mirrored LV ?
I supposed that the LV resyncs after the failed PV is reactivated,
was this a false assumption ?
