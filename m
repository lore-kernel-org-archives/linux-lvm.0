From: "Dominic J. Eidson" <sauron@the-infinite.org>
Subject: Re: [linux-lvm] dma_intr: during mkfs -c
In-Reply-To: <1036600955.30249.58.camel@chef>
Message-ID: <Pine.LNX.4.33.0211061100470.5037-100000@morannon.the-infinite.org>
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
Date: Wed Nov  6 11:01:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On 6 Nov 2002, Sven Heinicke wrote:

> which doesn't seem to hurt anything.  But after a few hours into
> badblocks the kernel reported:
>
> hdr: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hdr: dma_intr: error=0x10 { SectorIdNotFound }, LBAsect=6306866,
> sector=6306848
>
> and hdr is in my lvm.  Is this drived hosed of did lvm and badblocks
> make in unusabel?

Time to buy a new drive.


 - d.

-- 
Dominic J. Eidson
                                        "Baruk Khazad! Khazad ai-menu!" - Gimli
-------------------------------------------------------------------------------
http://www.the-infinite.org/              http://www.the-infinite.org/~dominic/
