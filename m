Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2AHjpH1011746
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 13:45:51 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2AHjKxh003681
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 13:45:20 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m2AHjF2L020658
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 13:45:15 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m2AHjFsc029172
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 13:45:15 -0400
Date: Mon, 10 Mar 2008 13:45:15 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Can I create a PV that only uses a portion of a
	partition?
In-Reply-To: <47D54FC2.9050600@redhat.com>
Message-ID: <Pine.LNX.4.44.0803101332080.29088-100000@bmsred.bmsi.com>
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

On Mon, 10 Mar 2008, Bryn M. Reeves wrote:

> > creating multiple PV on the same disk makes no sense.
> > if you were to do this you could well do without LVM and avoid the
> > hassle.
> 
> Not necessarily; Lionel could have perfectly valid reasons for wanting
> to have multiple volume groups on the same disk.

I commonly use multiple PVs.  This wastes a little space, but it allows me to
do things like:

o Use md raid1 mirroring with smaller (20-30G) pieces that need syncing.
  Very important on systems where md driver can't remember its sync
  status between reboots.

o Rearrange PVs while operating by creating, syncing and removing md raid1
  mirrors.

Granted, these should be replaced with LVM mirroring and pvmove.  But
LVM mirroring doesn't seem to be mainstream with rhel5, and pvmove doesn't
seem as trustworthy as a result (since it depends on temporary mirroring
to move LVs while operating).

Also, when upgrading a system with LVM1 to LVM2, I prefer to create
a new VG and when committed to new OS, move LVs and incorporate PVs
of old VG.  Although I've also just created an LVM1 LV for new OS, I'm
then left with a LVM1 VG, and I'm afraid to run the convert. :-)

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
