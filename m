References: <5B0E6D96020000F90001F644@prv1-mh.provo.novell.com>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <2397dd2b-deef-2bf2-47ca-51fb6f880cf4@redhat.com>
Date: Wed, 30 May 2018 12:37:37 +0200
MIME-Version: 1.0
In-Reply-To: <5B0E6D96020000F90001F644@prv1-mh.provo.novell.com>
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] pvmove does not work at all with version 2.02.177(2)
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <ghe@suse.com>

On 05/30/2018 11:23 AM, Gang He wrote:
> Hello List,
> 
> As you know, I ever reported that lvcreate could not create a mirrored LV, the root cause is a configure building item "--enable-cmirrord" was missed.
> Now, I encounter another problem, pvmove does not work at all.
> The detailed information/procedure is as below,
> sle-nd1:/ # pvs
>    PV         VG          Fmt  Attr PSize   PFree
>    /dev/sda1  cluster-vg2 lvm2 a--  120.00g 120.00g
>    /dev/sda2  cluster-vg2 lvm2 a--   30.00g  20.00g
>    /dev/sdb   cluster-vg2 lvm2 a--   40.00g  30.00g
> sle-nd1:/ # vgs
>    VG          #PV #LV #SN Attr   VSize   VFree
>    cluster-vg2   3   2   0 wz--nc 189.99g 169.99g
> sle-nd1:/ # lvs
>    LV       VG          Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
>    test-lv2 cluster-vg2 -wi-a----- 10.00g
> sle-nd1:/ # lsblk
> NAME                     MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
> sda                        8:0    0  160G  0 disk
> ├─sda1                     8:1    0  120G  0 part
> ├─sda2                     8:2    0   30G  0 part
> └─sda3                     8:3    0   10G  0 part
> sdb                        8:16   0   40G  0 disk
> └─cluster--vg2-test--lv2 254:0    0   10G  0 lvm
> vda                      253:0    0   40G  0 disk
> ├─vda1                   253:1    0    4G  0 part [SWAP]
> ├─vda2                   253:2    0 23.6G  0 part /
> └─vda3                   253:3    0 12.4G  0 part /home
> 
> sle-nd1:/ # pvmove -i 5 -v /dev/sdb /dev/sda1
>      Executing: /sbin/modprobe dm-mirror
>      Executing: /sbin/modprobe dm-log-userspace
>      Wiping internal VG cache
>      Wiping cache of LVM-capable devices
>      Archiving volume group "cluster-vg2" metadata (seqno 19).
>      Creating logical volume pvmove0
>      Moving 2560 extents of logical volume cluster-vg2/test-lv2.
>    Increasing mirror region size from 0    to 8.00 KiB
>    Error locking on node a431232: Device or resource busy
>    Failed to activate cluster-vg2/test-lv2
> 
> sle-nd1:/ # lvm version
>    LVM version:     2.02.177(2) (2017-12-18)
>    Library version: 1.03.01 (2017-12-18)
>    Driver version:  4.37.0
>    Configuration:   ./configure --host=x86_64-suse-linux-gnu --build=x86_64-suse-linux-gnu --program-prefix= --disable-dependency-tracking --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64 --libexecdir=/usr/lib --localstatedir=/var --sharedstatedir=/var/lib --mandir=/usr/share/man --infodir=/usr/share/info --disable-dependency-tracking --enable-dmeventd --enable-cmdlib --enable-udev_rules --enable-udev_sync --with-udev-prefix=/usr/ --enable-selinux --enable-pkgconfig --with-usrlibdir=/usr/lib64 --with-usrsbindir=/usr/sbin --with-default-dm-run-dir=/run --with-tmpfilesdir=/usr/lib/tmpfiles.d --with-thin=internal --with-device-gid=6 --with-device-mode=0640 --with-device-uid=0 --with-dmeventd-path=/usr/sbin/dmeventd --with-thin-check=/usr/sbin/thin_check --with-thin-dump=/usr/sbin/thin_dump --with-thin-repair=/usr/sbin/thin_repair --enable-applib --enable-blkid_wiping
> --enable-cmdlib --enable-lvmetad --enable-lvmpolld --enable-realtime --with-default-locking-dir=/run/lock/lvm --with-default-pid-dir=/run --with-default-run-dir=/run/lvm --with-clvmd=corosync --with-cluster=internal --enable-cmirrord --enable-lvmlockd-dlm
> 
> So, I want to know if this problem is also a configuration problem when building lvm2? or this problem is caused by the source code?

Hi Gang, it is an issue with the codebase, where exclusive activation 
was required where it should not.

You will need to backport some additional patches - see CentOS SRPM. And 
I should do the same for Fedora.

-- Martian

> 
> Thanks
> Gang
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
