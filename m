From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200005040656.IAA11231@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] bug in lvm tools 0.8i, 0.8final
In-Reply-To: <20000503220359.A27090@cyberhqz.com> from Ryan Murray at "May 3, 2000 10: 3:59 pm"
Date: Thu, 4 May 2000 08:56:28 +0200 (MEST)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Ryan Murray <rmurray@cyberhqz.com>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> I've just come across a bug in lvm tools when not using /proc/partitions.
> 
> lvm_add_dir_cache adds an entry, but checks for duplicates with
> lvm_dir_cache_hit.  The problem is simple:
> 
> lrwxrwxrwx    1 root     root            9 May  8  1999 /dev/cdrom -> /dev/hdd
> 
> If you have that symbolic link around, it will show up in the cache as
> /dev/cdrom, so if you try to pvcreate /dev/hdd, /dev/hdd never makes it
> into the cache.

Thanks for pointing this out.

> 
> Either the duplicate mechanism should be taken out, or ignore symlinks
> and have things that check the cache dereference the symlinks...
> 

Will check that...

> -- 
> Ryan Murray, (rmurray@cyberhqz.com, rmurray@stormix.com)
> Programmer, Stormix Technologies Inc.
> The opinions expressed here are my own.

Regards,
Heinz

-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement TS                              T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
