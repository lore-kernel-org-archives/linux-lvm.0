Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m53Kpg9V002507
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 16:51:42 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m53KpVkt018497
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 16:51:32 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m53KpQOL024961
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 16:51:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m53KpQIY013769
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 16:51:26 -0400
Date: Tue, 3 Jun 2008 16:51:26 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] ANNOUNCE: an experimental implementation of snapshot
	merging
In-Reply-To: <1212525819.19122.16.camel@behemoth.csg.stercomm.com>
Message-ID: <Pine.LNX.4.44.0806031650550.13721-100000@bmsred.bmsi.com>
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

On Tue, 3 Jun 2008, Chris Cox wrote:

> > Here I release the first experimental implementation of snapshot merging. 
> 
> I would think this would be VERY hard to do since both the "origin" and
> "snapshot" change (file deletes, etc).  Do you have a set of rules you
> use for the merge?

Translation: KUDOS!!

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
