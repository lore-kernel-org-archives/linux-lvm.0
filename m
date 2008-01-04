Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m04L9HTi026902
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 16:09:17 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m04L8p5e020556
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 16:08:57 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m04L8kLN013019
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 16:08:46 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m04L8kW8005946
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 16:08:46 -0500
Date: Fri, 4 Jan 2008 16:08:46 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] How to 'copy' a volume?
In-Reply-To: <477E7E31.6080500@soe.ucsc.edu>
Message-ID: <Pine.LNX.4.44.0801041606310.5937-100000@bmsred.bmsi.com>
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

On Fri, 4 Jan 2008, Erich Weiler wrote:

> > # dd if=/dev/volgroup00/original of=/dev/volgroup00/clone bs=300k
> 
> It was probably slow, as you say, but it turns out our machines were 
> powered off by one of the other guys in our group because the UPS was 
> draining fast.  Power was lost because of a major storm on the central 
> California coast.

You can use iostat to see throughput while dd is in progress.  If
you're ambitious, you can try various blocksizes to find the optimum
for your system.

Oh.  And *don't* get source and target mixed up with dd.  I did that
once ....

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
