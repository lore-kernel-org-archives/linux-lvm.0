Message-Id: <4.2.0.58.19990829120123.010d5d90@204.151.72.2>
Date: Sun, 29 Aug 1999 12:04:21 -0600
From: Mats Wichmann <mats@laplaza.org>
Subject: Re: [linux-lvm] xfs
In-Reply-To: <Pine.LNX.3.96.990829002728.23961J-100000@aristotle.phaedo.
 com>
References: <37C82891.987EDB34@geotec.net>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

At 12:29 AM 08/29/1999 -0400, you wrote:
>-----BEGIN PGP SIGNED MESSAGE-----
>
>On Sat, 28 Aug 1999, Eric Smith wrote:
>
> > Has anyone looked at xfs?  Works great on IRIX.  If you don't think
> > ext2fs lends itself well to LVM-ing, then what about xfs?
>
>
>I have used xfs quite extensively on SGI systems, and have heard about SGI 
>delivering the goods to the Linux world.  Some features of the
>filesystem (especially direct I/O access for io intesive applications like 
>video production and the ability to maintain internal or external
>logging volumes a la xlv) make it a very tempting bet for Linux in the 
>future.  Have you heard more information on this?


Yes, please.  I am also an xfs "fan"....the early versions had a couple of
holes, in particular I discovered that a particular operation would leave
the fs in an inconsistent state.  The situation was a little unusual, as it
came out of a test suite testing "allowable" operations that nobody would
be very likely to try in "real life", but that problem has been cleaned up
and the code on IRIX is quite mature now.
