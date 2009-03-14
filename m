Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2EEWCSb017914
	for <linux-lvm@redhat.com>; Sat, 14 Mar 2009 10:32:12 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2EEVwYd010017
	for <linux-lvm@redhat.com>; Sat, 14 Mar 2009 10:31:59 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n2EEVq2x019001
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 14 Mar 2009 10:31:52 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n2EEVpqh006152
	for <linux-lvm@redhat.com>; Sat, 14 Mar 2009 10:31:51 -0400
Date: Sat, 14 Mar 2009 10:31:51 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: RE: [linux-lvm] fsync() and LVM
In-Reply-To: <7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>
Message-ID: <Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
References: <49BA9BF9.3070507@esiway.net><Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>
	<20090313203812.GK7445@agk.fab.redhat.com>
	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>
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

On Sat, 14 Mar 2009, Dietmar Maurer wrote:

> > Let's try to clear up the confusion.
> > 
> > Kernel device-mapper (which lvm uses) does not support write barriers
> > except in very restricted circumstances (when only one device is
> > involved and the mapping is trivial).  If dm receives a write barrier
> > which is not supported it notifies the caller (typically a filesystem)
> > so appropriate action can be taken if it wishes.
> 
> Does that mean I should never use more than one device if I have
> applications depending on fsync (databases)?

It just means that write barriers won't get passed to the device.
This is only a problem if the devices have write caches.  Note 
that with multiple devices, even a FIFO write cache could cause 
reordering between devices (one device could finish faster than another).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
