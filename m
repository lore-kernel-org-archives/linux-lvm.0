Return-Path: <root@srv.sistina.com>
Date: Thu, 17 May 2001 10:38:11 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] segfaults and "VGDATA .. inconsistent" beta7 tools
Message-ID: <20010517103811.A18180@sistina.com>
References: <20010516104513.C11984@sistina.com> <Pine.LNX.4.33.0105170137020.9932-100000@fogarty.jakma.org>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.33.0105170137020.9932-100000@fogarty.jakma.org>; from paul@clubi.ie on Thu, May 17, 2001 at 01:41:21AM +0100
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 17, 2001 at 01:41:21AM +0100, Paul Jakma wrote:
> On Wed, 16 May 2001, Heinz J. Mauelshagen wrote:
> 
> > The lvm library sets up a device name/number cache in order to
> > map between those. If pv_create_name_from_kdev_t() returns
> > (char*)NULL, an entry for /dev/ida/c0d0p6 couldn't be found in
> > the cache :-( Even though /dev/ida/ is a supported namespace, the
> > entry couldn't have made it into the cache, because the stat() on
> > the device returned an error.
> >
> > In order to check this, you could for eg. add a "printf ("found
> > %s\n", devpath)" after the sprintf() in lvm_add_dir_cache() in
> > lvm_dir_cache.c and and a "printf ("ADDED %s\n", devpath)" after
> > the cache_size++ in the same function.
> >
> > BTW: long time ago, we were faced with problems related to messy /dev/ entries.
> >      In case you don't run devfs you need to make sure that /dev/ entries are
> >      all right.
> 
> 
> hmm... devfs.... that got me thinking. i run devfs, but mounted on
> /devfs instead of /dev for informational purposes. search through the
> archive shows that having devfs compiled in but not mounted on /dev
> is a known problem as devfs changes /proc/partitions.
> 
> compile without devfs and hey presto both machines work fine...
> 
> > No.
> > See above.
> 
> i think i've answered it myself.

;-)

> 
> thing is, i still want to run devfs, but not on /dev. if i convert
> all the file names in /dev to be the same as in devfs then LVM would
> work, wouldn't it?

It could ;-)

There's a (not well tested) LVM_DIR_PREFIX macro in lvm.h you can
change and recompile.

In case it is possible to mount devfs additionally under /dev,
you should go for that.

> 
> regards,
> -- 
> Paul Jakma	paul@clubi.ie	paul@jakma.org
> PGP5 key: http://www.clubi.ie/jakma/publickey.txt
> -------------------------------------------
> Fortune:
> Committees have become so important nowadays that subcommittees have to
> be appointed to do the work.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
