Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104301816.MAA19335@lynx.turbolabs.com>
Subject: Re: [linux-lvm] Problem with UUID, vgscan, vgcfgrestore
Date: Mon, 30 Apr 2001 12:16:56 -0600 (MDT)
In-Reply-To: <20010427104702.A16169@sistina.com> from "Heinz J. Mauelshagen" at Apr 27, 2001 10:47:02 AM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Heinz writes:
> I am about to implement a vgscan option in order to support the recreation
> of the "invalid PV UUID list problem" in case a VG can't be found by vgscan
> any more.
> 
> What's your opinion (Andreas?) about it?
> 
> Do we have too many people which can't do the lvcreate/lvremove trick
> so that this work makes sense?

It is surely a fix for some of the problems.  Of course, the need for the
fix will be reduced as time goes on, so maybe a comment/#ifdef on the code
so that it will be removed at a later date.

Cheers, Andreas
-- 
Andreas Dilger                               Turbolinux filesystem development
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
