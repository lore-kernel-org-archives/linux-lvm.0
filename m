Message-ID: <3BF323F5.5E90F63B@divsol.com>
From: Jim Cromie <jcromie@divsol.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM fails at bootup
References: <20011112141948.P715@sonsofthunder.yi.org> <20011112123227.U1778@lynx.no>
Content-Transfer-Encoding: 7bit
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
Date: Wed Nov 14 20:08:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Andreas Dilger wrote:

> On Nov 12, 2001  14:19 -0500, Bradley M Alexander wrote:
> > I added the vgscan and the vgchange commands to the end of the checkroot.sh
> > script (which in Debian is different from the mountfs.sh script). When the
> > vgscan runs, it generates about two pages of drive errors:
> >
> > hdb: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
> > hdb: read_intr: error=0x04 { DriveStatusError }
>
> Don't know about this - looks like hardware problems.

I got these errors by the pages when I pushed UDMA modes too far
with hdparm trials, long b4 I upgraded to LVM.  Sounds like an IDE error.

check this out.

[root@groucho 1.0.1-rc4]# hdparm -iTt /dev/hdc

/dev/hdc:

 Model=WDC WD300BB-00AUA1, FwRev=18.20D18, SerialNo=WD-WMA6R2353241
 Config={ HardSect NotMFM HdSw>15uSec SpinMotCtl Fixed DTR>5Mbs FmtGapReq }
 RawCHS=16383/16/63, TrkSize=57600, SectSize=600, ECCbytes=40
 BuffType=DualPortCache, BuffSize=2048kB, MaxMultSect=16, MultSect=16
 CurCHS=16383/16/63, CurSects=-66060037, LBA=yes, LBAsects=58633344
 IORDY=on/off, tPIO={min:120,w/IORDY:120}, tDMA={min:120,rec:120}
 PIO modes: pio0 pio1 pio2 pio3 pio4
 DMA modes: mdma0 mdma1 mdma2 udma0 udma1 *udma2 udma3 udma4 udma5
 Timing buffer-cache reads:   128 MB in  1.67 seconds = 76.65 MB/sec
 Timing buffered disk reads:  64 MB in  4.17 seconds = 15.35 MB/sec

IIRC,

the *udma2 is current setting, beyond which my tired ol p2-233-mobo cannot
tread.
