Date: Tue, 31 Oct 2000 08:39:29 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] LVM Partition Dependency
Message-ID: <20001031083929.A27865@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <OFF2FCF487.B6859C5B-ON86256988.00627B8E@imation.com> <20001030225211.A26323@srv.t-online.de> <20001031083019.B12775@colombina.comedia.it>
Mime-Version: 1.0
In-Reply-To: <20001031083019.B12775@colombina.comedia.it>; from bluca@comedia.it on Tue, Oct 31, 2000 at 08:30:19AM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Berra <bluca@comedia.it>
Cc: linux-lvm@msede.com

On Tue, Oct 31, 2000 at 08:30:19AM +0100, Luca Berra wrote:
> On Mon, Oct 30, 2000 at 10:52:11PM +0000, Heinz J. Mauelshagen wrote:
> > > 
> > > I'm not having any luck with pvcreate tool shipped with SuSE 6.4 and
> > > 
> > > LVM 0.8final.
> > 
> > It should work in 6.4 with NBD and major 43.
> > Did you run a "pvcreate -d" to figure the reason out?
> 
> allow me to guess :))))
> since nbd is not a partitionable device, the dir_cache entry
> is screwed by a bug in pv_get_size.c,
> i posted a patch to this list earlier, andreas should have
> updated his RPM.

...and I have it in the 0.9 alpha source :))))

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
