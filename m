From: TobbY Nowack <TobbY@Indiancoder.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200207171014.58811.TobbY@Indiancoder.de>
Subject: [linux-lvm] LVM don't find data
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
Date: Wed Jul 17 03:16:06 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, support@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi!

I'm running a core Linux system with the 2.4.17 kernel. The current compu=
ter=20
behind this was an AMD K6 300 with 128 MB RAM and a Tecram DC390 SCSI=20
Controler. On this sytem I had 3 IDE HD's with at least 2 lvm Volume grou=
ps=20
and 2 Logical Volumes.

Now I had to reduce on of the three IDE HD's. On this HD was no LVM on, b=
ut=20
"/". So I reduce my 2 LV to only on partition and use the other for "/". =
I=20
change to Singel User mod and copy the wohl data to that Partition.

After I reboot everythin works fine only the Volumegroups couldn't be=20
activated any more.

I tried several of the LVM tools on a copy of this disc but nothing helps=
=2E=20

With pvdata I can the all meta data of the Volume Groups and of the Logic=
al=20
Volumes but I can not access to them any more.

Here some details:=20

[~]# pvdata /dev/hdc2
- --- Physical volume ---
PV Name               /dev/hdc2
VG Name               lvm-2
PV Size               5.99 GB [12562830 secs] / NOT usable 4.19 MB [LVM: =
133=20
KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              1532
Free PE               124
Allocated PE          1408
PV UUID               GYCimZ-2kN2-gf0r-x16s-JOMr-Y8B9-NK0XaY

- --- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  1
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               5.98 GB
PE Size               4 MB
Total PE              1532
Alloc PE / Size       1408 / 5.50 GB
Free  PE / Size       124 / 496 MB
VG UUID               xORpRm-x4lw-FUsO-IzHF-AwWc-5mX0-rPiC85

- --- List of logical volumes ---

pvdata -- logical volume "/dev/lvm-2/lv2" at offset   0
pvdata -- logical volume struct at offset   1 is empty
pvdata -- logical volume struct at offset   2 is empty
pvdata -- logical volume struct at offset   3 is empty
pvdata -- logical volume struct at offset   4 is empty
pvdata -- logical volume struct at offset   5 is empty
pvdata -- logical volume struct at offset   6 is empty
pvdata -- logical volume struct at offset   7 is empty
pvdata -- logical volume struct at offset   8 is empty
pvdata -- logical volume struct at offset   9 is empty
pvdata -- logical volume struct at offset  10 is empty
pvdata -- logical volume struct at offset  11 is empty
pvdata -- logical volume struct at offset  12 is empty
pvdata -- logical volume struct at offset  13 is empty
pvdata -- logical volume struct at offset  14 is empty
pvdata -- logical volume struct at offset  15 is empty
pvdata -- logical volume struct at offset  16 is empty
pvdata -- logical volume struct at offset  17 is empty
pvdata -- logical volume struct at offset  18 is empty
pvdata -- logical volume struct at offset  19 is empty
pvdata -- logical volume struct at offset  20 is empty
pvdata -- logical volume struct at offset  21 is empty
pvdata -- logical volume struct at offset  22 is empty
pvdata -- logical volume struct at offset  23 is empty
pvdata -- logical volume struct at offset  24 is empty
pvdata -- logical volume struct at offset  25 is empty
pvdata -- logical volume struct at offset  26 is empty
pvdata -- logical volume struct at offset  27 is empty
pvdata -- logical volume struct at offset  28 is empty
pvdata -- logical volume struct at offset  29 is empty
pvdata -- logical volume struct at offset  30 is empty
pvdata -- logical volume struct at offset  31 is empty
pvdata -- logical volume struct at offset  32 is empty
pvdata -- logical volume struct at offset  33 is empty
pvdata -- logical volume struct at offset  34 is empty
pvdata -- logical volume struct at offset  35 is empty
pvdata -- logical volume struct at offset  36 is empty
pvdata -- logical volume struct at offset  37 is empty
pvdata -- logical volume struct at offset  38 is empty
pvdata -- logical volume struct at offset  39 is empty
pvdata -- logical volume struct at offset  40 is empty
pvdata -- logical volume struct at offset  41 is empty
pvdata -- logical volume struct at offset  42 is empty
pvdata -- logical volume struct at offset  43 is empty
pvdata -- logical volume struct at offset  44 is empty
pvdata -- logical volume struct at offset  45 is empty
pvdata -- logical volume struct at offset  46 is empty
pvdata -- logical volume struct at offset  47 is empty
pvdata -- logical volume struct at offset  48 is empty
pvdata -- logical volume struct at offset  49 is empty
pvdata -- logical volume struct at offset  50 is empty
pvdata -- logical volume struct at offset  51 is empty
pvdata -- logical volume struct at offset  52 is empty
pvdata -- logical volume struct at offset  53 is empty
pvdata -- logical volume struct at offset  54 is empty
pvdata -- logical volume struct at offset  55 is empty
pvdata -- logical volume struct at offset  56 is empty
pvdata -- logical volume struct at offset  57 is empty
pvdata -- logical volume struct at offset  58 is empty
pvdata -- logical volume struct at offset  59 is empty
pvdata -- logical volume struct at offset  60 is empty
pvdata -- logical volume struct at offset  61 is empty
pvdata -- logical volume struct at offset  62 is empty
pvdata -- logical volume struct at offset  63 is empty
pvdata -- logical volume struct at offset  64 is empty
pvdata -- logical volume struct at offset  65 is empty
pvdata -- logical volume struct at offset  66 is empty
pvdata -- logical volume struct at offset  67 is empty
pvdata -- logical volume struct at offset  68 is empty
pvdata -- logical volume struct at offset  69 is empty
pvdata -- logical volume struct at offset  70 is empty
pvdata -- logical volume struct at offset  71 is empty
pvdata -- logical volume struct at offset  72 is empty
pvdata -- logical volume struct at offset  73 is empty
pvdata -- logical volume struct at offset  74 is empty
pvdata -- logical volume struct at offset  75 is empty
pvdata -- logical volume struct at offset  76 is empty
pvdata -- logical volume struct at offset  77 is empty
pvdata -- logical volume struct at offset  78 is empty
pvdata -- logical volume struct at offset  79 is empty
pvdata -- logical volume struct at offset  80 is empty
pvdata -- logical volume struct at offset  81 is empty
pvdata -- logical volume struct at offset  82 is empty
pvdata -- logical volume struct at offset  83 is empty
pvdata -- logical volume struct at offset  84 is empty
pvdata -- logical volume struct at offset  85 is empty
pvdata -- logical volume struct at offset  86 is empty
pvdata -- logical volume struct at offset  87 is empty
pvdata -- logical volume struct at offset  88 is empty
pvdata -- logical volume struct at offset  89 is empty
pvdata -- logical volume struct at offset  90 is empty
pvdata -- logical volume struct at offset  91 is empty
pvdata -- logical volume struct at offset  92 is empty
pvdata -- logical volume struct at offset  93 is empty
pvdata -- logical volume struct at offset  94 is empty
pvdata -- logical volume struct at offset  95 is empty
pvdata -- logical volume struct at offset  96 is empty
pvdata -- logical volume struct at offset  97 is empty
pvdata -- logical volume struct at offset  98 is empty
pvdata -- logical volume struct at offset  99 is empty
pvdata -- logical volume struct at offset 100 is empty
pvdata -- logical volume struct at offset 101 is empty
pvdata -- logical volume struct at offset 102 is empty
pvdata -- logical volume struct at offset 103 is empty
pvdata -- logical volume struct at offset 104 is empty
pvdata -- logical volume struct at offset 105 is empty
pvdata -- logical volume struct at offset 106 is empty
pvdata -- logical volume struct at offset 107 is empty
pvdata -- logical volume struct at offset 108 is empty
pvdata -- logical volume struct at offset 109 is empty
pvdata -- logical volume struct at offset 110 is empty
pvdata -- logical volume struct at offset 111 is empty
pvdata -- logical volume struct at offset 112 is empty
pvdata -- logical volume struct at offset 113 is empty
pvdata -- logical volume struct at offset 114 is empty
pvdata -- logical volume struct at offset 115 is empty
pvdata -- logical volume struct at offset 116 is empty
pvdata -- logical volume struct at offset 117 is empty
pvdata -- logical volume struct at offset 118 is empty
pvdata -- logical volume struct at offset 119 is empty
pvdata -- logical volume struct at offset 120 is empty
pvdata -- logical volume struct at offset 121 is empty
pvdata -- logical volume struct at offset 122 is empty
pvdata -- logical volume struct at offset 123 is empty
pvdata -- logical volume struct at offset 124 is empty
pvdata -- logical volume struct at offset 125 is empty
pvdata -- logical volume struct at offset 126 is empty
pvdata -- logical volume struct at offset 127 is empty
pvdata -- logical volume struct at offset 128 is empty
pvdata -- logical volume struct at offset 129 is empty
pvdata -- logical volume struct at offset 130 is empty
pvdata -- logical volume struct at offset 131 is empty
pvdata -- logical volume struct at offset 132 is empty
pvdata -- logical volume struct at offset 133 is empty
pvdata -- logical volume struct at offset 134 is empty
pvdata -- logical volume struct at offset 135 is empty
pvdata -- logical volume struct at offset 136 is empty
pvdata -- logical volume struct at offset 137 is empty
pvdata -- logical volume struct at offset 138 is empty
pvdata -- logical volume struct at offset 139 is empty
pvdata -- logical volume struct at offset 140 is empty
pvdata -- logical volume struct at offset 141 is empty
pvdata -- logical volume struct at offset 142 is empty
pvdata -- logical volume struct at offset 143 is empty
pvdata -- logical volume struct at offset 144 is empty
pvdata -- logical volume struct at offset 145 is empty
pvdata -- logical volume struct at offset 146 is empty
pvdata -- logical volume struct at offset 147 is empty
pvdata -- logical volume struct at offset 148 is empty
pvdata -- logical volume struct at offset 149 is empty
pvdata -- logical volume struct at offset 150 is empty
pvdata -- logical volume struct at offset 151 is empty
pvdata -- logical volume struct at offset 152 is empty
pvdata -- logical volume struct at offset 153 is empty
pvdata -- logical volume struct at offset 154 is empty
pvdata -- logical volume struct at offset 155 is empty
pvdata -- logical volume struct at offset 156 is empty
pvdata -- logical volume struct at offset 157 is empty
pvdata -- logical volume struct at offset 158 is empty
pvdata -- logical volume struct at offset 159 is empty
pvdata -- logical volume struct at offset 160 is empty
pvdata -- logical volume struct at offset 161 is empty
pvdata -- logical volume struct at offset 162 is empty
pvdata -- logical volume struct at offset 163 is empty
pvdata -- logical volume struct at offset 164 is empty
pvdata -- logical volume struct at offset 165 is empty
pvdata -- logical volume struct at offset 166 is empty
pvdata -- logical volume struct at offset 167 is empty
pvdata -- logical volume struct at offset 168 is empty
pvdata -- logical volume struct at offset 169 is empty
pvdata -- logical volume struct at offset 170 is empty
pvdata -- logical volume struct at offset 171 is empty
pvdata -- logical volume struct at offset 172 is empty
pvdata -- logical volume struct at offset 173 is empty
pvdata -- logical volume struct at offset 174 is empty
pvdata -- logical volume struct at offset 175 is empty
pvdata -- logical volume struct at offset 176 is empty
pvdata -- logical volume struct at offset 177 is empty
pvdata -- logical volume struct at offset 178 is empty
pvdata -- logical volume struct at offset 179 is empty
pvdata -- logical volume struct at offset 180 is empty
pvdata -- logical volume struct at offset 181 is empty
pvdata -- logical volume struct at offset 182 is empty
pvdata -- logical volume struct at offset 183 is empty
pvdata -- logical volume struct at offset 184 is empty
pvdata -- logical volume struct at offset 185 is empty
pvdata -- logical volume struct at offset 186 is empty
pvdata -- logical volume struct at offset 187 is empty
pvdata -- logical volume struct at offset 188 is empty
pvdata -- logical volume struct at offset 189 is empty
pvdata -- logical volume struct at offset 190 is empty
pvdata -- logical volume struct at offset 191 is empty
pvdata -- logical volume struct at offset 192 is empty
pvdata -- logical volume struct at offset 193 is empty
pvdata -- logical volume struct at offset 194 is empty
pvdata -- logical volume struct at offset 195 is empty
pvdata -- logical volume struct at offset 196 is empty
pvdata -- logical volume struct at offset 197 is empty
pvdata -- logical volume struct at offset 198 is empty
pvdata -- logical volume struct at offset 199 is empty
pvdata -- logical volume struct at offset 200 is empty
pvdata -- logical volume struct at offset 201 is empty
pvdata -- logical volume struct at offset 202 is empty
pvdata -- logical volume struct at offset 203 is empty
pvdata -- logical volume struct at offset 204 is empty
pvdata -- logical volume struct at offset 205 is empty
pvdata -- logical volume struct at offset 206 is empty
pvdata -- logical volume struct at offset 207 is empty
pvdata -- logical volume struct at offset 208 is empty
pvdata -- logical volume struct at offset 209 is empty
pvdata -- logical volume struct at offset 210 is empty
pvdata -- logical volume struct at offset 211 is empty
pvdata -- logical volume struct at offset 212 is empty
pvdata -- logical volume struct at offset 213 is empty
pvdata -- logical volume struct at offset 214 is empty
pvdata -- logical volume struct at offset 215 is empty
pvdata -- logical volume struct at offset 216 is empty
pvdata -- logical volume struct at offset 217 is empty
pvdata -- logical volume struct at offset 218 is empty
pvdata -- logical volume struct at offset 219 is empty
pvdata -- logical volume struct at offset 220 is empty
pvdata -- logical volume struct at offset 221 is empty
pvdata -- logical volume struct at offset 222 is empty
pvdata -- logical volume struct at offset 223 is empty
pvdata -- logical volume struct at offset 224 is empty
pvdata -- logical volume struct at offset 225 is empty
pvdata -- logical volume struct at offset 226 is empty
pvdata -- logical volume struct at offset 227 is empty
pvdata -- logical volume struct at offset 228 is empty
pvdata -- logical volume struct at offset 229 is empty
pvdata -- logical volume struct at offset 230 is empty
pvdata -- logical volume struct at offset 231 is empty
pvdata -- logical volume struct at offset 232 is empty
pvdata -- logical volume struct at offset 233 is empty
pvdata -- logical volume struct at offset 234 is empty
pvdata -- logical volume struct at offset 235 is empty
pvdata -- logical volume struct at offset 236 is empty
pvdata -- logical volume struct at offset 237 is empty
pvdata -- logical volume struct at offset 238 is empty
pvdata -- logical volume struct at offset 239 is empty
pvdata -- logical volume struct at offset 240 is empty
pvdata -- logical volume struct at offset 241 is empty
pvdata -- logical volume struct at offset 242 is empty
pvdata -- logical volume struct at offset 243 is empty
pvdata -- logical volume struct at offset 244 is empty
pvdata -- logical volume struct at offset 245 is empty
pvdata -- logical volume struct at offset 246 is empty
pvdata -- logical volume struct at offset 247 is empty
pvdata -- logical volume struct at offset 248 is empty
pvdata -- logical volume struct at offset 249 is empty
pvdata -- logical volume struct at offset 250 is empty
pvdata -- logical volume struct at offset 251 is empty
pvdata -- logical volume struct at offset 252 is empty
pvdata -- logical volume struct at offset 253 is empty
pvdata -- logical volume struct at offset 254 is empty
pvdata -- logical volume struct at offset 255 is empty
- --- List of physical volume UUIDs ---

001: GYCimZ-2kN2-gf0r-x16s-JOMr-Y8B9-NK0XaY

[~]# vgchange -ay lvm2
vgchange -- volume group "lvm2" does not exist

[~]# vgcfgrestore -t -nlvm-2 -l /dev/hdc2
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/lvm-2.conf"
vgcfgrestore -- backup of volume group "lvm-2"  is consistent
- --- Volume group ---
VG Name               lvm-2
VG Access             read/write
VG Status             NOT available/resizable
VG #                  1
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               5.98 GB
PE Size               4 MB
Total PE              1532
Alloc PE / Size       1408 / 5.50 GB
Free  PE / Size       124 / 496 MB
VG UUID               xORpRm-x4lw-FUsO-IzHF-AwWc-5mX0-rPiC85


[~]# vgcfgrestore -nlvm-2 /dev/hdc2
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/lvm-2.conf"
vgcfgrestore -- physical volume "/dev/hdc2" doesn't belong to volume grou=
p=20
"lvm-2"

If I try the same command on /dev/hda2 wich is not my backup then I get:

[~]# vgcfgrestore -t -nlvm-2 -l /dev/hda2
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/lvm-2.conf"
vgcfgrestore -- backup of volume group "lvm-2"  is consistent
- --- Volume group ---
VG Name               lvm-2
VG Access             read/write
VG Status             NOT available/resizable
VG #                  1
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               5.98 GB
PE Size               4 MB
Total PE              1532
Alloc PE / Size       1408 / 5.50 GB
Free  PE / Size       124 / 496 MB
VG UUID               xORpRm-x4lw-FUsO-IzHF-AwWc-5mX0-rPiC85


[~]# vgcfgrestore -nlvm-2 /dev/hda2
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/lvm-2.conf"
vgcfgrestore -- ERROR "pv_read(): device major number" reading physical v=
olume=20
"/dev/hda2"

When I search for this error on your webside I found a hit to take the LV=
M=20
1.1-rc2. So I upgraded but the error still came.=20

Can you help me?

TobbY

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9NSeBZAM5y/mNFN8RAlDoAJ4vuoZGLqinOBw2/6RN8Je1XMSQQQCeN0li
XBaSYrSDutkybj29Ju//1ck=3D
=3DOU8K
-----END PGP SIGNATURE-----
