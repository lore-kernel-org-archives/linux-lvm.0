From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] file system larger than lv
Message-ID: <20021116025942.U17827@vestdata.no>
References: <OF1EE49BDF.AE37C6D0-ON86256C71.005578CE@TEXASMUTUAL.COM> <20021115115831.B11618@sistina.com> <20021115122708.GK8377@pc.ilinx> <20021115135424.A12164@sistina.com> <20021115134816.GL8377@pc.ilinx>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021115134816.GL8377@pc.ilinx>; from lvm@interlinx.bc.ca on Fri, Nov 15, 2002 at 08:48:20AM -0500
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
Date: Fri Nov 15 20:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

> > Putting additional overloading block/filesystem layer services not ne=
cessarily
> > needed there into the kernel is unlikely to be accepted either IMO.
>=20
> No.  No.  Not in the kernel.  I mean the user space tools can simply
> check what data is on the block device (i.e. look for a known
> signature of given filesystems) and see if it can determine if it is
> indeed a filesystem.

First of all it's not possible to detect if the device includes a valid
filesystem. You can only check for know filesystems and I don't think it
would be a good idea for lvm to include a list of filesystem-signatures.

Second, reducing the size of a device is just as dangerous if there is
something else (say a datbase) on that device.

So, if anything, I think lvreduce should always warn the user that this
is a dangerous operation.



--=20
Ragnar Kj=F8rstad
Big Storage
