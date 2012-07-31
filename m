Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6VNNgqE010275
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 19:23:43 -0400
Received: from v041420.home.net.pl (v041420.home.net.pl [89.161.211.18])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id q6VNNdfL025465
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 19:23:40 -0400
From: Hubert Kario <hubert@kario.pl>
Date: Wed, 01 Aug 2012 01:23:26 +0200
Message-ID: <1912398.2IYGSI2Xbi@bursa22>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1366481.YQTe5xygWl";
	micalg="pgp-sha1"; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7Bit
Subject: [linux-lvm] [lvm2cmd] Heap destruction by lvm2_exit()?
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
To: linux-lvm@redhat.com


--nextPart1366481.YQTe5xygWl
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello everyone!

It seems that I'm using lvm2cmd library in quite specific way, as I call
lvm2_init() and lvm2_exit() multiple times during lifetime of a program,
or more specifically, my application calls lvm2_exit() as soon as it won't
need it for the next 10-15 minutes...

One specific proglem I noticed, that after calling lvm2_exit() valgrind
complains about invalid *writes* while doing printf() of *static* strings.

At first I thought that this was just a false positive, but my application
isn't stable, and when it crashes glibc reports:

	free(): invalid next size (fast)

gdb gives stacktrace pointing to freeing memory I'm completely sure is
allocated properly (it's strdup() of a const string, the same one that
previous 30000 allocations have and next 200000 allocations have).

So I've created a simple C program that also causes valgrind to complain as
soon as lvm2_exit() is called (attached below together with valgrind output).
In other words it looks to me like a bug in lvm2cmd library...

Please, keep me in CC as I'm not subscribed to this list

Regards,
Hubert Kario


Example application:

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <lvm2cmd.h>

int
main(int argc, char **argv)
{
    char *big_alloc = calloc(sizeof(char), 1024*1024*10);

    void *handle = lvm2_init();

    printf("Some text to output\n");

    char *string = strdup("Other text");

    printf("Variable before: \"%s\"\n", string);

    lvm2_exit(handle);

    printf("Variable after: \"%s\"\n", string);

    free(string);
    free(big_alloc);

    return 0;
}

Interesting part of valgrind output:

