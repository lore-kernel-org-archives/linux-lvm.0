Return-Path: <hch@ns.caldera.de>
Date: Mon, 6 Aug 2001 00:41:08 +0200
From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] LVM with multi-path disks?
Message-ID: <20010806004108.B7822@caldera.de>
References: <3B6B30C4.B4427F3D@cup.hp.com> <20010804174049.B564@colombina.comedia.it> <20010805022800.A26419@vestdata.no> <20010805110607.A29329@caldera.de> <20010805234739.B30768@vestdata.no>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010805234739.B30768@vestdata.no>; from lvm@ragnark.vestdata.no on Sun, Aug 05, 2001 at 11:47:39PM +0200
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com
Cc: Christoph Hellwig <hch@caldera.de>

On Sun, Aug 05, 2001 at 11:47:39PM +0200, Ragnar Kj�rstad wrote:
> On Sun, Aug 05, 2001 at 11:06:07AM +0200, Christoph Hellwig wrote:
> > On Sun, Aug 05, 2001 at 02:28:01AM +0200, Ragnar Kj�rstad wrote:
> > > E.g. you have a md0 device consisting of sda and sdb - would not lvm
> > > find three different paths to the same data (sda, sdb, md0) when
> > > scanning for physical volumes? Will that not cause problems?
> > 
> > vgscan skips devices that are identified as md devices, so you will
> > not see sda and sdb but just md0.  Multipath is not different from
> > 'normal' RAID in this respect.
> 
> Hmm, I didn't think md devices needed superblocks thus could not be
> identified?

Humm, yeah you got me there ;)

For partitioned devices LVM will detect them because of the partition
id, but it will not detect unpartitioned devices.  So put one huge
partition on multipath disks for LVM to work.

On the other hand MD autodetect needs the partition table anyway..

	Christoph

-- 
Whip me.  Beat me.  Make me maintain AIX.
