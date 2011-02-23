Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p1NJdglI012402
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:39:42 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NJdWVn012478
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:39:33 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p1NJdWVW001767
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:39:32 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p1NJdVQQ015501
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:39:31 -0500
Date: Wed, 23 Feb 2011 14:39:31 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D655459.6050806@gmail.com>
Message-ID: <Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>
References: <4D64FF3C.6080602@abpni.co.uk> <1298466573.19562.147.camel@ubuntu>
	<4D65124C.1070505@abpni.co.uk> <1298470564.19562.150.camel@ubuntu>
	<4D651735.1000802@abpni.co.uk>
	<20110223101259.77143753@bettercgi.com>
	<4D653BEF.5010600@abpni.co.uk>
	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>
	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>
	<4D654FBD.8030504@abpni.co.uk> <4D655459.6050806@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Snapshots and disk re-use
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
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

On Wed, 23 Feb 2011, Les Mikesell wrote:

> > > Actually, if you never (or rarely) write to the origin, lots of snapshots
> > > should be fine.
> >
> > > But every write to the origin will first copy the
> > > original origin data to every snapshot.
> > >
> > Why would origin data be copied over to the snapshot after the snapshot
> > has been created? Surely the point of a snapshot is to have "frozen" data?
> 
> Yes, is the way this actually works explained somewhere?  I would have
> expected the 'copy-on-write' blocks to be copied only on the side where the
> write is happening and relocated instead of rewriting all the snapshots that
> might be outstanding with the old data.

It should be obvious when you think about it.  You go to write to the origin, 
to a block you've never written to since creating the snapshot.  Where
are you going to save that original data?  Why in the *-cow LV of course.

The origin and snapshot LVs do not have data of their own.  The
origin data is in *-real, and new writes to the origin first read *-real,
write *-cow, then finally do the new write to *-real.  This read-write-write
cycle is tolerable for a single snapshot, but quickly gets out of hand 
with multiple snapshots.

Writes to the snapshot, on the other hand, simply write to the *-cow with
some mapping, no need to update the origin.

Reads from origin simply read from *-real.  Reads from snapshot, read
from *-cow if mapped, and from *-real otherwise.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
