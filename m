Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2GHIdH6020131
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 13:18:39 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2GHHS2L015993
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 13:17:28 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n2GHHSwI008893
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 13:17:28 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n2GHHSBM022279
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 13:17:28 -0400
Date: Mon, 16 Mar 2009 13:17:28 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] fsync() and LVM
In-Reply-To: <49BC511E.5040402@esiway.net>
Message-ID: <Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com>
References: <49BA9BF9.3070507@esiway.net><Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>
	<20090313203812.GK7445@agk.fab.redhat.com>
	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>
	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
	<49BC511E.5040402@esiway.net>
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

On Sun, 15 Mar 2009, Marco Colombo wrote:

> Stuart D. Gathman wrote:
> > On Sat, 14 Mar 2009, Dietmar Maurer wrote: 
> > It just means that write barriers won't get passed to the device.
> > This is only a problem if the devices have write caches.  Note 
> > that with multiple devices, even a FIFO write cache could cause 
> > reordering between devices (one device could finish faster than another).
> 
> No, it's more than that. PostgreSQL gurus say LVM doesn't honor fsync(),

That is clearly wrong - since fsync() isn't LVM's responsibility.
I think they mean that fsync() can't garrantee that any writes are
actually on the platter.

> that data doesn't even get to the controller, and it doesn't matter
> if the disks have write caches enabled or not. Or if they have battery backed
> caches. Please read the thread I linked. If what they say it's true,

That is clearly wrong.  If writes don't work, nothing works.

> you can't use LVM for anything that needs fsync(), including mail queues
> (sendmail), mail storage (imapd), as such. So I'd really like to know.

fsync() is a file system call that writes dirty buffers, and then waits
for the physical writes to complete.  It is only the waiting part that
is broken.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
