Return-Path: <hch@ns.caldera.de>
Date: Sun, 5 Aug 2001 11:06:07 +0200
From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] LVM with multi-path disks?
Message-ID: <20010805110607.A29329@caldera.de>
References: <3B6B30C4.B4427F3D@cup.hp.com> <20010804174049.B564@colombina.comedia.it> <20010805022800.A26419@vestdata.no>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010805022800.A26419@vestdata.no>; from lvm@ragnark.vestdata.no on Sun, Aug 05, 2001 at 02:28:01AM +0200
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Cc: linux-lvm@sistina.com

On Sun, Aug 05, 2001 at 02:28:01AM +0200, Ragnar Kj=EF=BF=BDrstad wrote:
> E.g. you have a md0 device consisting of sda and sdb - would not lvm
> find three different paths to the same data (sda, sdb, md0) when
> scanning for physical volumes? Will that not cause problems?

vgscan skips devices that are identified as md devices, so you will
not see sda and sdb but just md0.  Multipath is not different from
'normal' RAID in this respect.

	Christoph

--=20
Of course it doesn't work. We've performed a software upgrade.
