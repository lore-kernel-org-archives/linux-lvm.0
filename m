Return-Path: <bluca@comedia.it>
Date: Fri, 26 Jan 2001 13:27:01 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Various strangeness (beta3,2.4.0/devfs)
Message-ID: <20010126132701.A24663@colombina.comedia.it>
References: <20010126114139.86952.qmail@web10904.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010126114139.86952.qmail@web10904.mail.yahoo.com>; from penguin_master_2000@yahoo.com on Fri, Jan 26, 2001 at 03:41:39AM -0800
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

On Fri, Jan 26, 2001 at 03:41:39AM -0800, Mr. Penguin wrote:
> Hi
> 
> I'm getting a few strange things happening which may
> be related to devfs. I'm running 2.4.0 with
> 0.9.1beta3, and reiserfs 3.6.26. My root filesystem is
> on LVM so I'm using an initial ramdisk.

> 2. When it does vgchange, it works but i get this
> error:
> devfs: devfs_register(): device already registered:
> "group"
> (not important, i know, but I like a tidy bootup :) )

it is a known bug with lvm devfs implementation.
it is harmless, but solving this would be long.

> 3. When the system has booted, doing any vgscans
> produces this output:
> 
as above

> 4. If I "lvremove" an LV, the block special device is
> not removed:

i modified the lvm tools so they don't delete the vg directory
when running on devfs, because it triggered an annoyng kernel bug
(the directory could not be recreated anymore), maybe this influences
also removal of device files.

> That's about all I've found so far. Please let me know
> if you require any debugging output!
> 

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
