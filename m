Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oA9MFxug013809
	for <linux-lvm@redhat.com>; Tue, 9 Nov 2010 17:15:59 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oA9MFlp5026179
	for <linux-lvm@redhat.com>; Tue, 9 Nov 2010 17:15:48 -0500
Date: Tue, 9 Nov 2010 17:15:32 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1011071710110.20225@bmsred.bmsi.com>
Message-ID: <Pine.LNX.4.64.1011091705030.27920@bmsred.bmsi.com>
References: <4CD35D3E.5030200@cfl.rr.com>
	<Pine.LNX.4.64.1011050022550.31032@bmsred.bmsi.com>
	<4CD5F804.3040906@cfl.rr.com>
	<Pine.LNX.4.64.1011071710110.20225@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM + raid + san
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Phillip Susi <psusi@cfl.rr.com>

On Sun, 7 Nov 2010, Stuart D. Gathman wrote:

> You'd have some serious locking issues.  With RAID5, each server would have to
> lock each chunk before writing to it (which involves a read/modify/write
> cycle).  This would create serious overhead.  And you were complaining about
> SAN server overhead! :-)  RAID5 *must* be centralized.  Your scheme might work
> with RAID10, but then you'd still have to ensure that writes to mirror legs
> don't get out of order, with updates from multiple servers flying over the
> wire.

Actually, this would be an interesting driver to develop.  If each
server primarily works on its own LV, then there shouldn't be much
lock contention.  You would need a lock manager, and a special network
RAID driver that uses the lock manager to coordinate updates.
Each server would hold the lock for a chunk until it is needed by another
server.  With the assumed mostly independent access, this should be
rare, and the locking should be optimized with that in mind.  I.e.,
if you already hold the lock, just go ahead an update.  If not, then
notify the holder via the lock manager, and wait until you do hold it.

You could probably avoid the lock manager by using a broadcast based protocol
(Who has chunk 12345678?)

Oh wait, this is an LVM list...

Is anything like this contemplated for devicemapper?  There is already
locking involved with shared VGs on a traditional SAN.

It is an interesting idea to avoid a traditional SAN as a single point of
failure (the switch connecting the hosts and disks would still be a single
point of failure, but a switch is simpler than a SAN server).  All hosts would
have to be trusted.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
