Return-Path: <bluca@comedia.it>
Date: Tue, 13 Mar 2001 08:41:02 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Problem with vgscan/ vgcfgrestore
Message-ID: <20010313084102.A28227@colombina.comedia.it>
References: <GIEGKMCLIJBKBNBCCHEACEJACAAA.heimdall@mail.org> <200103130059.f2D0xsJ01176@webber.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200103130059.f2D0xsJ01176@webber.adilger.int>; from adilger@turbolinux.com on Mon, Mar 12, 2001 at 05:59:54PM -0700
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
Cc: lvm-devel@sistina.com

On Mon, Mar 12, 2001 at 05:59:54PM -0700, Andreas Dilger wrote:
> Daniel Whiker writes:
> > Thanks for helping.  I did in fact have devfs compiled in and mounted to an
> > alternative path.
> 
> Currently devfs and LVM don't work well together, especially if it is not
> mounted on /dev.  My patch fixes a small part of this, but it is still
> safer to simply configure devfs out of the kernel when using LVM, until
> your system is working properly.
> 
I believe the big problem is that when lvm is compiled in /proc/partitions
contains device names in devfs format, if devfs is not mounted the lvm dir
cache will get filled with devfs names, which do not exist.
Another problem with devfs is symlinks (eg: /dev/sda), the lvm dircache will
contain only the long name (/dev/scsi/....).

i have a couple of ideas, but no time to code (sorry)
1) using realpath in the tools to solve issue 2
2) checking if the devices mentioned in /proc/partition do really exist, else
  switch the cache to "scan the dev directory mode"

	but better than the above 
3) add another structure to the cache which contains aliases to the device
 we have in the cache, aliases are added dynamically when found on the command
 line or in the VGDA of a PV. We use 
	alias[c].name=possible alias;
	lstat(possible alias, &statbuf)
	if (S_ISLNK(statbuf.st_mode)) {
		alias[c].target=lvm_dir_cache_find(realpath(possible alias));
		if !(alias[c].target) stat(realptah(possible alias), &statbuf)
	}
	if (S_ISBLK(statbuf.st_mode)) {
		alias[c].target=lvm_dir_cache_find_dev(statbuf.st_dev>>8,statbuf.st_mode&((1<<8)-1));
		/* the above function has to be written*/
	}
	if (!alias[c].target) complain(loudly);
	c++;

  then we modify lvm_dir_cache_find to loop also on alias[], before it starts searching th
  cache.

regards,
L.
	
P.S. in case you did not notice the above is not real code :)
		
		
		

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
