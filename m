Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012012322.eB1NMK414023@webber.adilger.net>
Subject: Re: [linux-lvm] Using Oracle with lvm AND rawio: read(512) from /dev/raw/...
In-Reply-To: <3A28181B.9B0967CD@tls.msk.ru> "from Michael Tokarev at Dec 2, 2000
 00:28:59 am"
Date: Fri, 1 Dec 2000 16:22:20 -0700 (MST)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Michael Tokarev writes:
> The bad thing is that Oracle tries to write 512 bytes
> _when creating tablespace_ (I've set up it to use 4k
> blocks, so it will read/write 4096*n blocks after ts
> creation).  I attached some strace output from oracle
> process when creating tablespace, below.

One "hack" you could try when creating the tablespaces initially is
to symlink /dev/raw/raw100 to the block device you are using
(in this case /dev/vg0/ora0), and then when you are done with
the tabelspace creation remove the symlink and set up the raw
device as before.

I'm not 100% sure this will work, however.  Is the /dev/raw directory
a "virtual filesystem" like proc or /dev/shm?  The other possibility
is that Oracle will treat it differently because it is a block device
and not a character device, but I'm not sure of that either.

As to the real problem, I have no idea.  There were a couple of changes
that Heinz made to LVM w.r.t. block sizes, but I think that was limited
to removing constants, and not changing the actual block handling.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
