Return-Path: <raheesom@navpoint.com>
Subject: Re: [linux-lvm] Patching my kernel.
From: Rupert Heesom <raheesom@navpoint.com>
In-Reply-To: <20010509160319.C898@66bassett.freeserve.co.uk>
References: <989363474.1329.2.camel@localhost>
	<20010509085110.G23157@colombina.comedia.it>
	<989404772.3725.0.camel@localhost> 
	<20010509160319.C898@66bassett.freeserve.co.uk>
Date: 09 May 2001 07:43:14 -0400
Message-Id: <989408594.3725.3.camel@localhost>
Mime-Version: 1.0
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
Cc: hornber@btconnect.com

On 09 May 2001 16:03:19 +0100, Joe Thornber wrote:
> On Wed, May 09, 2001 at 06:39:31AM -0400, Rupert Heesom wrote:
> > On 09 May 2001 08:51:10 +0200, Luca Berra wrote:
> > > On Tue, May 08, 2001 at 07:11:14PM -0400, Rupert Heesom wrote:
> > BTW, I know there's a way to keep the config from the "used kernel", so
> > that I don't have to guess the settings again for my system (I made
> > several config errors last time).  Can you remind me how to migrate the
> > .config file across to a new source tree?   I'll try & find some docs on
> > how to do this, but have forgotten where I last read about it.
> 
> Just keep a copy of the .config file, when you untar a new kernel
> tree copy the .config file back and do a 'make oldconfig', you will be
> prompted for any new options.
> 
> I tend to have a few of these .config's for different setups.  eg. 
> 
> config-2.2-new_raid-lvm-kdb
> config-2.2-lvm-kdb
> etc.

Joe:  I've untarred a new kernel archive & sorted the linux symlink to
"kernel-2.4.3", etc.  Copied the .config file to the linux directory.

Then ran the patch -p1 < <path to patch file> from the linux directory.

I got a whole lot of errors -

[root@localhost linux]#patch -p1 <
/usr/src/patch_gen_7/PATCHES/lvm-0.9.1_beta7-2.4.3.patch
patching file include/linux/lvm.h
Hunk #1 FAILED at 67.
Hunk #2 FAILED at 75.
Hunk #3 FAILED at 616.
Hunk #4 FAILED at 639.
4 out of 4 hunks FAILED -- saving rejects to file
include/linux/lvm.h.rej
patching file drivers/md/lvm.c
Hunk #1 FAILED at 194.
Hunk #2 FAILED at 359.
Hunk #3 succeeded at 459 with fuzz 2 (offset 11 lines).
Hunk #4 FAILED at 1126.
Hunk #5 FAILED at 1166.
Hunk #6 FAILED at 1204.
Hunk #7 FAILED at 1310.
Hunk #8 FAILED at 1350.
Hunk #9 FAILED at 2314.
8 out of 9 hunks FAILED -- saving rejects to file drivers/md/lvm.c.rej
can't find file to patch@input line 229
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|--- linux/drivers/md/lvm-fs.c.orig	Wed Apr 11 23:49:20 2001
|+++ linux/drivers/md/lvm-fs.c	Mon May  7 18:40:26 2001
--------------------------
File to patch: 

What am I doing wrong??  I next tried to run the "make oldconfig" from
the linux directory.  It didn't ask for any input, just did it's thing.
Then I reran the patch command, but with the same result.

What a learning curve!!  What next?
-- 
regs
rupert
