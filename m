Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9LEj4GQ005194
	for <linux-lvm@redhat.com>; Tue, 21 Oct 2008 10:45:04 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9LEint3011434
	for <linux-lvm@redhat.com>; Tue, 21 Oct 2008 10:44:50 -0400
Date: Tue, 21 Oct 2008 10:44:43 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] LVs corrupted after pvresize
In-Reply-To: <1c748a490810210707t2f006ff7q6e38b6330730e5cc@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0810211028570.22928@bmsred.bmsi.com>
References: <48F7AD78.1000002@knebb.de>
	<Pine.LNX.4.64.0810161829570.14457@bmsred.bmsi.com>
	<48F80EFB.30404@knebb.de>
	<1224221030.7772.17.camel@localhost.localdomain>
	<Pine.LNX.4.64.0810201136250.14488@bmsred.bmsi.com>
	<1224528632.6013.66.camel@localhost.localdomain>
	<48FDB947.3090509@mortent.org>
	<1c748a490810210707t2f006ff7q6e38b6330730e5cc@mail.gmail.com>
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

On Tue, 21 Oct 2008, Larry Dickson wrote:

> I thought lvdisplay --maps gave you the PV to LV mappings.

> > The AIX concept of physical extent/logical extent mapping is sorely missed
> > on linux.

He misses the AIX *flavor* of PE to LE mapping (not PV to LV).  In
AIX, each LE is mapped to 1 or more (for mirroring) PEs in arbitrary
locations.  Each LE is tracked independently in AIX - the focus is on
LEs, with LVs being simply a collection of LEs.  If a PV dies, some
LEs in a LV may have mirrors and others not.  When bringing a PV back
on line, each LE is resynchronized independently.

BTW, AIX also has "migratepv mylv srcpv dstpv" which creates a copy of
each LE on dstpv, then removes a copy of each LE on srcpv.

Why did we leave?  It had nothing to do with quality of hardware or
software from IBM.  As a small VAR, we couldn't deal with IBM directly,
and it was too expensive to deal with additional middlemen who knew less
than we did and couldn't provide support.

Additionally, I love diving into the source when I get spare moments -
something you can't do with AIX LVM.

Solaris on Sun hardware looks attractive, offering a robust LVM/FS (ZFS), 
fully supported enterprise hardware, and open source.  But it is past
the price point of our current customers, and Solaris on PCs doesn't 
justify the learning curve compared to Linux which we are already 
familiar with.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
