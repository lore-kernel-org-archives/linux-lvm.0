Subject: Re: [linux-lvm] Can someone _please_ tell me whats going on?
From: Bradley Alexander <storm@tux.org>
In-Reply-To: <1008610700.829.15.camel@defiant>
References: <Pine.LNX.4.33.0112171315110.18781-100000@www.scotty.co.at> 
	<1008610700.829.15.camel@defiant>
Content-Transfer-Encoding: 7bit
Message-Id: <1008647921.851.1.camel@defiant>
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
Date: Mon Dec 17 21:56:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Mon, 2001-12-17 at 12:38, Bradley Alexander wrote:
> On Mon, 2001-12-17 at 07:20, Friedrich Lobenstock wrote:
> > On 16 Dec 2001 22:43, Bradley Alexander wrote:
> > 
> > > Its a standard IDE cable. I have a 40-pin/40-wire cable and a
> > > 40-pin/80-wire (I'm assuming this is an ATA66/100 cable). Originally, i
> > > had both drives on the ATA cable, but since I split them to different
> > > channels, I had to use a standard IDE cable on the second channel.
> > > However, I was getting the same errors when both were on the ATA cable
> > > as well.
> > >
> > 
> > So please do yourself a favour and only use 80-wire cables nowadays.
> > That's why you are getting the
> >   hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> >   hdc: dma_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280, sector=0
> > messages.
> 
> I was getting the same type of errors even when both drives were on an
> ATA cable. However, I will try to run out and get an ATA cable this
> afternoon.

I got a new cable, recreated the LV and copied everything over.
Rebooted, and was still getting the drive errors on boot, still getting
the drive light on solid, all of the problems I was having. To
summarize,

Swapped drives (after the first drive failed).
Swapped cables
Swapped controllers (was originally on the first controller with the   
   other drive, now on the second.)

The original drive (Quantum) was known good prior to starting to use
LVM, it has since failed. (It had, among other things, a Debian mirror
on it.) The replacememt drive is known good as well, no errors on the
drive itself.

vg00 on /dev/hda works fine, no problems encountered. vg01 (/dev/hdb)
has problems. It is allowing me to turn off the vg (vgchange -a n),
however, any operations done on that vg afterwards (including attempting
to try to turn it back on results in a segmentation fault. (see earlier
message in this thread for the exact trap information).

Can someone give me any advice on what to do to fix this problem?

-- 
--Brad
============================================================================
Bradley M. Alexander, CISSP              |   Co-Chairman,
Beowulf System Admin/Security Specialist |    NoVALUG/DCLUG Security SIG
Debian/GNU Linux Developer		 |   storm [at] debian.org
                                         |   storm [at] tux.org
============================================================================
If you push the stick forward, the houses get bigger. If you pull
the stick back, they get smaller. That is, unless you keep pulling
the stick all the way back, then they get bigger again.
					--Rules of the Air, #2
