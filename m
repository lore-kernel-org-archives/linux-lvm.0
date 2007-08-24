Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7OIRwGT003291
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2007 14:27:58 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l7OIRu5O030893
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2007 14:27:57 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l7OIRoCQ014864
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2007 14:27:50 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l7OIRonD030495
	for <linux-lvm@redhat.com>; Fri, 24 Aug 2007 14:27:50 -0400
Date: Fri, 24 Aug 2007 14:27:50 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Snapshot Full
In-Reply-To: <46CE4F11.4050901@cyberxdesigns.com>
Message-ID: <Pine.LNX.4.44.0708241421510.30463-100000@bmsred.bmsi.com>
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

On Thu, 23 Aug 2007, Hans C. Kaspersetz wrote:

> I hate to have to ask this, but how do I handle a full snapshot that has 
> been disabled?  I would like to extend the lv, remout it and keep using 
> it.  However, I am getting superblock errors and the like.
> 
> I have been searching through the archives and on Google for hours and I 
> must not be looking for the right thing.

It is too late to extend the snapshot once it becomes full, because backups of
clusters written on the source LV were not able to be copied to the snapshot
before being overwritten.  So once the shapshot gets full, the data seen is
mostly from the past at the point of the snapshot, but with random sectors
overwritten with new data from the source LV since the point at which it became
full.  I.e., you might be able to pull out a critical file if you had to, but
it is a mess, and you are usually better off just deleting the snapsnot.

P.S.  If you need to recover a critical file, unmount (or mount readonly) the
source LV immediately so it stops overwriting the snapshot.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
