From: Benjamin Lee <benjaminlee@consultant.com>
Subject: Re: [linux-lvm] How to mount volumes during boot
Message-ID: <20011023102630.A2174@pov.home.ben>
References: <8BFE9B4949BB4346A146F5231AEF1B87F3D5@CX975884-A.mdmiller.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8BFE9B4949BB4346A146F5231AEF1B87F3D5@CX975884-A.mdmiller.com>; from mitch@mdmiller.com on Sat, Oct 20, 2001 at 08:29:51PM -0500
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
Date: Mon Oct 22 19:25:04 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Mitch,

Your problem can be fixed by compiling the LVM code into the kernel
rather than as a module.

If you like modules, make sure that you are using an initrd.

The RH 7.1 scripts already have the necessary logic to mount your LVM
filesystems.

On Sunday, 21 October, 2001, Mitchell D. Miller scribbled:
> I am running Red Hat 7.1 (with 2.4.12 kernel) and LVM 1.0.1-rc4.  I read
> the documentation on Sistina's website about boot time scripts, but the
> info there seems to deal only with getting LVM loaded at boot time. =20
>=20
> I'm still uncertain how I should configure my system so the volumes I
> have created (three of them so far) get mounted during boot.  I tried
> modifying my fstab file, but the system didn't boot right after.  It
> stopped, complaining that one of the devices couldn't be mounted.  Is
> this even the right place to configure LVM volumes to be mounted?

--=20
Benjamin Lee
Melbourne, Australia             "Always real."    http://realthought.net/

Weather outside looks to be 18=EF=BF=BDC, mostly cloudy.
__________________________________________________________________________
I hate it when my foot falls asleep during the day cause that means
it's going to be up all night.
		-- Steven Wright
