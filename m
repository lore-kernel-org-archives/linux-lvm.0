Date: Wed, 5 Sep 2001 12:24:28 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] LV size maximum
Message-ID: <20010905122428.A19885@vestdata.no>
References: <20010905113307.A19406@lug-owl.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010905113307.A19406@lug-owl.de>; from jbglaw@lug-owl.de on Wed, Sep 05, 2001 at 11:33:07AM +0200
Content-Transfer-Encoding: quoted-printable
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
To: linux-lvm@sistina.com

On Wed, Sep 05, 2001 at 11:33:07AM +0200, Jan-Benedict Glaw wrote:
> I'm to build some storage pool for an in-company network. It
> will exceed 1TB in some time, so I'd like to get some proper
> information on this *before* I get into trouble:-) So, my
> final question is: How big may an LV be?

Linux uses 32 bit integers to calculate the number of sectors - but some
drivers uses unsigned and some signed - so it depends on the drivers if
you can do 2 TB or only 1. LVM is 1 TB max.

> The FAQ tells me (in Q9) something of 2TB, but lvextend INFOs
> me of a maximum of 1TB. Where's the real limit? My understanding
> is that limitation is coming from kernel to handle all data
> in chunks of 512Bytes. Is the maximum number of 512Byte blocks
> per device to be increased in some time?

Ben LaHaise has provided patches to make the sector numbers 64 bit in
linux (configured at compile-time). The problem is that there are so
many things that need to be fixed:
* generic block layer
* lvm
* md
* nbd
* scsi layer
* ide layer
* each individual scsi driver

Ben LaHaise fixed the generic block layer, md and nbd. (all tested
successfully - except for some minor details) He has also provided a
patch for the scsi layer, but this didn't work properly when we tested
it. There are also patches for some scsi drivers floating around (look
for a message from Alan Cox on lkml in the "64 bit scsi read/write"
thread). My guess (hope) is that linux-2.6 will support 64 bit sector=20
numbers in every layer.

If you don't need each PV to be >1TB, only the LVs, all you really need
is the generic block layer fixes and fixes for lvm. Such patches are
likely to be available much sooner (but probably not in the main
kernel).

My guess is that you will be able to extend an old LV to more than 1 TB
when the patches are in place, without having to do backup/restore, if
you only choose a big enough extent size. (because the ondisk formats
deal with extents, not sectors). Can anyone more familiar with the
format please confirm this?



--=20
Ragnar Kj=F8rstad
Big Storage
