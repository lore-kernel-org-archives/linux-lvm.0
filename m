Return-Path: <juergens@muon.de>
Date: Tue, 28 Nov 2000 23:47:00 +0100
From: Nils Juergens <nils@muon.de>
Message-ID: <20001128234700.A925@dax.muon>
Mime-Version: 1.0
Subject: [linux-lvm] Problems with lvm 0.9
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Mailing List <linux-lvm@sistina.com>

Dear List,

i'm having some problems with lvm 0.9. I'm testing it on a newly
installed debian 2.2.

After downloading linux-2.4.0-test10 and applying both
linux-2.4.0-test10-VFS-lock.patch and lvm-0.9-2.4.0-test10.patch, i
configure my kernel for lvm support, compile and install the
userspace-tools and boot my new kernel.

Next, i run vgscan, create a PV and a VG with just the one PV. Then i
create some LV's in my VG, create filesystems on them, mount them and
copy some data to and fro. So far so good.

Now here comes the trouble: i tried to add another PV to my VG with
vgextend, after successfully creating my PV. So i do

vgextend /dev/volumes /dev/hda6, and i get a kernel oops and vgextend
segfaults.

------------------------------------------------------------------------
vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
Unable to handle kernel NULL pointer dereference at virtual address 0000002c
printing eip:
c018ddf3
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c018ddf3>]
EFLAGS: 00010246
eax: 00002f2f   ebx: 00000000   ecx: 00000000   edx: 0000002f
esi: 0000002c   edi: 0000002c   ebp: 00000000   esp: c17a1d8c
ds: 0018   es: 0018   ss: 0018
Process vgextend (pid: 1733, stackpage=c17a1000)
Stack: 00000000 c1d91000 0804f270 c1d91000 c1d91000 c018bd9e c1d91000 00000000 
       0804f270 c1d91000 00000007 4004fe03 c0255340 c0189a22 c1d91000 0804f270 
       c13ff4a0 0804f270 4004fe03 ffffffe7 c136d054 000006f2 00000282 0804f270 
Call Trace: [<c018bd9e>] [<c0189a22>] [<c01f7560>] [<ff313230>] [<c011d4f0>] [<c01c528a>] [<c0125e30>] 
       [<c011f30d>] [<c0120237>] [<c011d395>] [<c0133db4>] [<c01346b9>] [<c010ede0>] [<c012ac45>] [<c0129e60>] 
       [<c0129d96>] [<c0137727>] [<c0108d83>] 
Code: ac 38 e0 75 03 8d 6e ff 84 c0 75 f4 89 ea 85 d2 75 0b 89 fa 
Segmentation fault
------------------------------------------------------------------------

Playing around a bit more i notice that vgdisplay tells me that the
newly added PV is part of my VG, but i cannot use that space to create
new LV's. 

The output of "vgdisplay -v" is attatched to this mail.

"lvcreate -n test -l 293 /dev/volumes"
------------------------------------------------------------------------
lvcreate -- only 246 free physical extents in volume group "volumes"
------------------------------------------------------------------------

any ideas?

Nils
-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <
