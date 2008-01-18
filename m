Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0IGrweZ013375
	for <linux-lvm@redhat.com>; Fri, 18 Jan 2008 11:53:58 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0IGrTFI023078
	for <linux-lvm@redhat.com>; Fri, 18 Jan 2008 11:53:29 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m0IGrOfY024866
	for <linux-lvm@redhat.com>; Fri, 18 Jan 2008 11:53:24 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m0IGrOnf013941
	for <linux-lvm@redhat.com>; Fri, 18 Jan 2008 11:53:24 -0500
Date: Fri, 18 Jan 2008 11:53:24 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Re: Snapshot - Commit and Rollback
In-Reply-To: <1200652675.32292.53.camel@rahul>
Message-ID: <Pine.LNX.4.44.0801181142200.13792-100000@bmsred.bmsi.com>
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

On Fri, 18 Jan 2008, Rahul Sahadevan wrote:

>      I have posted this mail regarding the SNAPSHOT operations in LVM2.
> If anyone has any clue or comments please put forward. I am deliberately
> waiting for a reply from this group. 

COMMIT and ROLLBACK features are not currently implemented.  They are
certainly possible using device-mapper.

Here is an idea about ROLLBACK.  Assume a primary LV 'P' and a snapshot
'S'.  Any writes to 'P' copies the cluster to 'S' first.  Any reads
from 'S' get the data from 'P' unless it was copied to 'S'.

Now, for a rollback, create a new snapshot 'R' (in case we change our
minds!).  In addition, reads from 'P' fetch clusters from 'S' that were
copied there, until that cluster is written on 'P'.  'P' now depends on 'S'.

To eventually get rid of 'S', we also have reads from 'P' that are mapped
to 'S' also copy the cluster from 'S' back to 'P' (after copying from 'P'
to 'R' of course).  So simply by reading all of 'P', the clusters mapped
to 'S' (the percentage displayed in lvs) can be reduced to 0, and 'S' can then
be deleted.  

This works even if 'S' is rw, but isn't a true rollback, of course, unless 'S'
is ro.  If 'S' is rw, we can call the above operation a 'COMMIT', and if we
change our minds and revert to 'R', *that* is the 'ROLLBACK'.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
