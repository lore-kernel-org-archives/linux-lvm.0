From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgcreate not working
Message-Id: <20020313120153.B23051@sistina.com>
References: <20020310150455.E7514@majestic.ukshells.co.uk>
    <1015773451.4127.1.camel@cr227180-a>
    <20020310153909.F7514@majestic.ukshells.co.uk>
    <20020311162953.C13418@sistina.com>
    <20020312192251.GD30057@colombina.comedia.it>
MIME-Version: 1.0
In-Reply-To: <20020312192251.GD30057@colombina.comedia.it>; from
    bluca@comedia.it on Tue, Mar 12, 2002 at 08:22:51PM +0100
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
Date: Wed Mar 13 05:03:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Luca,

I have already implemented a function, which does canonical PV names and
aims to address this.
Testing this in order to have it in the LVM 1.0.4 release.

Regards,
Heinz    -- The LVM Guy --


On Tue, Mar 12, 2002 at 08:22:51PM +0100, Luca Berra wrote:
> On Mon, Mar 11, 2002 at 04:29:53PM +0100, Heinz J . Mauelshagen wrote:
> > > just tried using the long devfs names, as printed above and it works fine!
> > > argggh.  thats me being dumb.
> > 
> > No, not really.
> > Need to do something about it, so that LVM can cope with both dev pathes.
> > 
> i had an idea some time back, but no time to code,
> after an year i believe the idea is still sound, but never got around to try it
> i'll repost part of the thread, volunteers???
> 
> L.
> 
> -- 
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \

> Return-Path: <linux-lvm-admin@sistina.com>
> Delivered-To: bluca@comedia.it
> Received: from sistina.com (hermes.sistina.com [208.210.145.141])
> 	by colombina.comedia.it (Postfix) with SMTP id BEE91506D
> 	for <bluca@comedia.it>; Tue, 13 Mar 2001 07:44:43 +0000 ()
> Received: (qmail 2563 invoked from network); 13 Mar 2001 07:41:08 -0000
> Received: from localhost (HELO hermes.sistina.com) (127.0.0.1)
>   by localhost with SMTP; 13 Mar 2001 07:41:08 -0000
> Delivered-To: linux-lvm@sistina.com
> Received: (qmail 2440 invoked from network); 13 Mar 2001 07:40:04 -0000
> Received: from colombina.comedia.it (213.246.1.10)
>   by hermes.sistina.com with SMTP; 13 Mar 2001 07:40:04 -0000
> Received: by colombina.comedia.it (Postfix, from userid 506)
> 	id 0695A508D; Tue, 13 Mar 2001 07:41:02 +0000 ()
> From: Luca Berra <bluca@comedia.it>
> To: linux-lvm@sistina.com
> Cc: lvm-devel@sistina.com
> Subject: Re: [linux-lvm] Problem with vgscan/ vgcfgrestore
> Message-ID: <20010313084102.A28227@colombina.comedia.it>
> Mail-Followup-To: linux-lvm@sistina.com, lvm-devel@sistina.com
> References: <GIEGKMCLIJBKBNBCCHEACEJACAAA.heimdall@mail.org> <200103130059.f2D0xsJ01176@webber.adilger.int>
> Mime-Version: 1.0
> Content-Type: text/plain; charset=us-ascii
> Content-Disposition: inline
> User-Agent: Mutt/1.2.5i
> In-Reply-To: <200103130059.f2D0xsJ01176@webber.adilger.int>; from adilger@turbolinux.com on Mon, Mar 12, 2001 at 05:59:54PM -0700
> X-Operating-System: Linux colombina.comedia.it 2.0.36 i586
> Sender: linux-lvm-admin@sistina.com
> Errors-To: linux-lvm-admin@sistina.com
> X-BeenThere: linux-lvm@sistina.com
> X-Mailman-Version: 2.0
> Precedence: bulk
> Reply-To: linux-lvm@sistina.com
> X-Reply-To: bluca@comedia.it
> List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
> List-Post: <mailto:linux-lvm@sistina.com>
> List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
> 	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
> List-Id: linux-lvm general discussion <linux-lvm.sistina.com>
> List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
> 	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
> List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
> Date: Tue, 13 Mar 2001 08:41:02 +0100
> X-Mailfolder: mail/archives/linux/lvm-2001.gz
> 
> On Mon, Mar 12, 2001 at 05:59:54PM -0700, Andreas Dilger wrote:
> > Daniel Whiker writes:
> > > Thanks for helping.  I did in fact have devfs compiled in and mounted to an
> > > alternative path.
> > 
> > Currently devfs and LVM don't work well together, especially if it is not
> > mounted on /dev.  My patch fixes a small part of this, but it is still
> > safer to simply configure devfs out of the kernel when using LVM, until
> > your system is working properly.
> > 
> I believe the big problem is that when lvm is compiled in /proc/partitions
> contains device names in devfs format, if devfs is not mounted the lvm dir
> cache will get filled with devfs names, which do not exist.
> Another problem with devfs is symlinks (eg: /dev/sda), the lvm dircache will
> contain only the long name (/dev/scsi/....).
> 
> i have a couple of ideas, but no time to code (sorry)
> 1) using realpath in the tools to solve issue 2
> 2) checking if the devices mentioned in /proc/partition do really exist, else
>   switch the cache to "scan the dev directory mode"
> 
> 	but better than the above 
> 3) add another structure to the cache which contains aliases to the device
>  we have in the cache, aliases are added dynamically when found on the command
>  line or in the VGDA of a PV. We use 
> 	alias[c].name=possible alias;
> 	lstat(possible alias, &statbuf)
> 	if (S_ISLNK(statbuf.st_mode)) {
> 		alias[c].target=lvm_dir_cache_find(realpath(possible alias));
> 		if !(alias[c].target) stat(realptah(possible alias), &statbuf)
> 	}
> 	if (S_ISBLK(statbuf.st_mode)) {
> 		alias[c].target=lvm_dir_cache_find_dev(statbuf.st_dev>>8,statbuf.st_mode&((1<<8)-1));
> 		/* the above function has to be written*/
> 	}
> 	if (!alias[c].target) complain(loudly);
> 	c++;
> 
>   then we modify lvm_dir_cache_find to loop also on alias[], before it starts searching th
>   cache.
> 
> regards,
> L.
> 	
> P.S. in case you did not notice the above is not real code :)
> 		
> 		
> 		
> 
> -- 
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

