From: Dieter Franzke <lists@franzke-online.de>
Subject: Re: [linux-lvm] lvm-problems. vgda inconsistency
References: <200212160923.58295.lists@franzke-online.de> <20021216164845.A19655@sistina.com>
In-Reply-To: <20021216164845.A19655@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200212161810.16866.lists@franzke-online.de>
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
Date: Mon Dec 16 11:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, "Heinz J . Mauelshagen" <mauelshagen@sistina.com>

Hi,

Am Montag, 16. Dezember 2002 16:48 schrieb Heinz J . Mauelshagen:
> On Mon, Dec 16, 2002 at 09:23:58AM +0100, Dieter Franzke wrote:
> > Hi,
> >
> > I've created a pv, vg and lv
> > via pvcreate, vgcreate and lvcreate.
> > Everything went well.
> > But when I tried to  initialize a filesystem via mkfs.xfs I get follo=
wing
> > error:
> >
> > VGDA in Kernel and lvmtab are NOT consistent; please run vgscan
> >
> > When I run vgscan nothing is changed.
> > How can I fix this without rebooting?
>
> Rebooting won't help this. vgscan _reads_ the LVM metadata on the PVs
> and tries to update the working copies of the metadata in /etc/lvmtab*.
> No change to the metadata on the PVs happens during a vgscan run.
>
> Does vgscan display any error?

2 VGs were recognized, the 3rd (the last I've created) isn't displayed.


> What does vgck display?

VGDA in Kernel and lvmtab are NOT consistent; please run vgscan

>
> vgck should check the ondisk metadata fine or we need to restore it
> from archive copies in /etc/lvmconf/ (please save those!)

in my /etc/lvm-conf there is .conf of my third VG  /etc/lvm-conf/daten.co=
nf

vgcfgrestore -n daten -t /dev/sda1 works fine
backup of VolumeGroup "daten" is consistent

an the option -l works also fine.

but a vgcfgrestore -n daten -f /etc/lvm-conf/daten.conf /dev/sda1
displays: can't restore part of active Volume group daten.

But vgscan says: daten isn't existent.
shows only buero, datenbu

ciao

dieter


--=20
registered linuxuser 199810
it's time to close windows....
