Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6GELO0r005774
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 10:21:24 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id m6GELDQA027480
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 10:21:13 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m6GEL8gE018171
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 10:21:08 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m6GEL8sg000738
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 10:21:08 -0400
Date: Wed, 16 Jul 2008 10:21:08 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Re: Split LV mirror or something
In-Reply-To: <bf6f43f40807160121j27df33c5o5135e1fb9fdd16f1@mail.gmail.com>
Message-ID: <Pine.LNX.4.44.0807161020330.715-100000@bmsred.bmsi.com>
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

On Wed, 16 Jul 2008, Levy Abinajm Melero Sant'Anna wrote:

> > I have one LV with some critical data, and want to make a safe copy with
> > less time possible of downtime. Could I make one mirror on a new PV
> > (lvconvert -m1) and split this copy into a new LV or/and maybe split the VG
> > into a new VG?

Why not take a snapshot, and copy that to an LV on new VG ?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
