Return-Path: <ardy@rdb.linux-help.org>
Date: Mon, 26 Feb 2001 16:39:46 -0500 (EST)
From: <ardy@rdb.linux-help.org>
Subject: Re: [linux-lvm] Slackware init
In-Reply-To: <20010226082718.B1481@sistina.com>
Message-ID: <Pine.LNX.4.20.0102261635050.7246-100000@rdb.linux-help.org>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, 26 Feb 2001, AJ Lewis wrote:

> I think the issue is that /proc is not yet mounted when you call vgscan.
> If you look at the tools/lib/lvm_dir_cache.c file at line 90, you will
> see that it checks for /proc/partitions.  If it finds that, it only scans
> the files in /proc/partitions.  Otherwise, it goes through all the possible
> devices LVM recognizes. 
> 
> So if you can get /proc mounted before you call vgscan, it should not take
> so long, nor should it scan for all those devices you do not have on your
> system.

Well this is the problem, since I'm trying to mount the volumes from fstab
when mount is called, how would I go about getting /proc mounted after /
is mounted read-write, but before vgscan is run?
Have /proc mounted with a separate command in rc.S after / is remounted rw
and before vgscan is run?

Are there other alternatives, like removing unused emtries in /dev, to cut
down scan time (as was mentioned on this list earlier)?
