Subject: Re: [linux-lvm] Can someone _please_ tell me whats going on?
From: Bradley Alexander <storm@tux.org>
In-Reply-To: <Pine.LNX.4.33.0112171315110.18781-100000@www.scotty.co.at>
References: <Pine.LNX.4.33.0112171315110.18781-100000@www.scotty.co.at>
Content-Transfer-Encoding: 7bit
Message-Id: <1008610700.829.15.camel@defiant>
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
Date: Mon Dec 17 11:36:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Mon, 2001-12-17 at 07:20, Friedrich Lobenstock wrote:
> On 16 Dec 2001 22:43, Bradley Alexander wrote:
> 
> > Its a standard IDE cable. I have a 40-pin/40-wire cable and a
> > 40-pin/80-wire (I'm assuming this is an ATA66/100 cable). Originally, i
> > had both drives on the ATA cable, but since I split them to different
> > channels, I had to use a standard IDE cable on the second channel.
> > However, I was getting the same errors when both were on the ATA cable
> > as well.
> >
> 
> So please do yourself a favour and only use 80-wire cables nowadays.
> That's why you are getting the
>   hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
>   hdc: dma_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280, sector=0
> messages.

I was getting the same type of errors even when both drives were on an
ATA cable. However, I will try to run out and get an ATA cable this
afternoon.

-- 
--Brad
============================================================================
Bradley M. Alexander, CISSP              |   Co-Chairman,
Beowulf System Admin/Security Specialist |    NoVALUG/DCLUG Security SIG
Debian/GNU Linux Developer		 |   storm [at] debian.org
                                         |   storm [at] tux.org
============================================================================
No, just _a_ Zaphod Beeblebrox. Didn't you hear? I come in six-packs."
