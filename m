Message-ID: <398D76E1.CDC2018@yahoo.com>
Date: Sun, 06 Aug 2000 16:32:01 +0200
From: Falcon <falcon_lvm@yahoo.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Additions to LVM-BUGS-0.8final
References: <200008042228.QAA00728@lynx.turbolabs.com>
Content-Transfer-Encoding: quoted-printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Andreas Dilger <adilger@turbolinux.com>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Andreas Dilger escribi=EF=BF=BD:

> Here is a list of additional bug fixes that appeared on the linux-lvm
> mailing list, but are not currently in the BUGS file on the LVM site.
>
> Cheers, Andreas
> -------------------------------------------------------------------------=
-----
>
> Michael Marxmeier <mike@msede.com> writes:
>
> <22> vg_check_name -- LEAVING with ret: 0
> <22> lvm_remove_recursive -- CALLED with dir: /dev/Main_VG
>
> This looks like a bug in lvm_remove_recursive() (tools/lib/...)
> A short look reveales the following suspicious code
> sequence around line 71:
>
>                if ( ( file_name =3D malloc ( strlen (dir) +
>                                            strlen (dir_ent->d_name) +
>                                            2)) =3D=3D NULL) {
>                   ret =3D -LVM_EREMOVE_RECURSIVE_MALLOC;
>                   goto lvm_remove_recursive_end;
>                }
>                sprintf ( file_name, "%s/%s%c", dir, dir_ent->d_name,
> 0);
>
> AFAICS this could write a byte beyound file_name, depending
> on file name length (due to malloc alignment).
>
> Try to replace the sprintf() with:
>
> sprintf ( file_name, "%s/%s", dir, dir_ent->d_name);
>
> or make the +2 a +3 in the malloc call.
>

[root@isiux /]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "isiux_dg"
vgscan -- ERROR "lvm_remouverecursive(): opendir" removing volume group dir=
ectory
and special files
vgscan -- found inactive volume group "root_dg"
vgscan -- ERROR "lvm_remouverecursive(): opendir" removing volume group dir=
ectory
and special files
vgscan -- ERROR "lvm_remouverecursive(): opendir" creating "/etc/lvmtab" and
"/etc/lvmtab.d"

I change the code that you say , and cotinue the error

                                           strlen (dir_ent->d_name) +
                                           3)) =3D=3D NULL) {
                  ret =3D -LVM_EREMOVE_RECURSIVE_MALLOC;
                  goto lvm_remove_recursive_end;
               }
               sprintf ( file_name, "%s/%s", dir, dir_ent->d_name, 0);
               if ( lstat ( file_name, &sb) =3D=3D 0) {

And when compile it , it say that :

cc -c -pipe -Wall -O2 -D_GNU_SOURCE -DDEBUG -I/root/LVM/0.8final/tools/lib
-I/root/LVM/0.8final/tools -o lvm_remove_recursive.o lvm_remove_recursive.c
lvm_remove_recursive.c: In function `lvm_remove_recursive':
lvm_remove_recursive.c:51: warning: too many arguments for format
cc -c -pipe -Wall -O2 -D_GNU_SOURCE -DDEBUG -I/root/LVM/0.8final/tools/lib
-I/root/LVM/0.8final/tools -o lvm_show_filetype.o lvm_show_filetype.c
cc -c -pipe -Wall -O2 -D_GNU_SOURCE -DDEBUG -I/root/LVM/0.8final/tools/lib
-I/root/LVM/0.8final/tools -o lvm_show_size.o lvm_show_size.c
