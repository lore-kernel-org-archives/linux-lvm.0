Return-Path: <paulj@itg.ie>
Date: Tue, 15 May 2001 09:04:54 +0100 (IST)
From: Paul Jakma <paulj@itg.ie>
Message-ID: <Pine.LNX.4.33.0105150857180.24660-100000@rossi.itg.ie>
MIME-Version: 1.0
Subject: [linux-lvm] segfaults and "VGDATA .. inconsistent" beta7 tools
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM <linux-lvm@sistina.com>

I have the same problem with 2 machines.

They are both running 2.4.5-pre1 with LVM 0.9.1beta7 patch applied and
the beta7 RPMs. On boot they run vgscan then vgchange -ay. (and
i've tried running pvscan too)

problem is thus:

[root@ns /root]# vgdisplay
vgdisplay
--- Volume group ---
VG Name               VG01
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                7
Open LV               6
MAX LV Size           1023.97 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               13.61 GB
PE Size               16 MB
Total PE              871
Alloc PE / Size       297 / 4.64 GB
Free  PE / Size       574 / 8.97 GB
VG UUID               8HMZzp-xzeK-13Fu-D4vx-a3hM-GhED-gUsh1x


[root@ns /root]# vgdisplay -v
vgdisplay
Segmentation fault (core dumped)

[root@ns /root]# pvdisplay /dev/ida/c0d0p6
pvdisplay
pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID
physical volume "/dev/ida/c0d0p6"

[root@ns /root]# vgextend VG01 /dev/ida/c0d0p6
vgextend
vgextend -- INFO: maximum logical volume size is 1023.97 Gigabyte
vgextend -- ERROR "pv_read_all_pv(): lvm_dir_cache" can't extend;
couldn't read physical volume data

[root@ns /root]# vgcfgbackup
vgcfgbackup
vgcfgbackup -- volume groups found: VG01
vgcfgbackup -- ERROR -262 checking existence of colume group "VG01"
vgcfgbackup -- ERROR "vg_cfgbackup(): vg_check_exist" backing up
volume group VG01

so i do a vgscan:

[root@ns /root]# vgscan
vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your
volume group

and from now on, no more segfaults instead:

[root@ns /root]# vgdisplay -v
vgdisplay
vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent;
please run vgscan

[root@ns /root]# vgextend VG01 /dev/ida/c0d0p6
vgextend
vgextend -- ERROR: VGDA in kernel and lvmtab are NOT consistent;
please run vgscan

etc.. etc...

is this a known problem? And what other debug output would be helpful?

thanks,

Paul Jakma
