From: Tracy R Reed <treed@copilotconsulting.com>
Subject: Re: [linux-lvm] Kernel oops
Message-ID: <20030915231207.I4270@copilotconsulting.com>
References: <20030915030139.A11888@copilotconsulting.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="a7XSrSxqzVsaECgU"
Content-Disposition: inline
In-Reply-To: <20030915030139.A11888@copilotconsulting.com>; from treed@copilotconsulting.com on Mon, Sep 15, 2003 at 03:01:39AM -0700
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
Date: Tue Sep 16 13:19:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--a7XSrSxqzVsaECgU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2003 at 03:01:39AM -0700, Tracy R Reed spake thusly:
> Linux home 2.4.20 #18 SMP Fri Sep 12 22:49:21 PDT 2003 i686 GNU/Linux
> home:~# lvcreate --version
>   LVM version:     1.95.15 (2003-01-10)
>   Library version: 0.96.07-ioctl-cvs (2002-11-21)
>   Driver version:  1.0.8

I was pretty tired and annoyed last night when I sent the above email and
totally forgot to run the oops through ksymoops before sending. Can anyone
tell me if the above LVM version should be relatively stable or is it an
experimental/beta version? I need to get a stable working LVM on this box.
Here is the oops after running through ksymoops:

Unable to handle kernel NULL pointer dereference at virtual address
00000001
ce6a16d0
*pde =3D 00000000
Oops: 0002
CPU:    1
EIP:    0010:[<ce6a16d0>]    Tainted: P
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010202
eax: ce6a16d0   ebx: ce6a16a0   ecx: 00000010   edx: ce6a16d0
esi: 00000001   edi: 00000000   ebp: c023c230   esp: df6c3f3c
ds: 0018   es: 0018   ss: 0018
Process kcopyd (pid: 69, stackpage=3Ddf6c3000)
Stack: c023b83a ce6a16d0 00000001 00000001 00000b76 00000000 0000001b 00000=
000
       c7cc3c10 cda29004 00000010 c023a52f d41f3e8c c7c7b218 c023a4e0 c7c7b=
218
       c023c891 00000000 c7c7b218 cda29004 c031f858 c023c240 cda29004 c023c=
394
Call Trace:    [<c023b83a>] [<c023a52f>] [<c023a4e0>] [<c023c891>] [<c023c2=
40>]
  [<c023c394>] [<c023c424>] [<c023c230>] [<c023c535>] [<c01075ee>] [<c023c4=
80>]
Code: d0 16 6a ce d0 16 6a ce 00 00 00 00 69 dd 63 00 8c ff 7c f9


>>EIP; ce6a16d0 <_end+e2e5354/2050ace4>   <=3D=3D=3D=3D=3D

>>eax; ce6a16d0 <_end+e2e5354/2050ace4>
>>ebx; ce6a16a0 <_end+e2e5324/2050ace4>
>>edx; ce6a16d0 <_end+e2e5354/2050ace4>
>>ebp; c023c230 <run_complete_job+0/20>
>>esp; df6c3f3c <_end+1f307bc0/2050ace4>

Trace; c023b83a <persistent_commit+fa/110>
Trace; c023a52f <copy_callback+3f/50>
Trace; c023a4e0 <commit_callback+0/10>
Trace; c023c891 <copy_complete+61/70>
Trace; c023c240 <run_complete_job+10/20>
Trace; c023c394 <process_jobs+64/d0>
Trace; c023c424 <do_work+24/80>
Trace; c023c230 <run_complete_job+0/20>
Trace; c023c535 <kcopyd+b5/f0>
Trace; c01075ee <arch_kernel_thread+2e/40>
Trace; c023c480 <kcopyd+0/f0>

Code;  ce6a16d0 <_end+e2e5354/2050ace4>
00000000 <_EIP>:
Code;  ce6a16d0 <_end+e2e5354/2050ace4>   <=3D=3D=3D=3D=3D
   0:   d0 16                     rclb   (%esi)   <=3D=3D=3D=3D=3D
Code;  ce6a16d2 <_end+e2e5356/2050ace4>
   2:   6a ce                     push   $0xffffffce
Code;  ce6a16d4 <_end+e2e5358/2050ace4>
   4:   d0 16                     rclb   (%esi)
Code;  ce6a16d6 <_end+e2e535a/2050ace4>
   6:   6a ce                     push   $0xffffffce
Code;  ce6a16d8 <_end+e2e535c/2050ace4>
   8:   00 00                     add    %al,(%eax)
Code;  ce6a16da <_end+e2e535e/2050ace4>
   a:   00 00                     add    %al,(%eax)
Code;  ce6a16dc <_end+e2e5360/2050ace4>
   c:   69 dd 63 00 8c ff         imul   $0xff8c0063,%ebp,%ebx
Code;  ce6a16e2 <_end+e2e5366/2050ace4>
  12:   7c f9                     jl     d <_EIP+0xd>

--=20
Tracy Reed
http://copilotconsulting.com

--a7XSrSxqzVsaECgU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj9mqbcACgkQ9PIYKZYVAq3XfACfUXOmAupiRIM1/nzlEepT7WWf
4hgAnjFr2qdl3ywQn3ti+Fzz81kO6wDV
=cXgT
-----END PGP SIGNATURE-----

--a7XSrSxqzVsaECgU--
