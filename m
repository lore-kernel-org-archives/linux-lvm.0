Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oADLLoIR013323
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 16:21:50 -0500
Received: from mail-pv0-f174.google.com (mail-pv0-f174.google.com
	[74.125.83.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oADLLZaG015288
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 16:21:36 -0500
Received: by pva4 with SMTP id 4so842037pva.33
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 13:21:35 -0800 (PST)
MIME-Version: 1.0
Message-ID: <AANLkTim17Szku4aAzTkhv5kMR6dfu7qa7pwcy3YqYkxe@mail.gmail.com>
From: John Himpel <jwhimpel@gmail.com>
Content-Type: multipart/alternative; boundary=001636e1fdadb7343b0494f5ca8e
Subject: [linux-lvm] LVM + LUKS - Can't mount encrypted LV
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Date: Sat, 13 Nov 2010 21:21:56 -0000
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--001636e1fdadb7343b0494f5ca8e
Content-Type: text/plain; charset=ISO-8859-1

Good afternoon,

I created this structure using anaconda, so I'm a bit unsure of all the
details:
1) Encrypted partition
2) VG <vg_dubby> containing three LV's <lv_root, lv_home, lv_swap>

I suppose it's possible the encryption is at another (or even
additional) level than the partition.
Like I said, I created this with anaconda and it's been almost 18 months, so
my memory is not certain.

I am trying to mount the LV and am getting errors.

I am running Fedora Rawhide as of 11/1/2010

Steps taken:
modprobe dm-crypt
modprobe dm-mod
cryptsetup luksOpen /dev/sdf6 F14    <-- /dev/sdf6 is the location of
encrypted partition
   Enter passphrase for /dev/sdf6:
   <Entered passphrase here>
vgscan
  Reading all physical volumnes.  This may take a while...
  Found volume group "vg_dubby" using metadata type lvm2
vgchange -a y vg_dubby
  3 logical volume(s) in volume group "vg_dubby" now active
mount /dev/vg_dubby/lv_root /mnt/root
  mount: unknown filesystem type 'crypto_LUKS'

In scanning the web, I see almost all of the examples show output from
cryptsetup as including:
       key slot 0 unlocked.
       Command successful.
Mine did not.

Output from
cryptsetup luksDump /dev/sdf6 shows Key Slot 0: ENABLED

All other Key Slots are DISABLED.

lvs and pvscan look reasonable to me, but I'm a novice, so I'm not quite
sure what to look for.
pvs
  PV            VG          Fmt  Attr  PSize    PFree
  /dev/dm-2  vg_dubby  lvm2 a-    724.09g 32.00m
lvs
  LV          VG          Attr    LSize  Origin Snap% Move Log Copy% Convert
  lv_home  vg_dubby  -wi--- 664.25g
  lv_root    vg_dubby  -wi---  50.00g
  lv_swap  vg_dubby  -wi---   9.81g

Any suggestions would be greatly appreciated.

Thanks.

--001636e1fdadb7343b0494f5ca8e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Good afternoon,</div>
<div>=A0</div>
<div>I created this structure using anaconda, so I&#39;m a bit unsure of al=
l the details:</div>
<div>1) Encrypted partition</div>
<div>2) VG &lt;vg_dubby&gt; containing three LV&#39;s &lt;lv_root, lv_home,=
 lv_swap&gt;</div>
<div>=A0</div>
<div>I suppose it&#39;s possible the encryption is at another (or even addi=
tional)=A0level than the partition.</div>
<div>Like I said, I created this with anaconda and it&#39;s been almost 18 =
months, so my memory is not certain.</div>
<div><br>I am trying to mount the LV and am getting errors.</div>
<div>=A0</div>
<div>I am running Fedora Rawhide as of 11/1/2010</div>
<div>=A0</div>
<div>Steps taken:</div>
<div>modprobe dm-crypt</div>
<div>modprobe dm-mod</div>
<div>cryptsetup luksOpen /dev/sdf6=A0F14=A0=A0=A0 &lt;-- /dev/sdf6 is the l=
ocation of encrypted partition</div>
<div>=A0=A0 Enter passphrase for /dev/sdf6:</div>
<div>=A0=A0 &lt;Entered passphrase here&gt;</div>
<div>vgscan</div>
<div>=A0 Reading all physical volumnes.=A0 This may take a while...</div>
<div>=A0 Found volume group &quot;vg_dubby&quot; using metadata type lvm2</=
div>
<div>vgchange -a y vg_dubby</div>
<div>=A0 3 logical volume(s) in volume group &quot;vg_dubby&quot; now activ=
e</div>
<div>mount /dev/vg_dubby/lv_root /mnt/root</div>
<div>=A0 mount: unknown filesystem type &#39;crypto_LUKS&#39;</div>
<div>=A0</div>
<div>In scanning the web, I see almost all of the examples show output from=
 cryptsetup as including:</div>
<div>=A0=A0=A0=A0=A0=A0 key slot 0 unlocked.<br>=A0=A0=A0=A0=A0=A0 Command =
successful.<br>Mine did not.</div>
<div>=A0</div>
<div>Output from</div>
<div>cryptsetup luksDump /dev/sdf6 shows Key Slot 0: ENABLED</div>
<div>=A0</div>
<div>All other Key Slots are DISABLED.</div>
<div>=A0</div>
<div>lvs and pvscan look reasonable to me, but I&#39;m a novice, so I&#39;m=
 not quite sure what to look for.</div>
<div>pvs</div>
<div>=A0 PV=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VG=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0Fmt=A0 Attr=A0 PSize=A0=A0=A0 PFree</div>
<div>=A0 /dev/dm-2=A0 vg_dubby=A0 lvm2 a-=A0=A0=A0=A0724.09g 32.00m</div>
<div>lvs</div>
<div>=A0 LV=A0=A0=A0=A0=A0=A0=A0=A0=A0 VG=A0=A0=A0=A0=A0=A0=A0=A0=A0 Attr=
=A0=A0=A0 LSize=A0 Origin Snap% Move Log Copy% Convert</div>
<div>=A0 lv_home=A0 vg_dubby=A0 -wi--- 664.25g</div>
<div>=A0 lv_root=A0=A0=A0 vg_dubby=A0 -wi---=A0 50.00g</div>
<div>=A0 lv_swap=A0 vg_dubby=A0 -wi---=A0=A0 9.81g</div>
<div>=A0</div>
<div>Any suggestions would be greatly appreciated.</div>
<div>=A0</div>
<div>Thanks.</div>

--001636e1fdadb7343b0494f5ca8e--
