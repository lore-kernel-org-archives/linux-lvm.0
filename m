Message-ID: <4E3670C0.1070503@redhat.com>
Date: Mon, 01 Aug 2011 10:24:16 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <883D98939E388E429EE8D771168A6560027ED144AF@USCMIMAIL1.corp.amdocs.com>
In-Reply-To: <883D98939E388E429EE8D771168A6560027ED144AF@USCMIMAIL1.corp.amdocs.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Question, what is the first 384 cyclinder in the PV?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Jewsco Pius Jacquez <JewscoPius.Jacquez@Amdocs.com>

On 07/29/2011 06:35 PM, Jewsco Pius Jacquez wrote:
> I=E2=80=99m sorry, I mean the first 384 sector.

It's space reserved for lvm2 data used to manage the volume; This part of t=
he
device contains the LVM2 label and metadata area. (it's before the first
physical extent in the volume).

> I am using RHEL5.6 kernel 2.6.18-238.12.1.el5 and have lvm2-2.02.74-5.el5=
. Here=20
> is my lvm.conf.
>=20
> Can an application data exist here? Like oracle data..

Not generally but lvm2 does not necessarily write to every location in this
region when initialising a new device so if there was existing data on the
device when pvcreate/vgcreate ran it will not have been overwritten.

> For instance, if I dd out from a PV with bs=3D512 and count=3D384 and I s=
aw oracle=20
> data on it, is this ok?

It's not possible to say with this information - has oracle been configured=
 to
use the whole disk?

If so then that's an error but if the data you are seeing is just "stale" d=
ata
from a previous use of the device it's not going to cause any problems.

Regards,
Bryn.
