From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030817184138.E25758@uk.sistina.com>
References: <20030816102005.GA12916@gondor.com> <20030816195606.B25758@uk.sistina.com> <20030817114638.GA1839@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030817114638.GA1839@gondor.com>; from list039@gondor.com on Sun, Aug 17, 2003 at 01:46:38PM +0200
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
Date: Sun Aug 17 12:42:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <list039@gondor.com>
Cc: linux-lvm@sistina.com

On Sun, Aug 17, 2003 at 01:46:38PM +0200, Jan Niehusmann wrote:
> I hope this helps - do you have a suggestion on what to try next?

This is the first clue:
   activate/dev_manager.c:487 pvmove  Mirror status: 2 003:004 009:002 383/384
   activate/dev_manager.c:532 pvmove  Mirror percent: 99.739586

383/384 means the kernel mirror has only successfully copied 383 out 
of 384 512-KB regions from (major, minor) (3,4) to (9,2).

The first pvmove segment has 
  12 16MB extents = 393216 sectors = 384 512KB regions.

Can you check (e.g. using dd) all the old sectors can be read OK, 
and the new ones written to OK?  (Though you're not seeing kernel error
messages; but some volume moves work OK, so an off-by-one theory
is unlikely or nothing would work?)

The first entry of 'dmsetup table vgraid-pvmove0' would show
you the sector ranges - 30448+3156 on pv1=/dev/hda4, length above
& 384 on pv0=/dev/md2 ? 

[NB Be careful not to overwrite data - if you've done some
other successful pvmoves since, some of those /dev/md2 sectors 
might now be allocated onto.]

We haven't implemented bad sector error reporting and handling yet,
so for now, you have to construct pvmoves to avoid any bad sectors.

Alasdair
