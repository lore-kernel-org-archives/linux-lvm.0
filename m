From: =?iso-8859-1?Q?Tim-Patrick_M=E4rk?= <tpmaerk@gmx.net>
Message-ID: <000301c2d22f$ae474f40$0400000a@lenina>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Erroneously formatted PV; 'vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group'...
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
Date: Tue Feb 11 18:44:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Heinz,

thank you very much!

I built a kernel with LVM2/ device-mapper (and XFS) on my emergency
system and ran 'vgscan' and 'vgchange --partial -a y' as you said.
The LVs were mounted read-only, so I copied the root-LV to another
partition (ext2), booted it and restored the old LVM metadata using
'vgcfgrestore'.
Some "minor" problems (related to properly patching the kernel etc.)
occured during this process, but all in all it worked well and now I'm
very happy to have my data back :)!

Tank you again!


> 
> Tim-Patrick,
> 
> with your root on LV setup you either need:
> 
> 
> an emergency boot media with LVM1 on it _and_ /etc/lvmconf/* backup in
> order to restore you LVM metadata using vgcfgrestore presuming you
setup
> your partitions exactly the way they were before ("vgscan;vgchange
-ay" a=
> fter
> metadata restore)
> 
> - or -
> 
> an emergency boot media with LVM2/device-mapper on it to
> run "vgscan ; vgchange --partial -a y" in order to
> access your partioal VG without the gone partition
> 
> - or -
> 
> that LVM2 boot media to restore the metadata.
> 
> - or -
> 
> to attach your HDDs to another LVM equipped system to repair the
> volume group configuration
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> 
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
> 
>
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
=3D=
>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
-=
> =3D-=3D-
> 
> Heinz Mauelshagen                                 Sistina Software
Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
>
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
=3D=
>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
-=
> =3D-=3D-
