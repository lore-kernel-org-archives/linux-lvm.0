From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030817182602.GA3737@gondor.com>
References: <20030816102005.GA12916@gondor.com> <20030816195606.B25758@uk.sistina.com> <20030817114638.GA1839@gondor.com> <20030817184138.E25758@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030817184138.E25758@uk.sistina.com>
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
Date: Sun Aug 17 13:27:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Aug 17, 2003 at 06:41:38PM +0100, Alasdair G Kergon wrote:
> 383/384 means the kernel mirror has only successfully copied 383 out 
> of 384 512-KB regions from (major, minor) (3,4) to (9,2).
> 
> The first pvmove segment has 
>   12 16MB extents = 393216 sectors = 384 512KB regions.

Well, now after I did some pvmoves of individual LVs, pvmove /dev/hda4
hangs at a different point:

activate/dev_manager.c:487 pvmove  Mirror status: 2 003:004 009:002 511/512
activate/dev_manager.c:532 pvmove  Mirror percent: 99.804688

dmsetup says:

0 524288 mirror core 1 1024 2 003:004 111146736 009:002 56852864 
524288 229376 linear 003:004 88864496
753664 2326528 linear 003:004 89093872
[...]

I hope I understand these numbers correctly: The first line means that
the virtual device vgraid-pvmove0 starts with 524288 blocks (512 byte
each). These are located at position 111146736 on /dev/hda4 and 
56852864 on /dev/md2. (But I don't know what core 1 1024 2 means)

I can read/write these areas with dd, without error messages.

> We haven't implemented bad sector error reporting and handling yet,
> so for now, you have to construct pvmoves to avoid any bad sectors.

I don't think the drives have bad sectors - at least I didn't see any
signs of bad sectors by now.

And I pvmoved a 19GB LV, much more than the global pvmove gets done.
All the moves had decent performance, ~20MB/s, where the source drive
only reads ~30MB/s with dd. The only strange thing I saw was that there
sometimes where some seconds without any disk activity at all. 

Jan