> Return-Path: <linux-lvm-admin@sistina.com>
> Delivered-To: bluca@comedia.it
> Received: from sistina.com (hermes.sistina.com [208.210.145.141])
> 	by colombina.comedia.it (Postfix) with SMTP id B2C40506D
> 	for <bluca@comedia.it>; Tue, 13 Mar 2001 17:44:19 +0000 ()
> Received: (qmail 7493 invoked from network); 13 Mar 2001 17:41:08 -0000
> Received: from localhost (HELO hermes.sistina.com) (127.0.0.1)
>   by localhost with SMTP; 13 Mar 2001 17:41:08 -0000
> Delivered-To: linux-lvm@sistina.com
> Received: (qmail 7385 invoked from network); 13 Mar 2001 17:40:03 -0000
> Received: from fry.sistina.com (HELO antimony.sistina.com) (208.210.145.138)
>   by hermes.sistina.com with SMTP; 13 Mar 2001 17:40:03 -0000
> Received: by antimony.sistina.com (sSMTP sendmail emulation); Tue, 13 Mar 2001 11:40:54 -0600
> From: AJ Lewis <lewis@sistina.com>
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Problem with vgscan/ vgcfgrestore
> Message-ID: <20010313114054.E15679@sistina.com>
> References: <GIEGKMCLIJBKBNBCCHEACEJACAAA.heimdall@mail.org> <200103130059.f2D0xsJ01176@webber.adilger.int> <20010313084102.A28227@colombina.comedia.it>
> Mime-Version: 1.0
> Content-Type: multipart/signed; micalg=pgp-sha1;
> 	protocol="application/pgp-signature"; boundary="KuLpqunXa7jZSBt+"
> Content-Disposition: inline
> User-Agent: Mutt/1.3.15i
> In-Reply-To: <20010313084102.A28227@colombina.comedia.it>; from bluca@comedia.it on Tue, Mar 13, 2001 at 08:41:02AM +0100
> Sender: linux-lvm-admin@sistina.com
> Errors-To: linux-lvm-admin@sistina.com
> X-BeenThere: linux-lvm@sistina.com
> X-Mailman-Version: 2.0
> Precedence: bulk
> Reply-To: linux-lvm@sistina.com
> List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
> List-Post: <mailto:linux-lvm@sistina.com>
> List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
> 	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
> List-Id: linux-lvm general discussion <linux-lvm.sistina.com>
> List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
> 	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
> List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
> Date: Tue, 13 Mar 2001 11:40:54 -0600
> X-Mailfolder: mail/archives/linux/lvm-2001.gz
> 
> On Tue, Mar 13, 2001 at 08:41:02AM +0100, Luca Berra wrote:
> > i have a couple of ideas, but no time to code (sorry)
> > 1) using realpath in the tools to solve issue 2
> 
> This should be done no matter what.  I can't think of any good reason not to
> have the tools follow sym-links.
> 
> > 2) checking if the devices mentioned in /proc/partition do really exist, else
> >   switch the cache to "scan the dev directory mode"
> 
> I believe this is the way it works at present
> 
> > 	but better than the above 
> > 3) add another structure to the cache which contains aliases to the device
> >  we have in the cache, aliases are added dynamically when found on the command
> >  line or in the VGDA of a PV. We use 
> > 	alias[c].name=possible alias;
> > 	lstat(possible alias, &statbuf)
> > 	if (S_ISLNK(statbuf.st_mode)) {
> > 		alias[c].target=lvm_dir_cache_find(realpath(possible alias));
> > 		if !(alias[c].target) stat(realptah(possible alias), &statbuf)
> > 	}
> > 	if (S_ISBLK(statbuf.st_mode)) {
> > 		alias[c].target=lvm_dir_cache_find_dev(statbuf.st_dev>>8,statbuf.st_mode&((1<<8)-1));
> > 		/* the above function has to be written*/
> > 	}
> > 	if (!alias[c].target) complain(loudly);
> > 	c++;
> > 
> >   then we modify lvm_dir_cache_find to loop also on alias[], before it starts searching th
> >   cache.
> 
> This looks interesting...and could possibly help a lot as well.
> 
> Regards,
> -- 
> AJ Lewis
> Sistina Software Inc.                  Voice:  612-379-3951
> 1313 5th St SE, Suite 111              Fax:    612-379-3952
> Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
> http://www.sistina.com
> 
> Current GPG fingerprint = 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2648
> Get my key at: http://www.sistina.com/~lewis/gpgkey
>  (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)
> 
> -----Begin Obligatory Humorous Quote----------------------------------------
> Life's short and hard, kind of like a bodybuilding elf
> -----End Obligatory Humorous Quote------------------------------------------

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
