Date: Tue, 31 Oct 2000 08:30:19 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM Partition Dependency
Message-ID: <20001031083019.B12775@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <OFF2FCF487.B6859C5B-ON86256988.00627B8E@imation.com> <20001030225211.A26323@srv.t-online.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20001030225211.A26323@srv.t-online.de>; from Heinz.Mauelshagen@t-online.de on Mon, Oct 30, 2000 at 10:52:11PM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Mon, Oct 30, 2000 at 10:52:11PM +0000, Heinz J. Mauelshagen wrote:
> > 
> > I'm not having any luck with pvcreate tool shipped with SuSE 6.4 and
> > 
> > LVM 0.8final.
> 
> It should work in 6.4 with NBD and major 43.
> Did you run a "pvcreate -d" to figure the reason out?

allow me to guess :))))
since nbd is not a partitionable device, the dir_cache entry
is screwed by a bug in pv_get_size.c,
i posted a patch to this list earlier, andreas should have
updated his RPM.

L.


-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
