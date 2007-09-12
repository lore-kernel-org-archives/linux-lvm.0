Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8CLfMtH002563
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 17:41:22 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l8CLfKvP030063
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 17:41:20 -0400
Date: Wed, 12 Sep 2007 17:41:15 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Rename physical volume
In-Reply-To: <87ejh3n04s.fsf@pumba.bayour.com>
Message-ID: <Pine.LNX.4.44.0709121736250.2155-100000@bmsred.bmsi.com>
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
Cc: linux-lvm@sistina.com

On Wed, 12 Sep 2007, Turbo Fredriksson wrote:

> I made a little mistake a few months ago
> when I added a disk to my VG:
> 
> ----- s n i p -----
> ----- s n i p -----
> 
> What id like to do is move all data from sdd1
> (372Gb) to the new md3 (just added - empty 465Gb)
> and then remove sdd1 and create it as md1 and
> move the data back.

Use pvmove.  You should provide kernel and lvm versions to see
if any experts here know of bugs or caveats.

> But I'm afraid of holes in the FS (XFS)...

Moving one LV at a time should keep the PEs contiguous.
I think that is what you are talking about.  XFS should work
with non-contiguous PEs, but will lose performance since
it is optimized for contiguous extents.

> Any advice in which procedure I should use
> to accomplish this?

pvmove one LV at a time.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
