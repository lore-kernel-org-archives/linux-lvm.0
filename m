Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5KLaUqZ010942
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2007 17:36:31 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5KLaSj0027432
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2007 17:36:28 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l5KLaNeY006124
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2007 17:36:23 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l5KLaNVN012692
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2007 17:36:23 -0400
Date: Wed, 20 Jun 2007 17:36:23 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Does pv failure effect whole vg?
In-Reply-To: <46796A73.1000504@vdberg.org>
Message-ID: <Pine.LNX.4.44.0706201722500.12479-100000@bmsred.bmsi.com>
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

On Wed, 20 Jun 2007, Richard van den Berg wrote:

> To answer my own question: when a pv is not available at boot time, the
> vg using that pv does not come up. So splitting vgs makes sense when you
> want to minimize the impact of one disk failure.

Hmmm.  On AIX LVM, vgs still boot when physical volumes fail, provided
there is a "quorum".  The metadata is redundantly stored on all PVs,
so a "quorum" means that more than half of the metadata copies
are available and at the same version.

I think Linux LVM stores only metadata for that PV on a PV, but there
is a backup in /etc/lvm.

If the system truly won't boot with a failed disk, that kind of adds another
reason why current LVM mirroring support is useless.

If you build your VG on raid (md devices or hardware), you solve 
the problem for now.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
