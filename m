Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r99N4QwQ006131
	for <linux-lvm@redhat.com>; Wed, 9 Oct 2013 19:04:26 -0400
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe002.messaging.microsoft.com [216.32.180.185])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r99N4Pet002764
	for <linux-lvm@redhat.com>; Wed, 9 Oct 2013 19:04:26 -0400
Message-ID: <5255E0F4.7000205@tekcomms.com>
Date: Wed, 9 Oct 2013 18:04:20 -0500
From: Joe Harvell <joe.harvell@tekcomms.com>
MIME-Version: 1.0
References: <5255CAB1.5050606@tekcomms.com>
	<1381356552.67129.YahooMailNeo@web181504.mail.ne1.yahoo.com>
In-Reply-To: <1381356552.67129.YahooMailNeo@web181504.mail.ne1.yahoo.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] pvs complains of missing PVs that are not missing
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com
Cc: matthew patton <pattonme@yahoo.com>

Le 09/10/2013 17:09, matthew patton a =EF=BF=BDcrit :
> clear LVM's cache (or just disable it in lvm.conf), rescan pv, vg, lv. ma=
ke sure udev is creating the necessary hooks.
>
I'm not sure how to disable the cache.  Here are my relevant settings in=20
/etc/lvm/lvm.conf:

     # If set, the cache of block device nodes with all associated symlinks
     # will be constructed out of the existing udev database content.
     # This avoids using and opening any inapplicable non-block devices or
     # subdirectories found in the device directory. This setting is applied
     # to udev-managed device directory only, other directories will be=20
scanned
     # fully. LVM2 needs to be compiled with udev support for this=20
setting to
     # take effect. N.B. Any device node or symlink not managed by udev in
     # udev directory will be ignored with this setting on.
     obtain_device_list_from_udev =3D 1


     # The results of the filtering are cached on disk to avoid
     # rescanning dud devices (which can take a very long time).
     # By default this cache is stored in the /etc/lvm/cache directory
     # in a file called '.cache'.
     # It is safe to delete the contents: the tools regenerate it.
     # (The old setting 'cache' is still respected if neither of
     # these new ones is present.)
     # N.B. If obtain_device_list_from_udev is set to 1 the list of
     # devices is instead obtained from udev and any existing .cache
     # file is removed.
     cache_dir =3D "/etc/lvm/cache"
     cache_file_prefix =3D ""

     # You can turn off writing this cache file by setting this to 0.
     write_cache_state =3D 1


And as expected based on my setting for obtain_device_list_from_udev,=20
there is no /etc/lvm/cache directorypresent:

joey@akita ~ $ sudo nano -w /etc/lvm/lvm.conf
Mot de passe :
joey@akita ~ $ ls -al /etc/lvm/
total 68
drwxr-xr-x  5 root root  4096  7 oct.  14:12 .
drwxr-xr-x 74 root root  4096  9 oct.  11:21 ..
drwx------  2 root root  4096  8 oct.  22:21 archive
drwx------  2 root root  4096  8 oct.  22:21 backup
-rw-r--r--  1 root root 45697  9 oct.  17:27 lvm.conf
drwxr-xr-x  2 root root  4096  8 oct.  19:24 profile
