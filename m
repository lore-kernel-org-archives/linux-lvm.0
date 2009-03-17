Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2HHeIB1008693
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 13:40:18 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2HHe3Uw026557
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 13:40:03 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n2HHe2i5011189
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 13:40:02 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n2HHe2Vb029117
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 13:40:02 -0400
Date: Tue, 17 Mar 2009 13:40:02 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] fsync() and LVM
In-Reply-To: <49BFC936.8000508@esiway.net>
Message-ID: <Pine.LNX.4.64.0903171243310.28733@bmsred.bmsi.com>
References: <49BA9BF9.3070507@esiway.net><Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>
	<20090313203812.GK7445@agk.fab.redhat.com>
	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>
	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
	<49BC511E.5040402@esiway.net>
	<Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com>
	<49BFC936.8000508@esiway.net>
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

On Tue, 17 Mar 2009, Marco Colombo wrote:

> It seems to me that in my setup, disabling the caches on the disks does
> bring data to the platters, and that noone is "lying" about fsync.
> 
> Now I'm _really_ confused.

That's been my claim all along - that the broken fsync only affects
on disk cache.  LVM itself does not reorder writes in any way - it just
fails to pass along the write barrier.  fsync() does *start* writing
the dirty buffers (implemented in the fs code).  It just doesn't 
wait for the writes to finish getting to the platters.  Apparently,
it does wait for the write to get to the drive (but I'm not certain).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
