Return-Path: <michael@visi.com>
Date: Sun, 17 Jun 2001 13:44:43 -0500
From: idsfa@visi.com
Subject: Re: [linux-lvm] What is a good stripe size?
Message-ID: <20010617134443.A240@mitethe.eudyptes>
References: <m23d90imdv.fsf@isnogud.escape.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m23d90imdv.fsf@isnogud.escape.de>; from urs@isnogud.escape.de on Sat, Jun 16, 2001 at 03:29:16PM +0200
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

On Sat, Jun 16, 2001 at 03:29:16PM +0200, Urs Thuermann wrote:
> Using the PVs on sda2 and sdb2 I created a single VG and I want to
> create striped LVs on it now.  My questions is, how large should I
> choose the stripe size to achive optimal performance.  If I choose it
> too large, I will probably loose the win of striping.

You lose the advantage of striping if the stripe size is on the order
of the file size.  You want stripes which will be narrower than most
of the files you will be using.

The ideal stripe size is a multiple of the size of the blocks in the
filesystem.  Reads and writes work most efficiently when they can
run a block at a time, rather than having to buffer up fragments. 

These two guidelines usually leave you with a stripe which is between
1-4x your block size.

If you do not know the size of the blocks in your filesystem, there
is usually a filesystem tool which will tell you (dumpe2fs for ext2,
debugreiserfs for reiser, etc etc).

Ex.  My machine has only reiserfs.  debugreiserfs tells me that the
     filesystems use 4096 byte blocks. I therefore have 4096-byte
     wide stripes.  This also accomodates ext2 (block sizes can be
     between 1024-4096) and most of the other available filesystems,
     which use multiples of 1k.  It is a little wide for those which
     use 512 byte blocks, but I am unlikely to use such an obsolete
     fs for anything speed critical.

-- 
$ fortune -m Kellen
