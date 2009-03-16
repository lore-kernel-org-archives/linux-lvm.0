Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2GHDie7017139
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 13:13:44 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2GHDU16011661
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 13:13:31 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n2GHDSC4008863
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 13:13:28 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n2GHDRT8022264
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 13:13:28 -0400
Date: Mon, 16 Mar 2009 13:13:27 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] fsync() and LVM
In-Reply-To: <49BE63E2.5010001@esiway.net>
Message-ID: <Pine.LNX.4.64.0903161304511.22113@bmsred.bmsi.com>
References: <49BA9BF9.3070507@esiway.net><Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>
	<20090313203812.GK7445@agk.fab.redhat.com>
	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>
	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
	<49BC511E.5040402@esiway.net>
	<49BE31CC.7050905@Media-Brokers.com> <49BE63E2.5010001@esiway.net>
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

On Mon, 16 Mar 2009, Marco Colombo wrote:

> >> No, it's more than that. PostgreSQL gurus say LVM doesn't honor fsync(),
> >> that data doesn't even get to the controller, and it doesn't matter

If that was the case, then just *attempting* to call fsync would corrupt
your filesystem/database- "dirty" blocks would not actually get written, but 
still get marked "clean".  Clearly, LVM does not interfere with writing
to the disk.  It is only write barriers (waiting for the writes to 
actually finish) that don't get passed through (in all but the most
simple cases).  It simply returns you to the old days when the man
page for sync() said "this queues dirty blocks for writing but does not
wait for them to finish" and shutdown scripts called sync() multiple times
with sleeps in between.

> A lying fsync() doesn't blow all your mail repository up, just you may
> loose one/two messages on a crash. Or a transaction, speaking of databases.
> If that's the case, I would like to know, that's all.

Since the fsync() returns "fail" when LVM can't map it to multiple devices,
it isn't exactly "lying".  And one possible response to a failure might be
to wait a bit.

According to the redhat guy, this problem came up when the simple block device
"flush" call was replaced with the more complex write barrier.  LVM had
no problem passing through a simple block device flush.  (Why couldn't
the simple "flush" call still be available?)  I would like to know which
kernel version made this change.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
