Message-ID: <3C0D3345.1040101@promofinarsa.es>
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] amanda and lvm
References: <3C0D2563.6B627C73@phor.com>
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
Date: Tue Dec  4 14:32:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Hi, Darin:

Darin Perusich wrote:

> hello,
>=20
> is anyone using amanda, www.amanda.org to dump lvm's out there? i'm
> trying to dump a volume and when it gets to the volume it just hangs
> there. the filesystems are reiserfs so i'm using tar to preform the
> dumps. i'm able to successfully dump the other filesystems.
>=20
> i've been using amanda to dump volumes created with Sun's Solstice Disk
> Suite. all you need to do is specify the path to the block device, in
> this case i'm using /dev/volume_group/logical_volume. the only
> difference is under solaris you can use ufsdump.
>=20


While I don't use LVM on production systems, I did a test run with LVM=20
1.0 on a 2.2.19 kernel (a Red Hat 6.2 based box).  I worked just OK=20
regarding Amanda.  Indeed, since Amanda is nothing more than a wrapper=20
around your current backup tool of choice I would look for:

a/ A config mistake
b/ Some problem with your tool: here I'd look for problems regarding the=20
truple LVM/tar/ReiserFS.

Under these asumptions, can you properly tar those volumes undependant=20
from Amanda?
--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
