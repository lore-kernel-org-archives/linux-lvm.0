Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9BLSJr18635
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2004 17:28:19 -0400
Received: from hotmail.com (bay2-f9.bay2.hotmail.com [65.54.247.9])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9BLS8a4004809
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2004 17:28:13 -0400
From: "Adam O'Shay" <ajo3@hotmail.com>
Date: Mon, 11 Oct 2004 17:27:03 -0400
Mime-Version: 1.0
Message-ID: <BAY2-F9dmcdn1YcEBdy00016e8b@hotmail.com>
Subject: [linux-lvm] LVM2 Error
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-lvm@redhat.com

Greetings,

I am attempting my first usage of the LVM, on a fresh install of Fedora Cor=
e=20
2 --> kernel: 2.6.5-1.358.

I have the following rpm installed for LVM: lvm2-2.00.15-2

I have used: pvcreate /dev/hdb and pvcreate /dev/hdc

then I entered: vgcreate vg1 /dev/hdb /dev/hdc ---> output was: "Volume=20
group "vg1" successfully
created"

vgdisplay outputs:

--- Volume group ---
  VG Name               vg1
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  14
  VG Access             read/write
  VG Status             resizable
  MAX LV                255
  Cur LV                1
  Open LV               0
  Max PV                255
  Cur PV                2
  Act PV                2
  VG Size               372.62 GB
  PE Size               4.00 MB
  Total PE              95390
  Alloc PE / Size       10 / 40.00 MB
  Free  PE / Size       95380 / 372.58 GB
  VG UUID               irEjOq-3bSd-Af3N-1C97-M5c2-RgxP-mWdriv
____________________________________________________________


output of lsmod:

Module Size Used by
snd_mixer_oss 13824 0
snd 38372 1 snd_mixer_oss
soundcore 6112 1 snd
autofs4 10624 0
sunrpc 101064 1
3c59x 30376 0
ipt_state 1536 9
iptable_filter 2048 1
iptable_nat 17452 0
ip_conntrack 24968 2 ipt_state,iptable_nat
ip_tables 13440 3 ipt_state,iptable_filter,iptable_nat
floppy 47440 0
sg 27552 0
scsi_mod 91344 1 sg
dm_mod 33184 0
ohci_hcd 14748 0
button 4504 0
battery 6924 0
asus_acpi 8472 0
ac 3340 0
ipv6 184288 12
ext3 102376 2
jbd 40216 1 ext3

module: dm_mod is present...i've been told that is important.

Now here is where the problems start:

root@server :] lvcreate -l 500 vg1 -n samba
device-mapper ioctl cmd 9 failed: Invalid argument
Couldn't load device 'vg1-samba'.
Failed to activate new LV.


But when i type: lvdisplay I get the following:


--- Logical volume ---
LV Name /dev/vg1/samba
VG Name vg1
LV UUID TTLXfg-dVXq-NmIP-kUKg-sZUw-46fr-nZCCOF
LV Write Access read/write
LV Status available
# open 0
LV Size 1.95 GB
Current LE 500
Segments 1
Allocation next free (default)
Read ahead sectors 0
Block device 253:0


so if the LV is ACTIVE, why do the errors occur??



This one really has me stumped...any help is greatly appreciated!!!!!!

ajo

_________________________________________________________________
Don=EF=BF=BDt just search. Find. Check out the new MSN Search!=20
http://search.msn.click-url.com/go/onm00200636ave/direct/01/
