From: Bradley Alexander <storm@tux.org>
Content-Transfer-Encoding: 7bit
Message-Id: <1008557869.831.2.camel@defiant>
Mime-Version: 1.0
Subject: [linux-lvm] Can someone _please_ tell me whats going on?
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
Date: Sun Dec 16 20:56:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all,

I posted last month (Please see message
<20011111194145.A715@sonsofthunder.yi.org>,
<20011112141948.P715@sonsofthunder.yi.org> regarding problems i was
having with lvm. I am working with a 1GHz Athlon machine, with 2 30GB
hard drives. One of the problems that I was seeing seek errors on the
hard drive. Everyone who responded mentioned that it was hardware
problems. 

Well, I took that Quantum drive out and put an almost brand new Maxtor
(I took great pleasure in whacking windows on it) identical to my first
drive (Maxtor Maxtor 53073U6). I did the pvcreate, vgcreate and
lvcreate, followed by mkreiserfs. When I rebooted, again, I saw 

hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdc: dma_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280,
sector=0
hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdc: dma_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280,
sector=0
hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdc: dma_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280,
sector=0
hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
hdc: dma_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280,
sector=0
hdc: DMA disabled
hdd: DMA disabled
ide1: reset: success
hdc: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error
}
hdc: read_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280,
sector=0
hdc: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error
}
hdc: read_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280,
sector=0
hdc: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error
}

I know for a fact that this drive is good, as was the Quantum. However,
the Quantum has since stopped working. Obviously it is not a hardware
issue. Can someone please tell me why whenever I try to turn a second
drive into a logical volume, I get drive errors?

I would appreciate any suggestions on why this is happening and how to
fix it.


-- 
--Brad
============================================================================
Bradley M. Alexander, CISSP              |   Co-Chairman,
Beowulf System Admin/Security Specialist |    NoVALUG/DCLUG Security SIG
Debian/GNU Linux Developer		 |   storm [at] debian.org
                                         |   storm [at] tux.org
============================================================================
If Guns cause Crime, then Matches cause Arson.
