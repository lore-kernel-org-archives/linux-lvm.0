Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2FNXIuZ008394
	for <linux-lvm@redhat.com>; Sun, 15 Mar 2009 19:33:18 -0400
Received: from nazgul.esiway.net (Nazgul.esiway.net [193.194.16.154])
	by mx2.redhat.com (8.13.8/8.13.8) with ESMTP id n2FNWwIR028699
	for <linux-lvm@redhat.com>; Sun, 15 Mar 2009 19:32:59 -0400
Received: from Megathlon.ESI (Ghost.esi.it [193.194.16.225])
	by nazgul.esiway.net (8.13.8/8.13.8) with ESMTPS id n2FNVu90015923
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 00:31:56 +0100
Received: from frodo.esi (Frodo.ESI [10.10.10.13])
	by Megathlon.ESI (8.14.1/8.14.1) with ESMTP id n2FNVtCq015218
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 00:31:56 +0100
Message-ID: <49BD8FEB.4040506@esiway.net>
Date: Mon, 16 Mar 2009 00:31:55 +0100
From: Marco Colombo <linux-lvm@esiway.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] fsync() and LVM
References: <49BA9BF9.3070507@esiway.net><Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com><20090313203812.GK7445@agk.fab.redhat.com><7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
	<7B7881568CF40E4388B615CD06F87B98098BDD@clara.maurer-it.com>
In-Reply-To: <7B7881568CF40E4388B615CD06F87B98098BDD@clara.maurer-it.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

[Please forgive double-posting, I'm not sure my previous attempt
succeeded]
Dietmar Maurer wrote:
>>> Does that mean I should never use more than one device if I have
>>> applications depending on fsync (databases)?
>> It just means that write barriers won't get passed to the device.
>> This is only a problem if the devices have write caches.
> 
> But fsync is implemented using 'write barriers' - so fsync does not
> work?
> 
> After fsync, all data should be sent from the OS to the disk controller:
> 
> a.) this work perfectly using LVM?
> 
> b.) this does not work at all using LVM?
> 
> c.) it works when you use one single physical drive with LVM?
> 
> I am confused. The thread on the postfix list claims that it does not
> work at
> all?

Well, it's on the PostgreSQL list, not postfix. But it may affect postfix
as well. Quoting postfix documentation:

 Gory details: the Postfix mail queue requires that (1) the file system
 can rename a file to a near-by directory without changing the file's
 inode number, and that (2) mail is safely stored after fsync() of that
 file (not its parent directory) returns successfully, even when that
 file is renamed to a near-by directory at some later point in time.

If fsync() doen't work, point (2) is not fulfilled.


Please note: that on PostgreSQL list is not speculation. It comes from
measurements. Benchmarks show too high transaction rates, just as if
fsync() was disabled. The explanation (they provided) is that LVM does
not honor fsync().


By some reading I've done I'm not sure. Is blkdev_issue_flush() we're
talking about? Please see: http://lkml.org/lkml/2007/5/25/71
Is a LVM (well, device mapper) device still a "FLUSHABLE device" by
that definition? Apparently it's ok not to support BIO_RW_BARRIER, as
long as you support blkdev_issue_flush(). Has something changed since then?

How would you classify a LVM device? SAFE, FLUSHABLE, BARRIER or
something else (UNSAFE)?

.TM.
