From: Friedrich Lobenstock <fl@fl.priv.at>
Subject: Re: [linux-lvm] Can someone _please_ tell me whats going on?
In-Reply-To: <1008557869.831.2.camel@defiant>
Message-ID: <Pine.LNX.4.33.0112170410450.12782-100000@www.scotty.co.at>
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
Date: Sun Dec 16 21:11:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On 16 Dec 2001 21:57, Bradley Alexander wrote:

> hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hdc: dma_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280,
> sector=0
> hdc: DMA disabled
> hdd: DMA disabled
> ide1: reset: success

This looks like a IDE-cable problem to me. Checked the length?
Is it really a ATA66/100 cable? Do you use a drive cage?

-- 
MfG / Regards
Friedrich Lobenstock
