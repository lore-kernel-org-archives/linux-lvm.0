Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7JNpufK012526
	for <linux-lvm@redhat.com>; Sun, 19 Aug 2007 19:51:56 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l7JNptSh010697
	for <linux-lvm@redhat.com>; Sun, 19 Aug 2007 19:51:55 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l7JNpoTo029418
	for <linux-lvm@redhat.com>; Sun, 19 Aug 2007 19:51:50 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l7JNpoYw002562
	for <linux-lvm@redhat.com>; Sun, 19 Aug 2007 19:51:50 -0400
Date: Sun, 19 Aug 2007 19:51:49 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Altering a Physical Volume's UUID on SATA hard drives
	[solved]
In-Reply-To: <6.0.3.0.1.20070818141148.03e03b50@mail.ecis.com>
Message-ID: <Pine.LNX.4.44.0708191740520.2161-100000@bmsred.bmsi.com>
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

On Sat, 18 Aug 2007, A.Lizard wrote:

> I bit-copied a backup LVM disk using dd from a Knoppix LiveCD (based on 
> Debian) and wound up with duplicate volume and uuids, meaning I couldn't 
> mount both the main and backup volumes simultaneously at the same time for 
> subsequent backups. Of course, vgrename is ineffective to allow 
> simultaneous mounting without changing the uuids.

I would suggest copying (bitwise if desired) each LV individually to another
volume group with a different name (and UUID).  This gives you a lot more
flexibility with physical storage for primary vs backup volume groups.
Furthermore, your LV backup procedure can take snapshots of each LV first.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
