Return-Path: <dmeyer@dmeyer.net>
Date: Mon, 5 Feb 2001 16:37:34 -0500
From: dmeyer@dmeyer.net
Subject: Re: [linux-lvm] lv extend
Message-ID: <20010205163734.A6070@jhereg.dmeyer.net>
References: <01C08F47.ADAB2B60.smdenton@bellsouth.net> <20010205143445.A5041@jhereg.dmeyer.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3A7EBEE6.14490D5F@tampabay.rr.com>
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

In article <3A7EBEE6.14490D5F@tampabay.rr.com> you write:
> dmeyer@dmeyer.net wrote:
> > FYI, reiserfs apparently allows resizing of a mounted filesystem.
> > Mind you, I'd do a backup before trying anything resembling that, but
> > then backing up before resizing is always a good idea.
> 
> Do you have anymore information on this.  I use reiser on my LV now.
> Its just scratch disks so I can play.  I am intrested in this chfs
> issue.

It's pretty easy.  Use lvextend to increase the size of the LV, then
run something like resize_reiserfs -f /dev/misc_vg/am_lv, and it'll
just work.  By default resize_reiserfs expands the filesystem to fill
the LV, but you can specify how much to grow the filesystem with -s.

This doesn't work, BTW, for shrinking.  You must unmount the
filesystem to shrink it, then use lvreduce to shrink the LV.

-- 
Dave Meyer
dmeyer@dmeyer.net
