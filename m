From: Sven Heinicke <sven@research.nj.nec.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1036600955.30249.58.camel@chef>
Mime-Version: 1.0
Subject: [linux-lvm] dma_intr: during mkfs -c
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
Date: Wed Nov  6 10:43:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I lvm'd a bunch of disks with Debian stable lmv10 package (1.0.4-4) and
when I do a:

   mkfs -t ext3 -c /dev/stripes/large

first I get:

  lvm -- lvm_blk_ioctl: unknown command 0x24b

which doesn't seem to hurt anything.  But after a few hours into
badblocks the kernel reported:

hdr: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdr: dma_intr: error=0x10 { SectorIdNotFound }, LBAsect=6306866,
sector=6306848

and hdr is in my lvm.  Is this drived hosed of did lvm and badblocks
make in unusabel?

  Sven

P.S. Please CC me