Variable before: "Other text"
==3565== Invalid write of size 1
==3565==    at 0x53BB944: _IO_file_xsputn@@GLIBC_2.2.5 (in /lib/libc-2.15.so)
==3565==    by 0x538B607: vfprintf (in /lib/libc-2.15.so)
==3565==    by 0x5395B98: printf (in /lib/libc-2.15.so)
==3565==    by 0x4007F6: main (test.c:21)
==3565==  Address 0x6b4c6a0 is 4,096 bytes inside a block of size 8,192 free'd
==3565==    at 0x4C29A9E: free (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==3565==    by 0x4E48B11: destroy_toolcontext (in /usr/lib/liblvm2cmd.so.2.02)
==3565==    by 0x4EB5B02: lvm_fin (in /usr/lib/liblvm2cmd.so.2.02)
==3565==    by 0x4007E0: main (test.c:19)
==3565== 
==3565== Invalid write of size 1
==3565==    at 0x53BB944: _IO_file_xsputn@@GLIBC_2.2.5 (in /lib/libc-2.15.so)
==3565==    by 0x538E2F8: vfprintf (in /lib/libc-2.15.so)
==3565==    by 0x5395B98: printf (in /lib/libc-2.15.so)
==3565==    by 0x4007F6: main (test.c:21)
==3565==  Address 0x6b4c6b1 is 4,113 bytes inside a block of size 8,192 free'd
==3565==    at 0x4C29A9E: free (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==3565==    by 0x4E48B11: destroy_toolcontext (in /usr/lib/liblvm2cmd.so.2.02)
==3565==    by 0x4EB5B02: lvm_fin (in /usr/lib/liblvm2cmd.so.2.02)
==3565==    by 0x4007E0: main (test.c:19)
==3565== 
==3565== Invalid write of size 1
==3565==    at 0x53BB944: _IO_file_xsputn@@GLIBC_2.2.5 (in /lib/libc-2.15.so)
==3565==    by 0x538C6C7: vfprintf (in /lib/libc-2.15.so)
==3565==    by 0x5395B98: printf (in /lib/libc-2.15.so)
==3565==    by 0x4007F6: main (test.c:21)
==3565==  Address 0x6b4c6bb is 4,123 bytes inside a block of size 8,192 free'd
==3565==    at 0x4C29A9E: free (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==3565==    by 0x4E48B11: destroy_toolcontext (in /usr/lib/liblvm2cmd.so.2.02)
==3565==    by 0x4EB5B02: lvm_fin (in /usr/lib/liblvm2cmd.so.2.02)
==3565==    by 0x4007E0: main (test.c:19)
==3565== 
==3565== Syscall param write(buf) points to unaddressable byte(s)
==3565==    at 0x541F150: __write_nocancel (in /lib/libc-2.15.so)
==3565==    by 0x53BAFB2: _IO_file_write@@GLIBC_2.2.5 (in /lib/libc-2.15.so)
==3565==    by 0x53BAE91: new_do_write (in /lib/libc-2.15.so)
==3565==    by 0x53BBCB4: _IO_do_write@@GLIBC_2.2.5 (in /lib/libc-2.15.so)
==3565==    by 0x53BB9B1: _IO_file_xsputn@@GLIBC_2.2.5 (in /lib/libc-2.15.so)
==3565==    by 0x538C6C7: vfprintf (in /lib/libc-2.15.so)
==3565==    by 0x5395B98: printf (in /lib/libc-2.15.so)
==3565==    by 0x4007F6: main (test.c:21)
==3565==  Address 0x6b4c6a0 is 4,096 bytes inside a block of size 8,192 free'd
==3565==    at 0x4C29A9E: free (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==3565==    by 0x4E48B11: destroy_toolcontext (in /usr/lib/liblvm2cmd.so.2.02)
==3565==    by 0x4EB5B02: lvm_fin (in /usr/lib/liblvm2cmd.so.2.02)
==3565==    by 0x4007E0: main (test.c:19)
==3565== 
Variable after: "Other text"
==3934== 
==3934== HEAP SUMMARY:
==3934==     in use at exit: 0 bytes in 0 blocks
==3934==   total heap usage: 2,575 allocs, 2,575 frees, 10,932,044 bytes allocated
==3934== 
==3934== All heap blocks were freed -- no leaks are possible
==3934== 
==3934== ERROR SUMMARY: 30 errors from 4 contexts (suppressed: 3 from 3)
-- 
Hubert Kario
hubert@kario.pl     kario@wit.edu.pl    https://hubert.kario.pl
PGP: 30D7 71F5 2F6F B157 872C  D811 A1D0 6BC9 8956 DCFE
--nextPart1366481.YQTe5xygWl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAABAgAGBQJQGGjzAAoJEKHQa8mJVtz+EikP/jq/N6a4b02S4mjXmy3fUqOy
NIunYfz6QlByaU6Nh3oArrtUbwUUjcuzq18dEjirA4wK7IbCgkhpjh75o8u5YdPn
svORuE7Hnem9JuWDVxzXeVGiLNH/i9lynEBfRrEbpcaT+8sG7oQWnoUl3ojt7E/Y
72xSYYw194ggQvzVGeG0o6lY1Z6UYXbClMxz5mvcym/EVU9MBziof5TDw0UuA4+/
oaNw9tj9dQPyhBlmQqr22fI4WRiuz12e22UrfWtGXP63jwqfvTAA//q1Xh/X9R9B
d3C5vWlGvm/3ka2qv+3ZXie4AkcS7o2oiIWGB7bpgrcEUNTyqK7P6DYTQSsrktMv
dBDIm15QGS2WeV5FeOhHQgYSc0ikZnw4XzkF2UvDMbuyu6yCL3U2+JAAEx1srBA7
Ri5EjK7H+QALlYYclgsvM/Q0XQcvP076W2zsU4VR5JkPOCYm1Qg0hQCtzi7r6GVM
xo9nj5IljDd74TVpj7o378V/zEA9LaQpkeGRIxnv/V6G4sQ5Q/PytYG0M0aN6CFp
H/aNdtLcYUNsvOTy6JHTq53lLO+Oc/7CJwQVQwQnbZ1Qrhj3Zm7fe4zZvV5QXS3G
DOTqdG56lm8ZNAz6jGFNvZJ6+5Gem81iT98HCB7jB95UCAXoF8ITndgumFOAnIsA
D+v2YpYY8cm1Y7zHeI2R
=/6+q
-----END PGP SIGNATURE-----

--nextPart1366481.YQTe5xygWl--
