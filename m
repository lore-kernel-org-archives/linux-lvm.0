Subject: Re: [linux-lvm] Can someone _please_ tell me whats going on?
From: Bradley Alexander <storm@tux.org>
In-Reply-To: <Pine.LNX.4.33.0112170410450.12782-100000@www.scotty.co.at>
References: <Pine.LNX.4.33.0112170410450.12782-100000@www.scotty.co.at>
Content-Transfer-Encoding: 7bit
Message-Id: <1008560587.831.6.camel@defiant>
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
Date: Sun Dec 16 21:41:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sun, 2001-12-16 at 22:13, Friedrich Lobenstock wrote:
> On 16 Dec 2001 21:57, Bradley Alexander wrote:
> 
> > hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> > hdc: dma_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280,
> > sector=0
> > hdc: DMA disabled
> > hdd: DMA disabled
> > ide1: reset: success
> 
> This looks like a IDE-cable problem to me. Checked the length?
> Is it really a ATA66/100 cable? Do you use a drive cage?

Its a standard IDE cable. I have a 40-pin/40-wire cable and a
40-pin/80-wire (I'm assuming this is an ATA66/100 cable). Originally, i
had both drives on the ATA cable, but since I split them to different
channels, I had to use a standard IDE cable on the second channel.
However, I was getting the same errors when both were on the ATA cable
as well.

-- 
--Brad
============================================================================
Bradley M. Alexander, CISSP              |   Co-Chairman,
Beowulf System Admin/Security Specialist |    NoVALUG/DCLUG Security SIG
Debian/GNU Linux Developer		 |   storm [at] debian.org
                                         |   storm [at] tux.org
============================================================================
It's always a good idea to keep the pointy end going forward as
much as possible.
					--Rules of the Air, #21
