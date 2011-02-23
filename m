Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1NHt0Lk015441
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 12:55:00 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NHsoNA007762
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 12:54:50 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p1NHsnIV031673
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 12:54:49 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p1NHsmgF014419
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 12:54:49 -0500
Date: Wed, 23 Feb 2011 12:54:48 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D653BEF.5010600@abpni.co.uk>
Message-ID: <Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>
References: <4D64FF3C.6080602@abpni.co.uk> <1298466573.19562.147.camel@ubuntu>
	<4D65124C.1070505@abpni.co.uk> <1298470564.19562.150.camel@ubuntu>
	<4D651735.1000802@abpni.co.uk>
	<20110223101259.77143753@bettercgi.com>
	<4D653BEF.5010600@abpni.co.uk>
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

On Wed, 23 Feb 2011, Jonathan Tripathy wrote:

> > Zeroing c1_s1 first, then c1_s1_snap0-cow would zero everything,
> Thanks for the explanation. But what if I don't want to zero everything? I
> only want to return everything back to the state it was before I created the
> snapshot.

So you're not worried about the security implication of leftovers in free
space, and just want a base image to clone for new customers?

The logical thing to do is to keep the origin volume untouched (except 
for upgrading now and then), and take a snapshot for each customer.
Each snapshot would then be a new clone of the origin.  Unfortunately,
large numbers of snapshots are inefficient for writes to new data,
so you'd likely have to "dd" to an independent LV instead.  (This is being
worked on, and there are 3rd party products like Zumastor that fix it now.)

Or maybe you want to *revert* the origin back to the state saved
in a snapshot.  A specific revert command is in the works, but
to do it manually, unmount the origin, and copy the snapshot over
the *-real hidden LV, then remove the snapshot.  This does unncessary copying
of unchanged blocks, but requires only one copy, and doesn't copy each
write back to the cow table.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
