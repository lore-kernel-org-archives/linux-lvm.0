From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Can someone _please_ tell me whats going on?
Message-ID: <17080000.1008517551@dizzy>
In-Reply-To: <1008557869.831.2.camel@defiant>
References: <1008557869.831.2.camel@defiant>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Sun Dec 16 21:44:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com



> lvcreate, followed by mkreiserfs. When I rebooted, again, I saw
>
> hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hdc: dma_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280,
> sector=0
> hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hdc: dma_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280,
> sector=0
> hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hdc: dma_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280,
> sector=0
> hdc: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> hdc: dma_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280,
> sector=0
> hdc: DMA disabled
> hdd: DMA disabled
> ide1: reset: success
> hdc: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error
> }
> hdc: read_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280,
> sector=0
> hdc: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error
> }
> hdc: read_intr: error=0x10 { SectorIdNotFound }, LBAsect=211681280,
> sector=0
> hdc: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error
> }

(1) What happens if you use ext2 -- using one of the non-standard
    file systems for testing just brings in extra variables?


You could also have IDE controller or DMA problems. "Hardware"
doesn't just mean disk drives. If you have multiple controllers,
try switching the drives between them and see if that changes
the result.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
