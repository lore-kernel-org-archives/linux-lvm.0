Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4EEs1G2010933
	for <linux-lvm@redhat.com>; Mon, 14 May 2007 10:54:01 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4EErxvB027862
	for <linux-lvm@redhat.com>; Mon, 14 May 2007 10:53:59 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l4EErrGi005622
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 14 May 2007 10:53:53 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l4EErrPn016179
	for <linux-lvm@redhat.com>; Mon, 14 May 2007 10:53:53 -0400
Date: Mon, 14 May 2007 10:53:53 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: RE: [linux-lvm] LVM on SATA/PATA disks
In-Reply-To: <00a601c7959c$dc6594b0$6600a8c0@idefix>
Message-ID: <Pine.LNX.4.44.0705141041240.16069-100000@bmsred.bmsi.com>
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

On Sun, 13 May 2007, Bertrand Renuart wrote:

> 
> What adapter would you recommend for a descent setup?

The <$100 types keep changing availability.  Here are the
lspci ids of some <$100 IDE adapters that are working great with low
overhead (mirroring with 2 disks attached, one on each channel):

105a:4d30	Promise Technology, Inc. 20267 (rev 02)
        Subsystem: Promise Technology, Inc. Ultra100  (ATA100 is old, I know)

1095:0680	CMD Technology Inc PCI0680 (rev 01)

1095:0680	Silicon Image, Inc. PCI0680 Ultra ATA-133 Host Controller (rev 02)
        Subsystem: Silicon Image, Inc. PCI0680 Ultra ATA-133 Host Controller
		(tricky to boot from due to wierd BIOS drive assignments)

I've bought 2 IDE PCI cards that didn't work well.  I pitched them and
did not record the numbers.  Shame on me, or maybe QA isn't perfect on
the cheap cards and I got a bum unit.

I haven't tried any add-on SATA boards yet.

Just buy one and try it.  Taiwan is better than China.
If you need something repeatable, you'll have to go with a $300 server
kind such as what Dell sells.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
