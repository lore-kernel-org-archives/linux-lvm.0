Subject: Re: [linux-lvm] How to fix inconsistent LV structs?
References: <3D9F6C62.1040004@raffael.ch> <20021007104201.A17176@sistina.com>
	<87ptumhaj4.fsf@mail.raffael.ch> <20021007132840.A17632@sistina.com>
From: Raffael Herzog <herzog@raffael.ch>
In-Reply-To: <20021007132840.A17632@sistina.com>
Message-ID: <878z1atmqp.fsf@mail.raffael.ch>
MIME-Version: 1.0
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
Date: Mon Oct  7 08:40:08 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi Heinz,

Heinz J . Mauelshagen wrote:

> nothing in the log directly related to LVM :(
> But your hint WRT naming devices could help us.
> Do you have devfs mounted on /dev and don't use the full devfs
> names in all cases?

I don't use devfs at all (yet), but the device nodes were
present all the time. What do you mean with "full devfs
names"?

Maybe these excerpts of the output of pvdata help (this is
from a run after I did pvcreate -ff):

,----[ pvdata -d /dev/hda7 ]
| [...]
| <1> lv_copy_from_disk -- CALLED
| <1> lv_copy_from_disk -- LEAVING
| <1> lv_check_consistency -- CALLED
| <22> lv_check_name -- CALLED with lv_name: "HM^A"
| <333> lvm_check_chars -- CALLED with name: "HM^A"
| <333> lvm_check_chars -- LEAVING with ret: -100
| <22> lv_check_name -- LEAVING with ret: -132
| <1> lv_check_consistency -- LEAVING with ret: -149
| pvdata -- logical volume struct at offset   0 is inconsistent
| [...]
|=20
| <1> lv_copy_from_disk -- CALLED
| <1> lv_copy_from_disk -- LEAVING
| <1> lv_check_consistency -- CALLED
| <22> lv_check_name -- CALLED with lv_name: ""
| <22> lv_check_name -- LEAVING with ret: -132
| <1> lv_check_consistency -- LEAVING with ret: -149
| pvdata -- logical volume struct at offset  13 is inconsistent
| <1> lv_copy_from_disk -- CALLED
| <1> lv_copy_from_disk -- LEAVING
| <1> lv_check_consistency -- CALLED
| <22> lv_check_name -- CALLED with lv_name: "=AA=AA=AA=AA=AA=AA=AA=AA=AA=
=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=
=AA=AA
| <22> lv_check_name -- LEAVING with ret: -132
| <1> lv_check_consistency -- LEAVING with ret: -149
| pvdata -- logical volume struct at offset  14 is inconsistent
| [...]
|=20
| <1> lv_copy_from_disk -- CALLED
| <1> lv_copy_from_disk -- LEAVING
| --- NEW Physical volume ---
| PV Name               /dev/hda7
| VG Name              =20
| PV Size               32.44 GB [68035212 secs]
| PV#                   0
| PV Status             NOT available
| Allocatable           NO
| Cur LV                0
| PE Size (KByte)       0
| Total PE              0
| Free PE               0
| Allocated PE          0
| PV UUID               0KMQsG-r21J-GwKA-qpZD-1FC9-plP0-t0aryJ
|=20
| --- Volume group ---
| VG Name              =20
| VG Access             read/write
| VG Status             NOT available/resizable
| VG #                  0
| MAX LV                256
| Cur LV                3
| Open LV               0
| MAX LV Size           255.99 GB
| Max PV                256
| Cur PV                1
| Act PV                1
| VG Size               32.44 GB
| PE Size               4 MB
| Total PE              8304
| Alloc PE / Size       4375 / 17.09 GB
| Free  PE / Size       3929 / 15.35 GB
| VG UUID               BC9DHB-T9v3-6LNt-7qtv-7uHE-7pg2-K4flga
|=20
| --- List of logical volumes ---
|=20
| pvdata -- logical volume struct at offset   1 is empty
| [...]
| <1> lv_copy_from_disk -- CALLED
| <1> lv_copy_from_disk -- LEAVING
| <1> lv_check_consistency -- CALLED
| <22> lv_check_name -- CALLED with lv_name: "=AA=AA=AA=AA=AA=AA=AA=AA=AA=
=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=AA=
=AA=AA
| <22> lv_check_name -- LEAVING with ret: -132
| <1> lv_check_consistency -- LEAVING with ret: -149
| pvdata -- logical volume struct at offset 125 is inconsistent
| [like this through to LV 139]
| [...]
|=20
| <1> lv_copy_from_disk -- CALLED
| <1> lv_copy_from_disk -- LEAVING
| <1> pv_read_uuidlist -- CALLED with /dev/hda7
| <1> pv_read_uuidlist -- LEAVING with ret: 0
| <1> lvm_check_uuid -- CALLED with uuidstr: "(null)"
| <1> lvm_check_uuid -- LEAVING with ret: -1
|=20
| Segmentation fault.
`----

So you see, there was really a lot of garbage... :-)

I also saved the outputs of pvscan -d and vgscan -d, in case
you think they help.


> If so, please retry giving the full names.

I can't try anything anymore because I decided not to use
LVM anymore at least until I know what happened and I know
that it won't happen again. Sure, it's probably not the
fault of LVM, but I think, if I would have been using "plain
ext2/3", I probably wouldn't have lost just *all* of my data
(lucky that I had a very young backup, so I actually didn't
loose anything).


cu,

   Raffi


--=20
=3D> Neu im Usenet? Fragen?    http://www.use-net.ch/usenet_intro_de.html=
 <=3D
  The difference between theory and practice is that in theory, there is
                 no difference, but in practice, there is.
Raffael Herzog - herzog@raffael.ch - http://www.raffael.ch - ICQ #6796135=
5
