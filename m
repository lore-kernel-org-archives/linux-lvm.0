References: <5B07BD47020000F90001E5B1@prv1-mh.provo.novell.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <dbb84bdb-20aa-6532-5163-106b6ca2a204@redhat.com>
Date: Fri, 25 May 2018 10:14:42 +0200
MIME-Version: 1.0
In-Reply-To: <5B07BD47020000F90001E5B1@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvcreate cannot create a mirrored LV with version
	2.02.177(2)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <ghe@suse.com>

Dne 25.5.2018 v 09:37 Gang He napsal(a):
> Hello List,
> 
> I am using lvm version 2.02.177(2), tried to create a mirrored LV, but failed with the errors,
> tb0307-nd1:~ # pvs
>    PV         VG          Fmt  Attr PSize  PFree
>    /dev/vdb   cluster-vg2 lvm2 a--  40.00g 36.00g
>    /dev/vdc   cluster-vg2 lvm2 a--  40.00g 40.00g
> tb0307-nd1:~ # vgs
>    VG          #PV #LV #SN Attr   VSize  VFree
>    cluster-vg2   2   1   0 wz--nc 79.99g 75.99g
> tb0307-nd1:~ # lvs   <<==  a linear LV can be created
>    LV      VG          Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
>    test-lv cluster-vg2 -wi-a----- 4.00g
> tb0307-nd1:~ # lvcreate --type mirror -m1 -L 500m -n my-lv cluster-vg2
>    Shared cluster mirrors are not available.  <<== failed to create a mirrored LV


Clustered old mirror needs 'cmirrord' to be installed and running.


> 
> Could you help to take a look at this problem? from lvcreate man page, the mirrored LV is supported by lvcreate.
> my lvm2 version/configuration is as below,
> tb0307-nd1:~ # lvm version
>    LVM version:     2.02.177(2) (2017-12-18)
>    Library version: 1.03.01 (2017-12-18)
>    Driver version:  4.37.0
>    Configuration:   ./configure --host=x86_64-suse-linux-gnu --build=x86_64-suse-linux-gnu --program-prefix= --disable-dependency-tracking --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64 --libexecdir=/usr/lib --localstatedir=/var --sharedstatedir=/var/lib --mandir=/usr/share/man --infodir=/usr/share/info --disable-dependency-tracking --enable-dmeventd --enable-cmdlib --enable-udev_rules --enable-udev_sync --with-udev-prefix=/usr/ --enable-selinux --enable-pkgconfig --with-usrlibdir=/usr/lib64 --with-usrsbindir=/usr/sbin --with-default-dm-run-dir=/run --with-tmpfilesdir=/usr/lib/tmpfiles.d --with-thin=internal --with-device-gid=6 --with-device-mode=0640 --with-device-uid=0 --with-dmeve
>   ntd-path=/usr/sbin/dmeventd --with-thin-check=/usr/sbin/thin_check --with-thin-dump=/usr/sbin/thin_dump --with-thin-repair=/usr/sbin/thin_repair --enable-applib --enable-blkid_wiping --enable-cmdlib
>    --enable-lvmetad --enable-lvmpolld --enable-realtime --with-cache=internal --with-default-locking-dir=/run/lock/lvm --with-default-pid-dir=/run --with-default-run-dir=/run/lvm
> tb0307-nd1:~ #

--enable-cmirrord


Regards

Zdenek
