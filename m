From: "Jason A. Lixfeld" <jlixfeld@andromedas.com>
Subject: RE: [linux-lvm] What have I done!?
Date: Thu, 4 Oct 2001 07:24:51 -0400
Message-ID: <009501c14cc7$2f5cd360$836788cf@industry>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <009401c14cc3$c63106c0$836788cf@industry>
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
To: linux-lvm@sistina.com

Is there a way that I can blow the whole thing away and start over?  I
think I've screwed things up too badly to try to resurrect them.  I'd
really like to blow it all away and start over and see if this stuff
happens again, but again I can't use the lv* tools to remove the
configurations because of the errors I mention in my initial post so I
need a manual way to blow away the entire LVM configuration and start
from scratch again.

Plz help! :P

BTW:  The Seg Fault issue is on another machine..

> -----Original Message-----
> From: linux-lvm-admin@sistina.com 
> [mailto:linux-lvm-admin@sistina.com] On Behalf Of Jason A. Lixfeld
> Sent: October 4, 2001 7:00 AM
> To: linux-lvm@sistina.com
> Subject: RE: [linux-lvm] What have I done!?
> 
> 
> 
> 
> Hi Michael,
> 
> 	All of the cards are Promise cards.  One is a 
> FastTrack100 TX2 and two others are Promise Ultra100s:
> 
>   Bus  0, device   8, function  0:
>     RAID bus controller: PCI device 105a:6268 (Promise 
> Technology, Inc.) (rev 1).
>       IRQ 15.
>       Master Capable.  Latency=64.  Min Gnt=4.Max Lat=18.
>       I/O at 0xa400 [0xa407].
>       I/O at 0xa800 [0xa803].
>       I/O at 0xac00 [0xac07].
>       I/O at 0xb000 [0xb003].
>       I/O at 0xb400 [0xb40f].
>       Non-prefetchable 32 bit memory at 0xec040000 [0xec04ffff].
>   Bus  0, device   9, function  0:
>     Unknown mass storage controller: Promise Technology, Inc. 
> 20267 (rev 2).
>       IRQ 10.
>       Master Capable.  Latency=64.  
>       I/O at 0xc000 [0xc007].
>       I/O at 0xc400 [0xc403].
>       I/O at 0xb800 [0xb807].
>       I/O at 0xbc00 [0xbc03].
>       I/O at 0xc800 [0xc83f].
>       Non-prefetchable 32 bit memory at 0xec020000 [0xec03ffff].
>   Bus  0, device  10, function  0:
>     Unknown mass storage controller: Promise Technology, Inc. 
> 20267 (#2) (rev 2).
>       IRQ 12.
>       Master Capable.  Latency=64.  
>       I/O at 0xd400 [0xd407].
>       I/O at 0xd800 [0xd803].
>       I/O at 0xcc00 [0xcc07].
>       I/O at 0xd000 [0xd003].
>       I/O at 0xdc00 [0xdc3f].
>       Non-prefetchable 32 bit memory at 0xec000000 [0xec01ffff].
> 
> # cat /usr/src/linux/.config
> ...
> CONFIG_BLK_DEV_IDE=y
> CONFIG_BLK_DEV_IDEDISK=y
> CONFIG_IDEDISK_MULTI_MODE=y
> CONFIG_BLK_DEV_IDECD=y
> CONFIG_BLK_DEV_CMD640=y
> CONFIG_BLK_DEV_RZ1000=y
> CONFIG_BLK_DEV_IDEPCI=y
> CONFIG_IDEPCI_SHARE_IRQ=y
> CONFIG_BLK_DEV_IDEDMA_PCI=y
> CONFIG_BLK_DEV_ADMA=y
> CONFIG_IDEDMA_PCI_AUTO=y
> CONFIG_BLK_DEV_IDEDMA=y
> CONFIG_BLK_DEV_PIIX=y
> CONFIG_PIIX_TUNING=y
> CONFIG_BLK_DEV_PDC202XX=y
> CONFIG_PDC202XX_BURST=y
> CONFIG_PDC202XX_FORCE=y
> CONFIG_IDEDMA_AUTO=y
> CONFIG_BLK_DEV_IDE_MODES=y
> CONFIG_BLK_DEV_ATARAID=y
> CONFIG_BLK_DEV_ATARAID_PDC=y
> ...
> 
> Everything is compiled right into the kernel, no modules.
> 
> $ ls -al /proc/ide/
> total 0
> dr-xr-xr-x    8 root     root            0 Oct  4 06:58 .
> dr-xr-xr-x   47 root     root            0 Oct  3 17:12 ..
> -r--r--r--    1 root     root            0 Oct  4 06:58 drivers
> lrwxrwxrwx    1 root     root            8 Oct  4 06:58 hda 
> -> ide0/hda
> lrwxrwxrwx    1 root     root            8 Oct  4 06:58 hde 
> -> ide2/hde
> lrwxrwxrwx    1 root     root            8 Oct  4 06:58 hdf 
> -> ide2/hdf
> lrwxrwxrwx    1 root     root            8 Oct  4 06:58 hdg 
> -> ide3/hdg
> lrwxrwxrwx    1 root     root            8 Oct  4 06:58 hdh 
> -> ide3/hdh
> lrwxrwxrwx    1 root     root            8 Oct  4 06:58 hdi 
> -> ide4/hdi
> lrwxrwxrwx    1 root     root            8 Oct  4 06:58 hdj 
> -> ide4/hdj
> lrwxrwxrwx    1 root     root            8 Oct  4 06:58 hdk 
> -> ide5/hdk
> lrwxrwxrwx    1 root     root            8 Oct  4 06:58 hdl 
> -> ide5/hdl
> lrwxrwxrwx    1 root     root            8 Oct  4 06:58 hdm 
> -> ide6/hdm
> lrwxrwxrwx    1 root     root            8 Oct  4 06:58 hdn 
> -> ide6/hdn
> dr-xr-xr-x    3 root     root            0 Oct  4 06:58 ide0
> dr-xr-xr-x    4 root     root            0 Oct  4 06:58 ide2
> dr-xr-xr-x    4 root     root            0 Oct  4 06:58 ide3
> dr-xr-xr-x    4 root     root            0 Oct  4 06:58 ide4
> dr-xr-xr-x    4 root     root            0 Oct  4 06:58 ide5
> dr-xr-xr-x    4 root     root            0 Oct  4 06:58 ide6
> -r--r--r--    1 root     root            0 Oct  4 06:58 pdc202xx
> -r--r--r--    1 root     root            0 Oct  4 06:58 piix
> $
> 
> > -----Original Message-----
> > From: linux-lvm-admin@sistina.com
> > [mailto:linux-lvm-admin@sistina.com] On Behalf Of idsfa@visi.com
> > Sent: October 4, 2001 1:44 AM
> > To: linux-lvm@sistina.com
> > Subject: Re: [linux-lvm] What have I done!?
> > 
> > 
> > 
> > On Wed, Oct 03, 2001 at 10:54:21PM -0400, Jason A. Lixfeld wrote:
> > 
> > > hdj: read_intr: error=0x04 { DriveStatusError }
> > > hdj: read_intr: status=0x59 { DriveReady SeekComplete DataRequest
> > > Error }
> > > hdj: read_intr: error=0x04 { DriveStatusError }
> > > hdj: read_intr: status=0x59 { DriveReady SeekComplete 
> > DataRequest Error }
> > > hdl: read_intr: error=0x04 { DriveStatusError }
> > > hdl: read_intr: status=0x59 { DriveReady SeekComplete
> > DataRequest Error }
> > > hdl: read_intr: error=0x04 { DriveStatusError }
> > > hdl: read_intr: status=0x59 { DriveReady SeekComplete
> > DataRequest Error }
> > 
> > Those are IDE driver errors.  Judging from the drive devices,
> > you have quite a few ide controllers.  Did you compile in the 
> > drivers for all of them?  Some of the cards (and even some 
> > on-board chipsets) are NOT supported by default.  In 
> > particular, Promise & HiPoint cards require special kernel 
> > compile time options.
> > 
> > What do you see in /proc/ide?
> > 
> > Note that if you compiled the drivers as modules, those
> > modules MUST be loaded BEFORE lvm is started.
> > 
> >   Michael Kellen
> >   $ fortune -m Kellen
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linu> x-lvm
> > read the 
> > LVM HOW-TO at 
> > http://www.sistina.com/lvm/Pages/howto.html
> > 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
