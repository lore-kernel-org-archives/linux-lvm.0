Return-Path: <harvell@nortelnetworks.com>
Message-ID: <3A74D2F0.E2C658F5@nortelnetworks.com>
Date: Sun, 28 Jan 2001 20:18:24 -0600
From: "Joe Harvell" <harvell@nortelnetworks.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Follow-up 2: Help: lvm 0.9.1_beta3 oops (can't get my 
         data)
References: <3A746B67.4FA4CD18@nortelnetworks.com> <20010128200649.C17449@sistina.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Looks like it didn't work.


[root@btexi0c1 perfect]# vgcfgrestore -n w0 /dev/hda8
vgcfgrestore -- VGDA for "w0" successfully restored to physical volume "/=
dev/hda8"

[root@btexi0c1 perfect]# vgcfgrestore -n w0 /dev/hdb3
vgcfgrestore -- VGDA for "w0" successfully restored to physical volume "/=
dev/hdb3"

[root@btexi0c1 perfect]# vgchange -a y
Segmentation fault
[root@btexi0c1 perfect]# tail -30 /var/log/messages
JJan 28 20:15:20 btexi0c1 kernel: LVM version 0.9.1_beta3  by Heinz Mauel=
shagen  (25/01/2001)
Jan 28 20:15:20 btexi0c1 kernel: lvm -- Module successfully initialized
Jan 28 20:15:35 btexi0c1 kernel: Unable to handle kernel NULL pointer der=
eference at virtual address 000001b0
Jan 28 20:15:35 btexi0c1 kernel:  printing eip:
Jan 28 20:15:35 btexi0c1 kernel: d88f8e71
Jan 28 20:15:35 btexi0c1 kernel: *pde =3D 00000000
Jan 28 20:15:35 btexi0c1 kernel: Oops: 0000
Jan 28 20:15:35 btexi0c1 kernel: CPU:    0
Jan 28 20:15:35 btexi0c1 kernel: EIP:    0010:[<d88f8e71>]
Jan 28 20:15:35 btexi0c1 kernel: EFLAGS: 00210246
Jan 28 20:15:35 btexi0c1 kernel: eax: 00000000   ebx: 00000021   ecx: 000=
00100   edx: 00000100
Jan 28 20:15:35 btexi0c1 kernel: esi: d0dc2000   edi: 00000300   ebp: 000=
00000   esp: ccaf9b5c
Jan 28 20:15:35 btexi0c1 kernel: ds: 0018   es: 0018   ss: 0018
Jan 28 20:15:35 btexi0c1 kernel: Process vgchange (pid: 31064, stackpage=3D=
ccaf9000)
Jan 28 20:15:35 btexi0c1 kernel: Stack: cd609000 d88f90cb d0dc2000 0000ff=
ff 00000000 00000400 ce476200 00000330
Jan 28 20:15:35 btexi0c1 kernel:        00000000 00021c36 d88f77c4 d0dc20=
00 ce476200 d0dc2000 40239008 00000001
Jan 28 20:15:35 btexi0c1 kernel:        00000100 00000005 ccaf9bdc 000000=
00 ccaf9d84 d0dc2000 d88f6bda 00000000
Jan 28 20:15:35 btexi0c1 kernel: Call Trace: [<d88f90cb>] [<d88f77c4>] [<=
d88f6bda>] [af_packet:__insmod_af_packet_O/lib/modules/2.4.0/kernel/net/p=
acket/af+0/96] [<d88f4707>] [do_anonymous_page+50/128] [iget4+194/208]
Jan 28 20:15:35 btexi0c1 kernel:        [update_process_times+32/128] [af=
_packet:__insmod_af_packet_O/lib/modules/2.4.0/kernel/net/packet/af+-1372=
80/96] [af_packet:__insmod_af_packet_O/lib/modules/2.4.0/kernel/net/packe=
t/af+-137132/96] [timer_bh+531/592] [cached_lookup+16/80] [path_walk+1906=
/2144] [ret_from_intr+0/32] [chrdev_open+54/64]
Jan 28 20:15:35 btexi0c1 kernel:        [dentry_open+192/336] [filp_open+=
77/96] [getname+91/160] [sys_ioctl+375/400] [system_call+51/56]
Jan 28 20:15:35 btexi0c1 kernel:
Jan 28 20:15:35 btexi0c1 kernel: Code: 8b 80 b0 01 00 00 5e c3 8d b4 26 0=
0 00 00 00 55 31 d2 57 56


lewis@sistina.com wrote:

> On Sun, Jan 28, 2001 at 12:56:39PM -0600, Joe Harvell wrote:
> > When I do a 'vgdisplay -vD w0', I don't run into any problems.  Does =
this rule out the possibility of a vgcfgrestore helping?
> >
> > I looked at the man pages for vcfgrestore, but I don't know which des=
tination I should specify.  Is it /dev/w0, or is it 'dev/hda8' and '/dev/=
hdb3'?
>
> I believe you want to do a 'vgcfgrestore -nw0 /dev/hda8; vgcfgrestore -=
nw0
> /dev/hdb3'.  Let me know if that fixes things.  And remember, do *not* =
do a
> vgscan right after your vgcfgrestore because it will revert to the prev=
ious
> state.  Simply run the vgcfgrestore command, and then try the 'vgchange=
 -ay'
> to activate the volume group.
>
> Let me know if that fixes things.
>
> Regards,
> --
> AJ Lewis
> Sistina Software Inc.                  Voice:  612-379-3951
> 1313 5th St SE, Suite 111              Fax:    612-379-3952
> Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
> http://www.sistina.com
>
> Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 00=
29 2648
> Get my key at: http://www.sistina.com/~lewis/gpgkey
>  (Unfortunately, the PKS-type keyservers do not work with multiple sub-=
keys)
>
> -----Begin Obligatory Humorous Quote-----------------------------------=
-----
> Programming graphics in X is like finding sqrt(pi) using Roman numerals=
=2E
> -----End Obligatory Humorous Quote-------------------------------------=
-----
>
>                                                   ---------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
--
>    Part 1.2Type: application/pgp-signature
