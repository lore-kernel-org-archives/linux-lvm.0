content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Patching a kernel that already has VFS-lock
Message-ID: <8075D5C3061B9441944E1373776451180F077E@cinshrexc03.shermfin.com>
From: "Rechenberg, Andrew" <ARechenberg@shermanfinancialgroup.com>
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
Date: Fri Mar 14 05:57:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Partick,

That change did the trick.  My snapshots are now mounting.  Thanks for
your help.

Andy.

-----Original Message-----
From: Patrick Caulfield [mailto:caulfield@sistina.com]=20
Sent: Thursday, March 13, 2003 3:10 AM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Patching a kernel that already has VFS-lock


On Wed, Mar 12, 2003 at 05:18:35PM -0500, Rechenberg, Andrew wrote:
> Good day,
>=20
> I'm trying to upgrade my kernel from LVM 1.0.3 to 1.0.7.  My kernel
with
> 1.0.3 already has the VFS lock pactch installed and all I want to do
is
> upgrade the LVM code because my snapshots are misbehaving.  I should
not
> have to re-patch to get the VFS-lock to work should I?
>=20
> The reason I ask is because when I just patch the kernel with LVM
1.0.7
> and reboot all my VG's/LV's come up clean, and I can create snapshots
> but the snapshots do not mount.  I get the:
>=20
> mount: wrong fs type, bad option, bad superblock on /dev/flux1/snap,
>        or too many mounted file systems
>=20
> error which would indicate to me that the VFS lock is not working with
> my ext3 filesystem.  Does anyone have any ideas on what could be
causing
> this problem? =20
>=20
> Red Hat kernel source RPM 2.4.18-26
> LVM 1.0.7 from the Sistina FTP site
>=20


If you've managed to successfully patch LVM into the kernel (and it
sounds like
you have), all that should be needed to enable VFS-Lock functionality is
to
uncomment the line in lvm.c that reads:

/* #define LVM_VFS_ENHANCEMENT */


to be

#define LVM_VFS_ENHANCEMENT

and rebuild.

patrick


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
