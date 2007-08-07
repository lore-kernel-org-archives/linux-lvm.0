Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l77KZCeE029825
	for <linux-lvm@redhat.com>; Tue, 7 Aug 2007 16:35:12 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1IIVlo-0006Ql-DR
	for linux-lvm@redhat.com; Tue, 07 Aug 2007 21:35:12 +0100
Date: Tue, 7 Aug 2007 21:35:12 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Can't create snapshot
Message-ID: <20070807203512.GX2064@agk.fab.redhat.com>
References: <46B17A68.4070700@idmedia.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46B17A68.4070700@idmedia.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Aug 02, 2007 at 08:32:08AM +0200, Falko Zurell wrote:
> I still have problems creating snapshots on my Ubuntu Linux box. Most of 
> the time, snapshots can't be created with an strange error message. I 
> startet the lvcreate with very verbose output, so you can see all the 
> gory details.
 
> #activate/activate.c:762   LV vg0/daily-snap-opt in use: not deactivating
> #lvcreate.c:772   Couldn't deactivate new snapshot.

> I don't have an idea why "deactivating" of the snapshot wont work and 
> what this for.
 
Usually a problem with your udev configuration.

lvm activates it temporarily to write to it, udev opens it, lvm tries
to remove it (before reconfiguration) but can't because udev is using it.
Either udev should not be opening it, or lvm should be waiting for udev to
finish the (pointless) stuff it wants to do, depending on your point of view.
There are ongoing discussions about changing the way lvm and udev interact to
fix this properly for the long term.

Meanwhile one simple workaround is to temporarily turn off udev while creating
the snapshot.  Another involves changing your udev configuration to totally
ignore such devices.

Alasdair
-- 
agk@redhat.com
