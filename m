Message-Id: <s84cb516.065@pgkvfax>
Date: Tue, 07 Dec 1999 07:19:42 +0100
From: "Stephan Hendl" <Stephan.Hendl@lds.brandenburg.de>
Subject: Re: [linux-lvm] LVM and Compaq Smart Array - oncemore
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi Dirk,

thanks for your response - here is the output. Hopefully it helps :-))

Stephan

root@sgate:/home/hendl > pvcreate -vd /dev/ida/c0d0p4
lvm_get_iop_version -- CALLED
lvm_get_iop_version -- AFTER ioctl ret: 0
lvm_get_iop_version -- LEAVING with ret: 0
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/ida/c0d0p4"
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/ida/c0d0p4"
pv_check_name -- LEAVING with ret: 0
pvcreate -- getting physical volume size
pv_get_size -- CALLED with /dev/ida/c0d0p4 and BFFFF72C
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/ida/c0d0p4"
pv_check_name -- LEAVING with ret: 0
pv_check_part -- CALLED with /dev/ida/c0d0p4
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/ida/c0d0p4"
pv_check_name -- LEAVING with ret: 0
pv_check_part -- LEAVING with 4
lvm_dir_cache -- CALLED
lvm_dir_cache -- calling scandir() with /dev/ida
lvm_dir_cache -- AFTER calling scandir() with /dev/ida
lvm_dir_cache -- calling scandir() with /dev/ide/hd
lvm_dir_cache -- AFTER calling scandir() with /dev/ide/hd
lvm_dir_cache -- calling scandir() with /dev/loop
lvm_dir_cache -- AFTER calling scandir() with /dev/loop
lvm_dir_cache -- calling scandir() with /dev/md
lvm_dir_cache -- AFTER calling scandir() with /dev/md
lvm_dir_cache -- calling scandir() with /dev/rd
lvm_dir_cache -- AFTER calling scandir() with /dev/rd
lvm_dir_cache -- calling scandir() with /dev/sd
lvm_dir_cache -- AFTER calling scandir() with /dev/sd
lvm_dir_cache -- calling scandir() with /dev
lvm_dir_cache -- AFTER calling scandir() with /dev
lvm_dir_cache -- LEAVING with cache_size: 692
pv_get_size -- BEFORE llseek 0:0
pv_get_size -- part[0].sys_ind: FE  part[0].nr_sects: 6005728
pv_get_size -- first =3D=3D 1
pv_get_size -- part[1].sys_ind: 0  part[1].nr_sects: 0
pv_get_size -- first =3D=3D 1
pv_get_size -- part[2].sys_ind: 0  part[2].nr_sects: 0
pv_get_size -- first =3D=3D 1
pv_get_size -- part[3].sys_ind: 0  part[3].nr_sects: 0
pv_get_size -- first =3D=3D 1
pv_get_size -- part_i =3D=3D part_i_tmp
pv_get_size -- LEAVING with ret: -244
pvcreate -- partition "/dev/ida/c0d0p4" doesn't exist
pvcreate -- unlocking logical volume manager



--
LDS Brandenburg
Dr. Stephan Hendl
fon: +49-(0)331-39 471
fax: +49-(0)331-27548 1187
EMail: stephan.hendl@lds.brandenburg.de
