Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1NNQ9oe022802
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 18:26:09 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NNPxnk016309
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 18:25:59 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p1NNPwsr006065
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 18:25:58 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p1NNPv9s017533
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 18:25:57 -0500
Date: Wed, 23 Feb 2011 18:25:57 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D6572C0.6070008@abpni.co.uk>
Message-ID: <Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>
References: <4D64FF3C.6080602@abpni.co.uk> <1298466573.19562.147.camel@ubuntu>
	<4D65124C.1070505@abpni.co.uk> <1298470564.19562.150.camel@ubuntu>
	<4D651735.1000802@abpni.co.uk>
	<20110223101259.77143753@bettercgi.com>
	<4D653BEF.5010600@abpni.co.uk>
	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>
	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>
	<4D654FBD.8030504@abpni.co.uk> <4D655459.6050806@gmail.com>
	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>
	<4D656817.6060900@gmail.com>
	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>
	<4D6572C0.6070008@abpni.co.uk>
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

> Give that I currently follow the current procedure for removing and adding
> customers:
> 
> To remove customer: zero out customer LV, then remove LV
> To add customer: create a new LV
> 
> And I want to run backups of a customer's LV using snapshots I just:
> create a snapshot of the customer LV, then use rsync, then remove the
> snapshot. Is there anything I should do to prevent cross-customer data
> leakage?

You are still ambiguous.  If by "create a new LV", you mean a new LV
that is not an LVM snapshot, then just zero it out when you create it
(rather than when you delete it).

If by "create a new LV", you mean create a new snapshot on a (mostly)
readonly origin, then you don't need to do anything.  The entire logical
volume is (logically) initialized to the origin.  There is no need to
zero when deleting either.

If, in addition to "cross-customer data leakage", you are worried about
FBI raids finding old data from deleted customers in LVM free space, then zero
independent LVs when deleting (as you planned), and zero *-cow for snapshots
before deleting with the origin unmounted (but check with an expert whether
that is safe while other snapshots for the same origin are mounted - I think it
should be).

IDEA - it seems that the device mapper could logically zero an LV by
simply returning blocks of zero on reads until the corresponding block
it written.  Yeah, would require overhead to track which blocks have
been written.  That overhead could be 1 bit for each of fairly large blocks,
and be fairly small, fit into ram easily, and be stored in a logically
zeroed block and discarded when the last block is written.  So effectively
it only requires storing a pointer in meta-data to the current block where
the bitmap is stored.  I can see that compared to the simplicity of
simply writing zeroes on allocation, it might not be worth it.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
