From: Xavier Montagutelli <Xavier.Montagutelli@gmm.insa-tlse.fr>
In-Reply-To: <20020121110438.B16549@sistina.com>
Message-Id: <Pine.LNX.4.33.0201292102190.25523-100000@gmmpc1.gmm.priv>
MIME-Version: 1.0
Subject: [linux-lvm] lvcreate on one physical volume and md
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
Date: Tue Jan 29 15:27:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Thomas Montfort <montfort@gmm.insa-tlse.fr>

Hello,

I try to create a logical volume on one of the physical volumes gathered
in my volume group, using the command :

lvcreate --size <size> --name <lv_name> <vg_name> <physical_device_to_use>

It works well if I use a 'normal' partition (hda6). But it does not work
for me with a 'multiple device' (md, RAID 1 or RAID 5) physical volume.
LVM version 1.0.2.

From what I can understand from the sources (tools/lib/pv_read.c, pv_read
returns -LVM_EPV_READ_MD_DEVICE when (*pv)->pv_dev == MD_MAJOR), this is
an expected behaviour. Can someone confirm me this ? Or is it a bug ?


Here are the outputs of a few commands :

fantastic:~# vgdisplay -v space
[..]
--- Physical volumes ---
[..]
PV Name (#)           /dev/md3 (2)
PV Status             available / allocatable
Total PE / Free PE    12635 / 12635

PV Name (#)           /dev/hda6 (3)
PV Status             available / allocatable
Total PE / Free PE    2366 / 1854

fantastic:~# lvcreate -v --size 2G --name lv2 space /dev/hda6
lvcreate -- checking volume group name "space"
[..]
lvcreate -- checking physical volume "/dev/hda6" against volume group
lvcreate -- checking for maximum logical volume count
[..]
lvcreate -- logical volume "/dev/space/lv2" successfully created

fantastic:~# lvcreate -v --size 2G --name lv3 space /dev/md3
lvcreate -- checking volume group name "space"
[..]
lvcreate -- checking physical volume "/dev/md3" against volume group
lvcreate -- couldn't read physical volume "/dev/md3"


And to be exhaustive :

Linux kernel : 2.4.17 + LVM 1.0.2 patch + linux-2.4.11-VFS-lock.patch +
patches from
http://distro.ibiblio.org/pub/Linux/distributions/suse/people/mason/patches/reiserfs/quota-2.4
to enable quota support on reiserfs.

fantastic:~# lvcreate -v --debug --size 2G --name lv3 space /dev/md3
[..]
lvcreate -- checking physical volume "/dev/md3" against volume group
<1> pv_check_in_vg -- CALLED
[..]
<1> pv_check_in_vg -- LEAVING with ret: 1
<1> pv_read -- going to read /dev/md3
<22> lvm_check_dev -- CALLED
<333> lvm_check_partitioned_dev -- CALLED
<4444> lvm_get_device_type called
<4444> lvm_get_device_type leaving with 2
<333> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<22> lvm_check_dev -- LEAVING with ret: 1
<22> pv_copy_from_disk -- CALLED
<22> pv_copy_from_disk -- LEAVING ret = 0x8103e28
<22> pv_create_name_from_kdev_t -- CALLED with 9:3
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 2
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 30
<22> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/md3
<22> system_id_check_exported -- CALLED
<22> system_id_check_exported -- LEAVING with ret: 0
<1> pv_read -- LEAVING with ret: -271
lvcreate -- couldn't read physical volume "/dev/md3"


[ Xavier Montagutelli          `""'                                   ]
[ INSA Toulouse                0--0                                   ]
[               ---------oOOo---()---oOOo----------                   ]
[ Dpt de Math / Service Informatique  Tel: +33 5 61 55 93 38 / 67     ]
[ 135, Avenue de Rangueil             Fax: +33 5 61 55 93 20 / 60     ]
[ 31077 Toulouse Cedex 4              Mel: montagut@gmm.insa-tlse.fr  ]
