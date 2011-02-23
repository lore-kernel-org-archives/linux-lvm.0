Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p1NJYNab011032
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:34:23 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NJYDAo010283
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:34:13 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p1NJYCAm001658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:34:12 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p1NJYBo1015359
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:34:11 -0500
Date: Wed, 23 Feb 2011 14:34:11 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D654C52.8010301@abpni.co.uk>
Message-ID: <Pine.LNX.4.64.1102231425420.14448@bmsred.bmsi.com>
References: <4D64FF3C.6080602@abpni.co.uk> <1298466573.19562.147.camel@ubuntu>
	<4D65124C.1070505@abpni.co.uk> <1298470564.19562.150.camel@ubuntu>
	<4D651735.1000802@abpni.co.uk>
	<20110223101259.77143753@bettercgi.com>
	<4D653BEF.5010600@abpni.co.uk>
	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>
	<4D654C52.8010301@abpni.co.uk>
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

> On 23/02/11 17:54, Stuart D. Gathman wrote:
> > On Wed, 23 Feb 2011, Jonathan Tripathy wrote:
> >
> > > > Zeroing c1_s1 first, then c1_s1_snap0-cow would zero everything,
> > > Thanks for the explanation. But what if I don't want to zero everything? I
> > > only want to return everything back to the state it was before I created
> > > the
> > > snapshot.
> > So you're not worried about the security implication of leftovers in free
> > space, and just want a base image to clone for new customers?
> Yes I am. This is exactly what I'm worried about. I just need to know how to
> zero out any "left over" bits of data that would be left over after removing a
> snapshot. I use snapshots for backing up a volume (by running rsync against
> the snapshot to a remote server)

If the origin is not mounted, you can just copy /dev/zero to the *-cow, then
delete the snapshot.  I am a little concerned whether that is safe while the
origin is mounted, however.  Perhaps an LVM expert can elucidate.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
