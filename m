From: Friedrich Lobenstock <fl@fl.priv.at>
Subject: Re: [linux-lvm] Can someone _please_ tell me whats going on?
In-Reply-To: <1008560587.831.6.camel@defiant>
Message-ID: <Pine.LNX.4.33.0112171315110.18781-100000@www.scotty.co.at>
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
Date: Mon Dec 17 06:18:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On 16 Dec 2001 22:43, Bradley Alexander wrote:

> Its a standard IDE cable. I have a 40-pin/40-wire cable and a
> 40-pin/80-wire (I'm assuming this is an ATA66/100 cable). Originally, i
> had both drives on the ATA cable, but since I split them to different
> channels, I had to use a standard IDE cable on the second channel.
> However, I was getting the same errors when both were on the ATA cable
> as well.
>

So please do yourself a favour and only use 80-wire cables nowadays.
That's why you are getting the
  hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
  hdc: dma_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280, sector=0
messages.

-- 
MfG / Regards
Friedrich Lobenstock
