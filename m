Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8HMnVJg010770
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 18:49:31 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8HMnLmw012854
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 18:49:21 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n8HMnK0G032591
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 18:49:20 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n8HMnKQo009174
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 18:49:20 -0400
Date: Thu, 17 Sep 2009 18:49:20 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
In-Reply-To: <1253201655.2339.178.camel@pc.interlinx.bc.ca>
Message-ID: <Pine.LNX.4.64.0909171844470.9058@bmsred.bmsi.com>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916181947.GB15438@us.ibm.com>
	<1253127828.3243.1.camel@delo.gdit>
	<1253181956.30299.25.camel@breeves.fab.redhat.com>
	<Pine.LNX.4.64.0909171044250.6368@bmsred.bmsi.com>
	<1253201655.2339.178.camel@pc.interlinx.bc.ca>
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

On Thu, 17 Sep 2009, Brian J. Murrell wrote:

> > The rollback also needs to be quick.
> 
> Which a snapshot will achieve.
> 
> > A snapshot with dd does the "instant" backup part ok, but rollback
> > requires 5-6 hours to copy the snapsnot to a normal LV.
> 
> Why would you copy the snapshot anywhere?  If you decided you needed a
> roll-back, you boot from the snapshot of the root filesystem and have
> the /etc/fstab in that snapshot mount any snapshots of other filesystems
> he might have made.  Personally, I keep separate /, /usr, and /var and
> so snapshot them all before an upgrade and fix up the /etc/fstab in the
> snapshot-of-/ to mount the /usr and /var snapshots (rather than the
> origins).

1) Eventually you still need to copy the snapshot to a normal LV to get 
your performance back - and that will involve 5-6 hours downtime.

2) (minor, but important) Another FAQ is "exactly how big do I need to make my
snapshot so that it is guaranteed never to overflow".

> > I always build my VGs on md* devices.
> 
> I typically have not.  I typically don't mirror anything except my
> backup volume, which fully (as in bare metal restore able) backs up
> every filesystem I have in my network.  For that reason I feel that
> mirroring the disks in all the machines is overkill.

Those with money to burn seem to favor SANs. (And cloning a PV with
a SAN and importclone is an easy solution to the OP problem - if only they had
a SAN.) I'm part of the Po' Fo'k contingent.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
