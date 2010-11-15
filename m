Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAFNq4vx004700
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 18:52:04 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAFNpb6c012550
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 18:51:44 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oAFNpbwn016921
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 18:51:37 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id oAFNpb8m004996
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 18:51:37 -0500
Date: Mon, 15 Nov 2010 18:51:37 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <AANLkTimzHm_zhG97cpCnnAO_mTDzEnftDGB=OQ8G-417@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1011151846160.4947@bmsred.bmsi.com>
References: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
	<4CDDBF95.9040104@q7.com> <4CDDCF7E.4070006@q7.com>
	<AANLkTik5soU2jrS+MpDbAO6PBTEw-Qy-gtUiiyrXkEgs@mail.gmail.com>
	<4CDDE2CE.90907@bmsi.com>
	<AANLkTimzHm_zhG97cpCnnAO_mTDzEnftDGB=OQ8G-417@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] advice for curing terrible snapshot performance?
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

On Mon, 15 Nov 2010, chris (fool) mccraw wrote:

> > BTW, rewriting that 1G file would be normal speed, since
> > the modified chunks have already been copied to the snapshot.
> 
> i'd think that, and you'd think that, but it is not the case.  most of
> my tests were done by rewriting the file 4x, and while the snap %used
> (monitored with the 'lvs' command) doesn't keep going up, performance
> stays the same.

Are you writing to the snapshot or the origin?  If writing to the
snapshot, and if your snap% is stable, then you are getting the addition seek
time to jump over to the COW for those sectors.

Once the COW has the copy of the original data for a chunk, then reads/writes
to that chunk on the origin should be identical to reads/writes without the
snapshot, except for some minor CPU overhead.

Another possibility is that while the snap% is not visibly increasing, you
are in fact updating new areas with each test.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
