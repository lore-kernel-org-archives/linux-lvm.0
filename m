Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1NJk9iZ009684
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:46:09 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NJjxj4021616
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:46:00 -0500
Date: Wed, 23 Feb 2011 14:45:56 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D6560FE.30301@cfl.rr.com>
Message-ID: <Pine.LNX.4.64.1102231445000.14448@bmsred.bmsi.com>
References: <4D64FF3C.6080602@abpni.co.uk> <1298466573.19562.147.camel@ubuntu>
	<4D65124C.1070505@abpni.co.uk> <1298470564.19562.150.camel@ubuntu>
	<4D651735.1000802@abpni.co.uk>
	<20110223101259.77143753@bettercgi.com>
	<4D653BEF.5010600@abpni.co.uk>
	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>
	<4D6560FE.30301@cfl.rr.com>
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
To: Phillip Susi <psusi@cfl.rr.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 23 Feb 2011, Phillip Susi wrote:

> On 2/23/2011 12:54 PM, Stuart D. Gathman wrote:
> > Or maybe you want to *revert* the origin back to the state saved
> > in a snapshot.  A specific revert command is in the works, but
> > to do it manually, unmount the origin, and copy the snapshot over
> 
> That is lvconvert --merge, and it has been around for a while now.  It
> is quite handy for testing a dist-upgrade and then rolling back.

Yes, I see that it is in Fedora, but not EL5.5.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
