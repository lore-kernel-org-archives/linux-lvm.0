Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6M40T9h017773
	for <linux-lvm@redhat.com>; Tue, 22 Jul 2008 00:00:29 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6M40Jip002290
	for <linux-lvm@redhat.com>; Tue, 22 Jul 2008 00:00:19 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m6M40Dkg030062
	for <linux-lvm@redhat.com>; Tue, 22 Jul 2008 00:00:13 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m6M40D4e014023
	for <linux-lvm@redhat.com>; Tue, 22 Jul 2008 00:00:13 -0400
Date: Tue, 22 Jul 2008 00:00:13 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Wisdom of multiple disks in one VG
In-Reply-To: <1216674897.20588.14.camel@behemoth.csg.stercomm.com>
Message-ID: <Pine.LNX.4.44.0807212353050.13929-100000@bmsred.bmsi.com>
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

On Mon, 21 Jul 2008, Chris Cox wrote:

> > I have several disks, but they are all different sizes and so don't seem
> > like good candidates for a scheme with redundancy (e.g., RAID 5).

Use software raid 1, and you can mix different disk sizes.  It is somewhat
tedious when done via md driver, but quite workable.

For instance, if you have disks of 120, 200, 400 Gigs, create 120, 200, 80G
partitions on the 400.  Mirror the 120 and 200 partitions, and add to 
a volume group.  Mount the 80G as a /work partition, and convert it to 
a mirror when you get another disk.

In AIX, you just allocated mirrored LVs, and didn't have to think about
it.  Linux LVM is getting there.  If you have 3 or more physical disks,
I think the current LV mirror code will do what you want also.  (But
I confess I am still using LVM over md raid 1.)

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
