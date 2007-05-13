Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4D1Tceb031919
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 21:29:38 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4D1TapK008779
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 21:29:36 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l4D1TVXj015241
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 21:29:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l4D1TVqu027154
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 21:29:31 -0400
Date: Sat, 12 May 2007 21:29:31 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Restoring data after losing a drive
In-Reply-To: <230d1df80705121607i34a7526eo72981413f6dd1ff4@mail.gmail.com>
Message-ID: <Pine.LNX.4.44.0705122115480.27083-100000@bmsred.bmsi.com>
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

On Sat, 12 May 2007, Saad Shakhshir wrote:

> The data on the damaged disk is not recoverable at this point.  However
> there is data on the other remaining good disks that was part of that one
> large logical volume.  At this point I want to get back the remaining data
> that was in that logical volume and on the remaining good physical volumes
> without the data that was on the physical volume I lost.  I know that the
> data is still intact on those drives... I just need to know how to get my
> system to recognise that it's still there.

The solution involves restoring the metadata to memory or a replacement hard
drive from /etc/lvm (if it is intact) or a backup.  I'll let the experts
talk about details.

However, the LVM should be able to handle losing a PV and still bring LVs
for that PV online.  Any attempted IO would result in errors, of course.
But the metadata for a PV should be automatically loadable even with
the PV missing.  When the missing PV blows a hole in your large LV,
it would simplify recovering the pieces if the missing data got I/O errors.
If you replace the drive and restore the metadata, the missing data will
have whatever is on the drive.  It might help recovery to write a pattern
to the replacement drive to help recognize the missing data.

You will also need to be a filesystem wizard to navigate with a huge hole
like that.  If you have one large file with a regular record format, it
might be simplest to scan all blocks for records - then paste any missing

I used to run into such problems a lot, and developed a filesystem where
each block is tagged with the inode of the file it belonged to.  The
recovery program can recover each and every readable block into the
proper file in the proper location regardless of how much of the filesystem
is missing or garbled due to horrendous errors.  There is no inode table
either - any block can be an inode (so blowing away the first part of the
filesystem doesn't lose all your files).  There are drawbacks to
this approach, of course.  E.g. block size is reduced by the header
present on every block (and is therefore not a power of 2).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
