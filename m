From: Jord Tanner <jord@indygecko.com>
Message-Id: <1069962070.2739.0.camel@gecko.indygecko.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Dual Boot with LVM
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
Date: Thu Nov 27 13:44:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I installed RedHat 9 with LVM, and that works beautifully. I recently
created a new logical volume and installed Gentoo Linux. I can dual boot
into Gentoo and Redhat with out trouble. The swap, /home, and /usr/local
partitions are shared between Gentoo and Redhat. 

LVM works without trouble in Redhat, however, I have some problems in
Gentoo. pvscan shows the PV to be inactive, and lvscan gives an error.
The actual logical volumes can be mounted and used without trouble. The
other lv* command appear to work, but lvscan does not. Is this something
to worry about? What can I do to fix this?

Output of pvscan etc is below:


This is in Gentoo:

root@gecko root # pvscan -h
Logical Volume Manager 1.0.7
Heinz Mauelshagen, Sistina Software  28/03/2003 (IOP 10)


root@gecko root # uname -a
Linux gecko 2.4.23_pre8-gss #1 SMP Wed Nov 26 13:08:00 PST 2003 i686
Intel(R) Pentium(R) 4 CPU 2.40GHz GenuineIntel GNU/Linux

root@gecko root # vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "Volume00"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

root@gecko root # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/ide/host0/bus0/target0/lun0/part2" of VG
"Volume00" [53.71 GB / 33.32 GB free]
pvscan -- total: 1 [53.71 GB] / in use: 1 [53.71 GB] / in no VG: 0 [0]

root@gecko root # lvscan
lvscan -- ERROR "pv_status_all_pv_of_vg(): no PV" getting status of
volume  group "Volume00"
root@gecko root # df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/Volume00/LogVol04
                      5.0G  3.5G  1.5G  70% /
/dev/Volume00/LogVol02
                      4.9G  1.9G  2.8G  41% /usr/local
/dev/Volume00/LogVol03
                      4.9G  1.5G  3.2G  32% /home
none                  252M     0  252M   0% /dev/shm



This is is Redhat 9:

root@gecko root]# uname -a
Linux gecko 2.4.20-20.9smp #1 SMP Mon Aug 18 11:32:15 EDT 2003 i686 i686
i386 GN
U/Linux


[root@gecko root]# pvscan -h
Logical Volume Manager 1.0.3
Heinz Mauelshagen, Sistina Software  19/02/2002 (IOP 10)

pvscan --  scan for physical volumes

pvscan [-d|--debug] {-e|--exported | -n/--novolumegroup} [-h|--help]
        [-s|--short] [-u|--uuid] [-v[v]|--verbose [--verbose]]
[--version]
[root@gecko root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "Volume00"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

[root@gecko root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hda2" of VG "Volume00" [53.71 GB / 33.32 GB
free]
pvscan -- total: 1 [53.71 GB] / in use: 1 [53.71 GB] / in no VG: 0 [0]

[root@gecko root]# lvscan
lvscan -- ACTIVE            "/dev/Volume00/LogVol01" [4.88 GB]
lvscan -- ACTIVE            "/dev/Volume00/LogVol03" [4.88 GB]
lvscan -- ACTIVE            "/dev/Volume00/LogVol02" [4.88 GB]
lvscan -- ACTIVE            "/dev/Volume00/LogVol00" [752 MB]
lvscan -- ACTIVE            "/dev/Volume00/LogVol04" [5 GB]
lvscan -- 5 logical volumes with 20.38 GB total in 1 volume group
lvscan -- 5 active logical volumes

[root@gecko root]# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/Volume00/LogVol01
                      4.9G  3.3G  1.3G  72% /
/dev/hda1              99M   20M   75M  21% /boot
/dev/Volume00/LogVol03
                      4.9G  1.5G  3.2G  32% /home
none                  251M     0  251M   0% /dev/shm
/dev/Volume00/LogVol02
                      4.9G  1.9G  2.8G  41% /usr/local



-- 
Jord Tanner <jord@indygecko.com>
