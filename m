From: "Herman Kuster" <ha.ka@chello.nl>
Subject: RE: [linux-lvm] lvm on a firewire harddisk
Message-ID: <000801c31c59$04512640$c600a8c0@hermanslaptop>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20030517085956.GA26092@www.13thfloor.at>
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
Date: Sat May 17 04:44:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thanks for your reply, but i think i found the error in my system. My =
root
fs is also lvm based and to mount this my system uses a initrd. This =
initrd
doesn't have the ieee1394 modules so at that time the firewire harddisk =
is
not visible to the system. I've tried to make a new initrd image =
containing
both the lvm and ieee1394 modules, but this also doesn't work since the
ieee1394 modules take quite a long time to initialise. The ieee1394 =
modules
are loaded before the lvm, but the harddisk becomes available long after =
the
lvm modules have loaded. But since the mountpoint for the external =
harddisk
is not critical i now have made a 'quick-and-dirty' hack to the =
rc.sysinit:
just before the lvm lines (again, because the initrd also does this) i =
do a
pvdisplay /dev/sda, then all works well.

Bye,

Herman

-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] =
On
Behalf Of Herbert Poetzl
Sent: Saturday, May 17, 2003 11:00 AM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] lvm on a firewire harddisk


On Sat, May 17, 2003 at 08:43:35AM +0200, Herman Kuster wrote:
> Hi,
>=20
> I've got the following problem:
> I've a firewire harddisk (maxtor 5000xt), this disk works fine and is
> available as /dev/sda in my system.
> On this disk i have created one single pv (on /dev/sda, no =
partitioning)
> I have put this pv into a vg, and in this volume group i have created =
one
> lv.
> All seems to be working fine until the time comes when my computer
restarts.
> On a boot somehow the lvm system forgets the pv on de firewire =
harddisk
and
> only shows (on a pvscan for example) the pv/vg/lv's on my normal =
harddisks
> (/dev/hda and /dev/hdb). By the time the lvm system starts up i'm sure =
the
> ieee1394 system is up and running (i modified my rc.sysinit file so =
the
> ieee1394 system is startup before lvm).
> Even when i am logged in as a user the lvm system still doesn't know =
the
pv
> on my firewire harddisk. But after I do a 'pvdisplay /dev/sda' the pv =
is
> shown correctly and now the lvm system knows about the pv (it shows up =
in
> pvscan and the vg/lv become available etc.). Does anyone know why my
system
> behaves as it does (btw i'm using a redhat 9.0 clean install), is this
some
> kind of bug in the lvm system, am i doing something wrong, please =
help.

My guess is, that either the lack of partitioning
prohibits the correct detection of your lvm
volume, or some drivers (eg. sd_mod) are not=20
present at pvscan time, which get automagically
loaded when you explicitely access /dev/sda ...

HTH,
Herbert

> Thanks,
>=20
> Herman
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
