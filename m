Date: Tue, 4 Apr 2000 21:25:05 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: LVM 256 logical volume limit
Message-ID: <20000404212505.B4140@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <000801bf9deb$f7f3f920$2bcb1b3f@dell01> <200004041551.e34Fpju06920@webber.adilger.net>
Mime-Version: 1.0
In-Reply-To: <200004041551.e34Fpju06920@webber.adilger.net>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>

On Tue, Apr 04, 2000 at 09:51:45AM -0600, Andreas Dilger wrote:
> Michael Roever writes:
> I think the 255 LV limit is imposed by having only 16-bit device node numbers.
> LVM has 1 major device assigned, which has 255 minor devices possible.  In
> order to have more LVs, you would need to have one or more additional major
> block numbers assigned to LVM, or you can wait until 2.6 when there will
> probably be 32-bit device numbers.

or ignore the whole issue with devfs

> Linux already has such a thing - it's called "network block device",
> and it is available in 2.2 and 2.3 kernels already.

sorry, nbd sucks.
it is far too unstable to use outside of a test environment.

L.

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
