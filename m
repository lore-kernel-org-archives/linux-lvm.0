Message-Id: <sf152e81.098@gwia201.syr.edu>
From: "Stephen Fralich" <sjfralic@syr.edu>
Subject: Re: [linux-lvm] pvmove error
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Date: Wed Jul 16 09:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

>> pvmove -- ERROR "Inappropriate ioctl for device" copying extent from =
"/dev/sdb"
>>=20
>> pvmove -- ERROR "Inappropriate ioctl for device" moving physical =
extents
>>=20
>> This appears on the console as well ::=20
>> lvm -- lvm_chr_ioctl: unknown command 0x4004fe51

>The pvmove you are using is the redhat patched. The redhat pvmove use a
>ioctl call to move physical extends, ioctl(group, PE_LOCKED_COPY,
>&pe_copy_req);. You could patch the kernel to implement that call or
>install an unpatched pvmove.

I'm not using the redhat pvmove (v1.0.3).  I'm using pvmove 1.0.7 which I =
downloaded from the Sistina site.  I updated the rc scripts to use 1.0.7.  =
The volume was created totally under 1.0.7.  I'm using a plain kernel =
(from kernel.org) 2.4.21 patched with LVM 1.0.7 (from Sistina).

[root@sauron root]# /sbin/pvmove --version
pvmove: Logical Volume Manager 1.0.3
Heinz Mauelshagen, Sistina Software  19/02/2002 (IOP 10)
[root@sauron root]# pvmove --version
pvmove: Logical Volume Manager 1.0.7
Heinz Mauelshagen, Sistina Software  28/03/2003 (IOP 10)
[root@sauron root]# uname -a
Linux sauron.ecs.syr.edu 2.4.21 #1 Tue Jul 15 16:35:40 EDT 2003 i686 i686 =
i386 GNU/Linux
[root@sauron root]# more /proc/lvm/global
LVM module LVM version 1.0.7(28/03/2003)

Total:  1 VG  2 PVs  1 LV (1 LV open 1 times)

Global: 73677 bytes malloced   IOP version: 10   17:34:17 active

VG:  vg01  [2 PV, 1 LV/1 open]  PE Size: 32768 KB
  Usage [KB/PE]: 284295168 /8676 total  142147584 /4338 used  142147584 =
/4338 fr
ee
  PVs: [AA] sdc1                  142147584 /4338    142147584 /4338       =
    0
 /0
       [AA] sdb1                  142147584 /4338           0 /0       =
142147584
 /4338
    LV:  [AWDL  ] lv01                     142147584 /4338     1x open

Stephen

---------------------------------------------------------------------
Computer & Information Technology Group            help@ecs.syr.edu
College of Engineering & Computer Science          Link 204, 443-4308
Syracuse University
