Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8J0LQHt015575
	for <linux-lvm@redhat.com>; Sun, 18 Sep 2011 20:21:26 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8J0LMqv001454
	for <linux-lvm@redhat.com>; Sun, 18 Sep 2011 20:21:22 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p8J0L12h022111
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 18 Sep 2011 20:21:01 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p8J0L0E9014020
	for <linux-lvm@redhat.com>; Sun, 18 Sep 2011 20:21:00 -0400
Date: Sun, 18 Sep 2011 20:21:00 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4E75F91D.4000601@bsnw.nl>
Message-ID: <alpine.LRH.2.00.1109182015050.13864@bmsred.bmsi.com>
References: <4E75F91D.4000601@bsnw.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM pretends it has more space than it actually has
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 18 Sep 2011, Gijs wrote:

> Now I wonder why LVM wants to pretend it has more space than it actually has. 
> Because when I subtract those sectors from each other, and I calculate how 
> much bytes are in those "pretended sectors", it turns out that that's the 
> exact amount that is missing (1MB).

This may not be related, but I had a problem with blockdev --getsize in Fedora
14 returning the wrong size for an IDE drive on a USB-IDE/SATA adapter.  It
returned the correct size for SATA drives on the USB adapter, and for IDE
drives connected to the internal IDE port.  So I chalked this up to wierdness
on the (nearly obsolete) USB/IDE interface.  But your problem suddenly made me
not so sure.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
