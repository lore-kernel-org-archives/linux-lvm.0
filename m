Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4EKnS5a006519
	for <linux-lvm@redhat.com>; Wed, 14 May 2008 16:49:28 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4EKnIns024034
	for <linux-lvm@redhat.com>; Wed, 14 May 2008 16:49:18 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m4EKnCAY007702
	for <linux-lvm@redhat.com>; Wed, 14 May 2008 16:49:12 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m4EKnCJe005450
	for <linux-lvm@redhat.com>; Wed, 14 May 2008 16:49:12 -0400
Date: Wed, 14 May 2008 16:49:12 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] disk striping
In-Reply-To: <55c04c360805140334j34b6f67dy7409d656f68ebbb9@mail.gmail.com>
Message-ID: <Pine.LNX.4.44.0805141643580.5417-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 14 May 2008, Jorge Souto wrote:

> I use lvm in a mainframe environment, with small ECKD disks (maximum model
> 54, aprox. 45 GB). So to create a big volume a I need a lot of disks. I'm
> going to create one with 35 physical volumes. I have doubts about striping,
> particularly deciding the number of stripes in such case (35 PVs in one
> storage array rank -yeah, not good-), and the drawbacks in administration
> tasks ( growing and limitations adding pvs to a stripped volume).

Idea 1:
Make 4 PVs of 8 disks with raid1+0 (create 4 mirror pairs, then
stripe the 4 mirrors in each group).  Keep the additional 3 disks
as spares.

Idea 2:
Make 7 PVs of 5 disks with raid5 (4 disks with 1 parity).

In each case, 4 way striping accelerates read/write by 4.  Each case
is able to tolerate single disk failures. 

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
