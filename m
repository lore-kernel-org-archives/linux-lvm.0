Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAAI5oxV004521
	for <linux-lvm@redhat.com>; Mon, 10 Nov 2008 13:05:50 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAAI4QpY004347
	for <linux-lvm@redhat.com>; Mon, 10 Nov 2008 13:04:44 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id mAAI4PZk024292
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 10 Nov 2008 13:04:26 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.13.8/8.13.8) with ESMTP id mAAI4Pmc017148
	for <linux-lvm@redhat.com>; Mon, 10 Nov 2008 13:04:25 -0500
Date: Mon, 10 Nov 2008 13:04:25 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] write performance with active snapshot
In-Reply-To: <1c748a490811100711m7b09f422nb1f4eeced5d2e2bb@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0811101301570.16938@bmsred.bmsi.com>
References: <gf70ks$16f$1@ger.gmane.org>
	<1c748a490811100711m7b09f422nb1f4eeced5d2e2bb@mail.gmail.com>
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

On Mon, 10 Nov 2008, Larry Dickson wrote:

> My guess is that you are getting the typical seek overhead. Have you tried
> making a volume group out of two separate RAID arrays (driving different
> spindles), and using lvdisplay --maps to make sure the parent volume is on
> one array, the snapshot(s) on the other?

At the expense of memory, LVM could copy larger pieces to snapshot on
write.  This would improve sequential write performance with snapshots
on the same spindle.  Is there a tuning knob for that?  Does read_ahead
affect COW?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
