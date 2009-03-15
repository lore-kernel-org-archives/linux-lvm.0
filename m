Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2F0q0N9023208
	for <linux-lvm@redhat.com>; Sat, 14 Mar 2009 20:52:00 -0400
Received: from nazgul.esiway.net (Nazgul.ESIWAY.NET [193.194.16.154])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2F0pjHu009161
	for <linux-lvm@redhat.com>; Sat, 14 Mar 2009 20:51:45 -0400
Received: from Megathlon.ESI (Ghost.esi.it [193.194.16.225])
	by nazgul.esiway.net (8.13.8/8.13.8) with ESMTPS id n2F0phTZ006919
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-lvm@redhat.com>; Sun, 15 Mar 2009 01:51:44 +0100
Received: from frodo.esi (Frodo.ESI [10.10.10.13])
	by Megathlon.ESI (8.14.1/8.14.1) with ESMTP id n2F0pgZB004485
	for <linux-lvm@redhat.com>; Sun, 15 Mar 2009 01:51:43 +0100
Message-ID: <49BC511E.5040402@esiway.net>
Date: Sun, 15 Mar 2009 01:51:42 +0100
From: Marco Colombo <linux-lvm@esiway.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] fsync() and LVM
References: <49BA9BF9.3070507@esiway.net><Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>	<20090313203812.GK7445@agk.fab.redhat.com>	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>
	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
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

Stuart D. Gathman wrote:
> On Sat, 14 Mar 2009, Dietmar Maurer wrote: 
> It just means that write barriers won't get passed to the device.
> This is only a problem if the devices have write caches.  Note 
> that with multiple devices, even a FIFO write cache could cause 
> reordering between devices (one device could finish faster than another).

No, it's more than that. PostgreSQL gurus say LVM doesn't honor fsync(),
that data doesn't even get to the controller, and it doesn't matter
if the disks have write caches enabled or not. Or if they have battery backed
caches. Please read the thread I linked. If what they say it's true,
you can't use LVM for anything that needs fsync(), including mail queues
(sendmail), mail storage (imapd), as such. So I'd really like to know.

.TM.
