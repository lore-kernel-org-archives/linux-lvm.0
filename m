Message-ID: <000801c2d0e8$91e8d320$0d01a8c0@aphrodite>
From: "Rupert Hair" <rupert.hair@ntlworld.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0005_01C2D0E8.8FEF7420"
Subject: [linux-lvm] PV Status NOT available
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
Date: Mon Feb 10 06:27:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0005_01C2D0E8.8FEF7420
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi Everyone.

I have a rather strange 'problem' with my LVM setup.  I am using a very
standard install of Redhat 8.0 (Kernel 2.4.18-14smp (I guess the "-14smp" is
some Redhat version number.)) with LVM version 1.0.3(19/02/2002).  I used
the Redhat installer to create a single VG (datavg) and LV (datalv) made up
of 3 PVs (hdd5 hdd6 hdd7 (Yes all three PVs are on the same disk as this is
just a test setup.)).  This all went fine and the installer created an ext3
filesystem on top of the LV.  I have put some data on the filesystem and
rebooted a few times to test it out and everything works great.

Now the 'problem': two of my PVs (hdd5 hdd7) have a status of "NOT
available" (reported by pvdisplay).  This is very strange as the whole setup
seems to work fine and all three PVs are on the same disk (which is working
fine).  I have attached various files which are the outputs of some of the
LVM utilities that seemed useful.

I would be very grateful if anyone could shed any light on this problem and
what I have done wrong.

Thanks.
Rupert

------=_NextPart_000_0005_01C2D0E8.8FEF7420
Content-Type: application/octet-stream;
	name="kernel-version"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="kernel-version"

Red Hat Linux release 8.0 (Psyche)=0A=
Kernel 2.4.18-14smp on an i686=0A=

------=_NextPart_000_0005_01C2D0E8.8FEF7420
Content-Type: application/octet-stream;
	name="lvdisplay"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lvdisplay"

--- Logical volume ---=0A=
LV Name                /dev/datavg/datalv=0A=
VG Name                datavg=0A=
LV Write Access        read/write=0A=
LV Status              available=0A=
LV #                   1=0A=
# open                 1=0A=
LV Size                6.78 GB=0A=
Current LE             434=0A=
Allocated LE           434=0A=
Allocation             next free=0A=
Read ahead sectors     1024=0A=
Block device           58:0=0A=
=0A=
=0A=

------=_NextPart_000_0005_01C2D0E8.8FEF7420
Content-Type: application/octet-stream;
	name="lvm-version"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lvm-version"

Loading lvm-mod module=0A=
LVM version 1.0.3(19/02/2002) module loaded=0A=

------=_NextPart_000_0005_01C2D0E8.8FEF7420
Content-Type: application/octet-stream;
	name="lvscan"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lvscan"

lvscan -- ACTIVE            "/dev/datavg/datalv" [6.78 GB]=0A=
lvscan -- 1 logical volumes with 6.78 GB total in 1 volume group=0A=
lvscan -- 1 active logical volumes=0A=
=0A=

------=_NextPart_000_0005_01C2D0E8.8FEF7420
Content-Type: application/octet-stream;
	name="proc-partitions"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="proc-partitions"

major minor  #blocks  name     rio rmerge rsect ruse wio wmerge wsect =
wuse running use aveq=0A=
=0A=
  58     0    7110656 lvma 0 0 0 0 0 0 0 0 0 0 0=0A=
  22    64   39078144 hdd 2090 3702 41800 11722 1534 1583 24992 6625 -2 =
153697 8095736=0A=
  22    65   10240240 hdd1 1991 3038 40202 10777 1530 1580 24960 6623 0 =
10398 17398=0A=
  22    66     524664 hdd2 10 28 112 105 0 0 0 0 0 105 105=0A=
  22    67          1 hdd3 2 0 4 23 0 0 0 0 0 23 23=0A=
  22    69    2048224 hdd5 35 378 850 181 4 3 32 1 0 166 183=0A=
  22    70    2048224 hdd6 12 60 144 107 0 0 0 0 0 107 107=0A=
  22    71    3072352 hdd7 15 75 192 140 0 0 0 0 0 140 140=0A=
   3     0   39082680 hda 83 252 650 457 13 13 37 3 -1 155181 8233434=0A=
   3     1   10241406 hda1 37 83 220 162 5 10 15 0 0 162 162=0A=
   3     2   28788480 hda2 17 83 200 119 0 0 0 0 0 119 119=0A=
   3     3      48195 hda3 26 77 206 134 8 3 22 3 0 134 138=0A=
   3    64   40020624 hdb 20 92 224 35 0 0 0 0 -1 155582 8233025=0A=
   3    65   40017883 hdb1 17 83 200 29 0 0 0 0 0 29 29=0A=

------=_NextPart_000_0005_01C2D0E8.8FEF7420
Content-Type: application/octet-stream;
	name="pvdata-hdd5"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="pvdata-hdd5"

--- Physical volume ---=0A=
PV Name               /dev/hdd5=0A=
VG Name               datavg=0A=
PV Size               1.95 GB [4096449 secs] / NOT usable 16.19 MB [LVM: =
128 KB]=0A=
PV#                   1=0A=
PV Status             NOT available=0A=
Allocatable           yes (but full)=0A=
Cur LV                1=0A=
PE Size (KByte)       16384=0A=
Total PE              124=0A=
Free PE               0=0A=
Allocated PE          124=0A=
PV UUID               fUpDkm-NW7Z-IBxR-9u9p-qbJX-u5pA-CQqvdz=0A=
=0A=
--- Volume group ---=0A=
VG Name               =0A=
VG Access             read/write=0A=
VG Status             NOT available/resizable=0A=
VG #                  0=0A=
MAX LV                256=0A=
Cur LV                1=0A=
Open LV               0=0A=
MAX LV Size           1023.97 GB=0A=
Max PV                256=0A=
Cur PV                3=0A=
Act PV                3=0A=
VG Size               6.78 GB=0A=
PE Size               16 MB=0A=
Total PE              434=0A=
Alloc PE / Size       434 / 6.78 GB=0A=
Free  PE / Size       0 / 0=0A=
VG UUID               UJTB73-y6qL-wkx6-O74e-uDh1-p31H-UtetP7=0A=
=0A=
--- List of logical volumes ---=0A=
=0A=
pvdata -- logical volume "/dev/datavg/datalv" at offset   0=0A=
pvdata -- logical volume struct at offset   1 is empty=0A=
pvdata -- logical volume struct at offset   2 is empty=0A=
pvdata -- logical volume struct at offset   3 is empty=0A=
pvdata -- logical volume struct at offset   4 is empty=0A=
pvdata -- logical volume struct at offset   5 is empty=0A=
pvdata -- logical volume struct at offset   6 is empty=0A=
pvdata -- logical volume struct at offset   7 is empty=0A=
pvdata -- logical volume struct at offset   8 is empty=0A=
pvdata -- logical volume struct at offset   9 is empty=0A=
pvdata -- logical volume struct at offset  10 is empty=0A=
pvdata -- logical volume struct at offset  11 is empty=0A=
pvdata -- logical volume struct at offset  12 is empty=0A=
pvdata -- logical volume struct at offset  13 is empty=0A=
pvdata -- logical volume struct at offset  14 is empty=0A=
pvdata -- logical volume struct at offset  15 is empty=0A=
pvdata -- logical volume struct at offset  16 is empty=0A=
pvdata -- logical volume struct at offset  17 is empty=0A=
pvdata -- logical volume struct at offset  18 is empty=0A=
pvdata -- logical volume struct at offset  19 is empty=0A=
pvdata -- logical volume struct at offset  20 is empty=0A=
pvdata -- logical volume struct at offset  21 is empty=0A=
pvdata -- logical volume struct at offset  22 is empty=0A=
pvdata -- logical volume struct at offset  23 is empty=0A=
pvdata -- logical volume struct at offset  24 is empty=0A=
pvdata -- logical volume struct at offset  25 is empty=0A=
pvdata -- logical volume struct at offset  26 is empty=0A=
pvdata -- logical volume struct at offset  27 is empty=0A=
pvdata -- logical volume struct at offset  28 is empty=0A=
pvdata -- logical volume struct at offset  29 is empty=0A=
pvdata -- logical volume struct at offset  30 is empty=0A=
pvdata -- logical volume struct at offset  31 is empty=0A=
pvdata -- logical volume struct at offset  32 is empty=0A=
pvdata -- logical volume struct at offset  33 is empty=0A=
pvdata -- logical volume struct at offset  34 is empty=0A=
pvdata -- logical volume struct at offset  35 is empty=0A=
pvdata -- logical volume struct at offset  36 is empty=0A=
pvdata -- logical volume struct at offset  37 is empty=0A=
pvdata -- logical volume struct at offset  38 is empty=0A=
pvdata -- logical volume struct at offset  39 is empty=0A=
pvdata -- logical volume struct at offset  40 is empty=0A=
pvdata -- logical volume struct at offset  41 is empty=0A=
pvdata -- logical volume struct at offset  42 is empty=0A=
pvdata -- logical volume struct at offset  43 is empty=0A=
pvdata -- logical volume struct at offset  44 is empty=0A=
pvdata -- logical volume struct at offset  45 is empty=0A=
pvdata -- logical volume struct at offset  46 is empty=0A=
pvdata -- logical volume struct at offset  47 is empty=0A=
pvdata -- logical volume struct at offset  48 is empty=0A=
pvdata -- logical volume struct at offset  49 is empty=0A=
pvdata -- logical volume struct at offset  50 is empty=0A=
pvdata -- logical volume struct at offset  51 is empty=0A=
pvdata -- logical volume struct at offset  52 is empty=0A=
pvdata -- logical volume struct at offset  53 is empty=0A=
pvdata -- logical volume struct at offset  54 is empty=0A=
pvdata -- logical volume struct at offset  55 is empty=0A=
pvdata -- logical volume struct at offset  56 is empty=0A=
pvdata -- logical volume struct at offset  57 is empty=0A=
pvdata -- logical volume struct at offset  58 is empty=0A=
pvdata -- logical volume struct at offset  59 is empty=0A=
pvdata -- logical volume struct at offset  60 is empty=0A=
pvdata -- logical volume struct at offset  61 is empty=0A=
pvdata -- logical volume struct at offset  62 is empty=0A=
pvdata -- logical volume struct at offset  63 is empty=0A=
pvdata -- logical volume struct at offset  64 is empty=0A=
pvdata -- logical volume struct at offset  65 is empty=0A=
pvdata -- logical volume struct at offset  66 is empty=0A=
pvdata -- logical volume struct at offset  67 is empty=0A=
pvdata -- logical volume struct at offset  68 is empty=0A=
pvdata -- logical volume struct at offset  69 is empty=0A=
pvdata -- logical volume struct at offset  70 is empty=0A=
pvdata -- logical volume struct at offset  71 is empty=0A=
pvdata -- logical volume struct at offset  72 is empty=0A=
pvdata -- logical volume struct at offset  73 is empty=0A=
pvdata -- logical volume struct at offset  74 is empty=0A=
pvdata -- logical volume struct at offset  75 is empty=0A=
pvdata -- logical volume struct at offset  76 is empty=0A=
pvdata -- logical volume struct at offset  77 is empty=0A=
pvdata -- logical volume struct at offset  78 is empty=0A=
pvdata -- logical volume struct at offset  79 is empty=0A=
pvdata -- logical volume struct at offset  80 is empty=0A=
pvdata -- logical volume struct at offset  81 is empty=0A=
pvdata -- logical volume struct at offset  82 is empty=0A=
pvdata -- logical volume struct at offset  83 is empty=0A=
pvdata -- logical volume struct at offset  84 is empty=0A=
pvdata -- logical volume struct at offset  85 is empty=0A=
pvdata -- logical volume struct at offset  86 is empty=0A=
pvdata -- logical volume struct at offset  87 is empty=0A=
pvdata -- logical volume struct at offset  88 is empty=0A=
pvdata -- logical volume struct at offset  89 is empty=0A=
pvdata -- logical volume struct at offset  90 is empty=0A=
pvdata -- logical volume struct at offset  91 is empty=0A=
pvdata -- logical volume struct at offset  92 is empty=0A=
pvdata -- logical volume struct at offset  93 is empty=0A=
pvdata -- logical volume struct at offset  94 is empty=0A=
pvdata -- logical volume struct at offset  95 is empty=0A=
pvdata -- logical volume struct at offset  96 is empty=0A=
pvdata -- logical volume struct at offset  97 is empty=0A=
pvdata -- logical volume struct at offset  98 is empty=0A=
pvdata -- logical volume struct at offset  99 is empty=0A=
pvdata -- logical volume struct at offset 100 is empty=0A=
pvdata -- logical volume struct at offset 101 is empty=0A=
pvdata -- logical volume struct at offset 102 is empty=0A=
pvdata -- logical volume struct at offset 103 is empty=0A=
pvdata -- logical volume struct at offset 104 is empty=0A=
pvdata -- logical volume struct at offset 105 is empty=0A=
pvdata -- logical volume struct at offset 106 is empty=0A=
pvdata -- logical volume struct at offset 107 is empty=0A=
pvdata -- logical volume struct at offset 108 is empty=0A=
pvdata -- logical volume struct at offset 109 is empty=0A=
pvdata -- logical volume struct at offset 110 is empty=0A=
pvdata -- logical volume struct at offset 111 is empty=0A=
pvdata -- logical volume struct at offset 112 is empty=0A=
pvdata -- logical volume struct at offset 113 is empty=0A=
pvdata -- logical volume struct at offset 114 is empty=0A=
pvdata -- logical volume struct at offset 115 is empty=0A=
pvdata -- logical volume struct at offset 116 is empty=0A=
pvdata -- logical volume struct at offset 117 is empty=0A=
pvdata -- logical volume struct at offset 118 is empty=0A=
pvdata -- logical volume struct at offset 119 is empty=0A=
pvdata -- logical volume struct at offset 120 is empty=0A=
pvdata -- logical volume struct at offset 121 is empty=0A=
pvdata -- logical volume struct at offset 122 is empty=0A=
pvdata -- logical volume struct at offset 123 is empty=0A=
pvdata -- logical volume struct at offset 124 is empty=0A=
pvdata -- logical volume struct at offset 125 is empty=0A=
pvdata -- logical volume struct at offset 126 is empty=0A=
pvdata -- logical volume struct at offset 127 is empty=0A=
pvdata -- logical volume struct at offset 128 is empty=0A=
pvdata -- logical volume struct at offset 129 is empty=0A=
pvdata -- logical volume struct at offset 130 is empty=0A=
pvdata -- logical volume struct at offset 131 is empty=0A=
pvdata -- logical volume struct at offset 132 is empty=0A=
pvdata -- logical volume struct at offset 133 is empty=0A=
pvdata -- logical volume struct at offset 134 is empty=0A=
pvdata -- logical volume struct at offset 135 is empty=0A=
pvdata -- logical volume struct at offset 136 is empty=0A=
pvdata -- logical volume struct at offset 137 is empty=0A=
pvdata -- logical volume struct at offset 138 is empty=0A=
pvdata -- logical volume struct at offset 139 is empty=0A=
pvdata -- logical volume struct at offset 140 is empty=0A=
pvdata -- logical volume struct at offset 141 is empty=0A=
pvdata -- logical volume struct at offset 142 is empty=0A=
pvdata -- logical volume struct at offset 143 is empty=0A=
pvdata -- logical volume struct at offset 144 is empty=0A=
pvdata -- logical volume struct at offset 145 is empty=0A=
pvdata -- logical volume struct at offset 146 is empty=0A=
pvdata -- logical volume struct at offset 147 is empty=0A=
pvdata -- logical volume struct at offset 148 is empty=0A=
pvdata -- logical volume struct at offset 149 is empty=0A=
pvdata -- logical volume struct at offset 150 is empty=0A=
pvdata -- logical volume struct at offset 151 is empty=0A=
pvdata -- logical volume struct at offset 152 is empty=0A=
pvdata -- logical volume struct at offset 153 is empty=0A=
pvdata -- logical volume struct at offset 154 is empty=0A=
pvdata -- logical volume struct at offset 155 is empty=0A=
pvdata -- logical volume struct at offset 156 is empty=0A=
pvdata -- logical volume struct at offset 157 is empty=0A=
pvdata -- logical volume struct at offset 158 is empty=0A=
pvdata -- logical volume struct at offset 159 is empty=0A=
pvdata -- logical volume struct at offset 160 is empty=0A=
pvdata -- logical volume struct at offset 161 is empty=0A=
pvdata -- logical volume struct at offset 162 is empty=0A=
pvdata -- logical volume struct at offset 163 is empty=0A=
pvdata -- logical volume struct at offset 164 is empty=0A=
pvdata -- logical volume struct at offset 165 is empty=0A=
pvdata -- logical volume struct at offset 166 is empty=0A=
pvdata -- logical volume struct at offset 167 is empty=0A=
pvdata -- logical volume struct at offset 168 is empty=0A=
pvdata -- logical volume struct at offset 169 is empty=0A=
pvdata -- logical volume struct at offset 170 is empty=0A=
pvdata -- logical volume struct at offset 171 is empty=0A=
pvdata -- logical volume struct at offset 172 is empty=0A=
pvdata -- logical volume struct at offset 173 is empty=0A=
pvdata -- logical volume struct at offset 174 is empty=0A=
pvdata -- logical volume struct at offset 175 is empty=0A=
pvdata -- logical volume struct at offset 176 is empty=0A=
pvdata -- logical volume struct at offset 177 is empty=0A=
pvdata -- logical volume struct at offset 178 is empty=0A=
pvdata -- logical volume struct at offset 179 is empty=0A=
pvdata -- logical volume struct at offset 180 is empty=0A=
pvdata -- logical volume struct at offset 181 is empty=0A=
pvdata -- logical volume struct at offset 182 is empty=0A=
pvdata -- logical volume struct at offset 183 is empty=0A=
pvdata -- logical volume struct at offset 184 is empty=0A=
pvdata -- logical volume struct at offset 185 is empty=0A=
pvdata -- logical volume struct at offset 186 is empty=0A=
pvdata -- logical volume struct at offset 187 is empty=0A=
pvdata -- logical volume struct at offset 188 is empty=0A=
pvdata -- logical volume struct at offset 189 is empty=0A=
pvdata -- logical volume struct at offset 190 is empty=0A=
pvdata -- logical volume struct at offset 191 is empty=0A=
pvdata -- logical volume struct at offset 192 is empty=0A=
pvdata -- logical volume struct at offset 193 is empty=0A=
pvdata -- logical volume struct at offset 194 is empty=0A=
pvdata -- logical volume struct at offset 195 is empty=0A=
pvdata -- logical volume struct at offset 196 is empty=0A=
pvdata -- logical volume struct at offset 197 is empty=0A=
pvdata -- logical volume struct at offset 198 is empty=0A=
pvdata -- logical volume struct at offset 199 is empty=0A=
pvdata -- logical volume struct at offset 200 is empty=0A=
pvdata -- logical volume struct at offset 201 is empty=0A=
pvdata -- logical volume struct at offset 202 is empty=0A=
pvdata -- logical volume struct at offset 203 is empty=0A=
pvdata -- logical volume struct at offset 204 is empty=0A=
pvdata -- logical volume struct at offset 205 is empty=0A=
pvdata -- logical volume struct at offset 206 is empty=0A=
pvdata -- logical volume struct at offset 207 is empty=0A=
pvdata -- logical volume struct at offset 208 is empty=0A=
pvdata -- logical volume struct at offset 209 is empty=0A=
pvdata -- logical volume struct at offset 210 is empty=0A=
pvdata -- logical volume struct at offset 211 is empty=0A=
pvdata -- logical volume struct at offset 212 is empty=0A=
pvdata -- logical volume struct at offset 213 is empty=0A=
pvdata -- logical volume struct at offset 214 is empty=0A=
pvdata -- logical volume struct at offset 215 is empty=0A=
pvdata -- logical volume struct at offset 216 is empty=0A=
pvdata -- logical volume struct at offset 217 is empty=0A=
pvdata -- logical volume struct at offset 218 is empty=0A=
pvdata -- logical volume struct at offset 219 is empty=0A=
pvdata -- logical volume struct at offset 220 is empty=0A=
pvdata -- logical volume struct at offset 221 is empty=0A=
pvdata -- logical volume struct at offset 222 is empty=0A=
pvdata -- logical volume struct at offset 223 is empty=0A=
pvdata -- logical volume struct at offset 224 is empty=0A=
pvdata -- logical volume struct at offset 225 is empty=0A=
pvdata -- logical volume struct at offset 226 is empty=0A=
pvdata -- logical volume struct at offset 227 is empty=0A=
pvdata -- logical volume struct at offset 228 is empty=0A=
pvdata -- logical volume struct at offset 229 is empty=0A=
pvdata -- logical volume struct at offset 230 is empty=0A=
pvdata -- logical volume struct at offset 231 is empty=0A=
pvdata -- logical volume struct at offset 232 is empty=0A=
pvdata -- logical volume struct at offset 233 is empty=0A=
pvdata -- logical volume struct at offset 234 is empty=0A=
pvdata -- logical volume struct at offset 235 is empty=0A=
pvdata -- logical volume struct at offset 236 is empty=0A=
pvdata -- logical volume struct at offset 237 is empty=0A=
pvdata -- logical volume struct at offset 238 is empty=0A=
pvdata -- logical volume struct at offset 239 is empty=0A=
pvdata -- logical volume struct at offset 240 is empty=0A=
pvdata -- logical volume struct at offset 241 is empty=0A=
pvdata -- logical volume struct at offset 242 is empty=0A=
pvdata -- logical volume struct at offset 243 is empty=0A=
pvdata -- logical volume struct at offset 244 is empty=0A=
pvdata -- logical volume struct at offset 245 is empty=0A=
pvdata -- logical volume struct at offset 246 is empty=0A=
pvdata -- logical volume struct at offset 247 is empty=0A=
pvdata -- logical volume struct at offset 248 is empty=0A=
pvdata -- logical volume struct at offset 249 is empty=0A=
pvdata -- logical volume struct at offset 250 is empty=0A=
pvdata -- logical volume struct at offset 251 is empty=0A=
pvdata -- logical volume struct at offset 252 is empty=0A=
pvdata -- logical volume struct at offset 253 is empty=0A=
pvdata -- logical volume struct at offset 254 is empty=0A=
pvdata -- logical volume struct at offset 255 is empty=0A=
--- List of physical volume UUIDs ---=0A=
=0A=
001: fUpDkm-NW7Z-IBxR-9u9p-qbJX-u5pA-CQqvdz=0A=
002: 3DZQlb-aM8N-6tSt-O8nS-nNit-on2p-zb7cFz=0A=
003: e9r6F4-W77i-1OFm-gjql-Im5x-4baI-daYKAX=0A=
=0A=

------=_NextPart_000_0005_01C2D0E8.8FEF7420
Content-Type: application/octet-stream;
	name="pvdata-hdd6"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="pvdata-hdd6"

--- Physical volume ---=0A=
PV Name               /dev/hdd6=0A=
VG Name               datavg=0A=
PV Size               1.95 GB [4096449 secs] / NOT usable 16.19 MB [LVM: =
128 KB]=0A=
PV#                   2=0A=
PV Status             available=0A=
Allocatable           yes (but full)=0A=
Cur LV                1=0A=
PE Size (KByte)       16384=0A=
Total PE              124=0A=
Free PE               0=0A=
Allocated PE          124=0A=
PV UUID               3DZQlb-aM8N-6tSt-O8nS-nNit-on2p-zb7cFz=0A=
=0A=
--- Volume group ---=0A=
VG Name               =0A=
VG Access             read/write=0A=
VG Status             NOT available/resizable=0A=
VG #                  0=0A=
MAX LV                256=0A=
Cur LV                1=0A=
Open LV               0=0A=
MAX LV Size           1023.97 GB=0A=
Max PV                256=0A=
Cur PV                3=0A=
Act PV                3=0A=
VG Size               6.78 GB=0A=
PE Size               16 MB=0A=
Total PE              434=0A=
Alloc PE / Size       434 / 6.78 GB=0A=
Free  PE / Size       0 / 0=0A=
VG UUID               UJTB73-y6qL-wkx6-O74e-uDh1-p31H-UtetP7=0A=
=0A=
--- List of logical volumes ---=0A=
=0A=
pvdata -- logical volume "/dev/datavg/datalv" at offset   0=0A=
pvdata -- logical volume struct at offset   1 is empty=0A=
pvdata -- logical volume struct at offset   2 is empty=0A=
pvdata -- logical volume struct at offset   3 is empty=0A=
pvdata -- logical volume struct at offset   4 is empty=0A=
pvdata -- logical volume struct at offset   5 is empty=0A=
pvdata -- logical volume struct at offset   6 is empty=0A=
pvdata -- logical volume struct at offset   7 is empty=0A=
pvdata -- logical volume struct at offset   8 is empty=0A=
pvdata -- logical volume struct at offset   9 is empty=0A=
pvdata -- logical volume struct at offset  10 is empty=0A=
pvdata -- logical volume struct at offset  11 is empty=0A=
pvdata -- logical volume struct at offset  12 is empty=0A=
pvdata -- logical volume struct at offset  13 is empty=0A=
pvdata -- logical volume struct at offset  14 is empty=0A=
pvdata -- logical volume struct at offset  15 is empty=0A=
pvdata -- logical volume struct at offset  16 is empty=0A=
pvdata -- logical volume struct at offset  17 is empty=0A=
pvdata -- logical volume struct at offset  18 is empty=0A=
pvdata -- logical volume struct at offset  19 is empty=0A=
pvdata -- logical volume struct at offset  20 is empty=0A=
pvdata -- logical volume struct at offset  21 is empty=0A=
pvdata -- logical volume struct at offset  22 is empty=0A=
pvdata -- logical volume struct at offset  23 is empty=0A=
pvdata -- logical volume struct at offset  24 is empty=0A=
pvdata -- logical volume struct at offset  25 is empty=0A=
pvdata -- logical volume struct at offset  26 is empty=0A=
pvdata -- logical volume struct at offset  27 is empty=0A=
pvdata -- logical volume struct at offset  28 is empty=0A=
pvdata -- logical volume struct at offset  29 is empty=0A=
pvdata -- logical volume struct at offset  30 is empty=0A=
pvdata -- logical volume struct at offset  31 is empty=0A=
pvdata -- logical volume struct at offset  32 is empty=0A=
pvdata -- logical volume struct at offset  33 is empty=0A=
pvdata -- logical volume struct at offset  34 is empty=0A=
pvdata -- logical volume struct at offset  35 is empty=0A=
pvdata -- logical volume struct at offset  36 is empty=0A=
pvdata -- logical volume struct at offset  37 is empty=0A=
pvdata -- logical volume struct at offset  38 is empty=0A=
pvdata -- logical volume struct at offset  39 is empty=0A=
pvdata -- logical volume struct at offset  40 is empty=0A=
pvdata -- logical volume struct at offset  41 is empty=0A=
pvdata -- logical volume struct at offset  42 is empty=0A=
pvdata -- logical volume struct at offset  43 is empty=0A=
pvdata -- logical volume struct at offset  44 is empty=0A=
pvdata -- logical volume struct at offset  45 is empty=0A=
pvdata -- logical volume struct at offset  46 is empty=0A=
pvdata -- logical volume struct at offset  47 is empty=0A=
pvdata -- logical volume struct at offset  48 is empty=0A=
pvdata -- logical volume struct at offset  49 is empty=0A=
pvdata -- logical volume struct at offset  50 is empty=0A=
pvdata -- logical volume struct at offset  51 is empty=0A=
pvdata -- logical volume struct at offset  52 is empty=0A=
pvdata -- logical volume struct at offset  53 is empty=0A=
pvdata -- logical volume struct at offset  54 is empty=0A=
pvdata -- logical volume struct at offset  55 is empty=0A=
pvdata -- logical volume struct at offset  56 is empty=0A=
pvdata -- logical volume struct at offset  57 is empty=0A=
pvdata -- logical volume struct at offset  58 is empty=0A=
pvdata -- logical volume struct at offset  59 is empty=0A=
pvdata -- logical volume struct at offset  60 is empty=0A=
pvdata -- logical volume struct at offset  61 is empty=0A=
pvdata -- logical volume struct at offset  62 is empty=0A=
pvdata -- logical volume struct at offset  63 is empty=0A=
pvdata -- logical volume struct at offset  64 is empty=0A=
pvdata -- logical volume struct at offset  65 is empty=0A=
pvdata -- logical volume struct at offset  66 is empty=0A=
pvdata -- logical volume struct at offset  67 is empty=0A=
pvdata -- logical volume struct at offset  68 is empty=0A=
pvdata -- logical volume struct at offset  69 is empty=0A=
pvdata -- logical volume struct at offset  70 is empty=0A=
pvdata -- logical volume struct at offset  71 is empty=0A=
pvdata -- logical volume struct at offset  72 is empty=0A=
pvdata -- logical volume struct at offset  73 is empty=0A=
pvdata -- logical volume struct at offset  74 is empty=0A=
pvdata -- logical volume struct at offset  75 is empty=0A=
pvdata -- logical volume struct at offset  76 is empty=0A=
pvdata -- logical volume struct at offset  77 is empty=0A=
pvdata -- logical volume struct at offset  78 is empty=0A=
pvdata -- logical volume struct at offset  79 is empty=0A=
pvdata -- logical volume struct at offset  80 is empty=0A=
pvdata -- logical volume struct at offset  81 is empty=0A=
pvdata -- logical volume struct at offset  82 is empty=0A=
pvdata -- logical volume struct at offset  83 is empty=0A=
pvdata -- logical volume struct at offset  84 is empty=0A=
pvdata -- logical volume struct at offset  85 is empty=0A=
pvdata -- logical volume struct at offset  86 is empty=0A=
pvdata -- logical volume struct at offset  87 is empty=0A=
pvdata -- logical volume struct at offset  88 is empty=0A=
pvdata -- logical volume struct at offset  89 is empty=0A=
pvdata -- logical volume struct at offset  90 is empty=0A=
pvdata -- logical volume struct at offset  91 is empty=0A=
pvdata -- logical volume struct at offset  92 is empty=0A=
pvdata -- logical volume struct at offset  93 is empty=0A=
pvdata -- logical volume struct at offset  94 is empty=0A=
pvdata -- logical volume struct at offset  95 is empty=0A=
pvdata -- logical volume struct at offset  96 is empty=0A=
pvdata -- logical volume struct at offset  97 is empty=0A=
pvdata -- logical volume struct at offset  98 is empty=0A=
pvdata -- logical volume struct at offset  99 is empty=0A=
pvdata -- logical volume struct at offset 100 is empty=0A=
pvdata -- logical volume struct at offset 101 is empty=0A=
pvdata -- logical volume struct at offset 102 is empty=0A=
pvdata -- logical volume struct at offset 103 is empty=0A=
pvdata -- logical volume struct at offset 104 is empty=0A=
pvdata -- logical volume struct at offset 105 is empty=0A=
pvdata -- logical volume struct at offset 106 is empty=0A=
pvdata -- logical volume struct at offset 107 is empty=0A=
pvdata -- logical volume struct at offset 108 is empty=0A=
pvdata -- logical volume struct at offset 109 is empty=0A=
pvdata -- logical volume struct at offset 110 is empty=0A=
pvdata -- logical volume struct at offset 111 is empty=0A=
pvdata -- logical volume struct at offset 112 is empty=0A=
pvdata -- logical volume struct at offset 113 is empty=0A=
pvdata -- logical volume struct at offset 114 is empty=0A=
pvdata -- logical volume struct at offset 115 is empty=0A=
pvdata -- logical volume struct at offset 116 is empty=0A=
pvdata -- logical volume struct at offset 117 is empty=0A=
pvdata -- logical volume struct at offset 118 is empty=0A=
pvdata -- logical volume struct at offset 119 is empty=0A=
pvdata -- logical volume struct at offset 120 is empty=0A=
pvdata -- logical volume struct at offset 121 is empty=0A=
pvdata -- logical volume struct at offset 122 is empty=0A=
pvdata -- logical volume struct at offset 123 is empty=0A=
pvdata -- logical volume struct at offset 124 is empty=0A=
pvdata -- logical volume struct at offset 125 is empty=0A=
pvdata -- logical volume struct at offset 126 is empty=0A=
pvdata -- logical volume struct at offset 127 is empty=0A=
pvdata -- logical volume struct at offset 128 is empty=0A=
pvdata -- logical volume struct at offset 129 is empty=0A=
pvdata -- logical volume struct at offset 130 is empty=0A=
pvdata -- logical volume struct at offset 131 is empty=0A=
pvdata -- logical volume struct at offset 132 is empty=0A=
pvdata -- logical volume struct at offset 133 is empty=0A=
pvdata -- logical volume struct at offset 134 is empty=0A=
pvdata -- logical volume struct at offset 135 is empty=0A=
pvdata -- logical volume struct at offset 136 is empty=0A=
pvdata -- logical volume struct at offset 137 is empty=0A=
pvdata -- logical volume struct at offset 138 is empty=0A=
pvdata -- logical volume struct at offset 139 is empty=0A=
pvdata -- logical volume struct at offset 140 is empty=0A=
pvdata -- logical volume struct at offset 141 is empty=0A=
pvdata -- logical volume struct at offset 142 is empty=0A=
pvdata -- logical volume struct at offset 143 is empty=0A=
pvdata -- logical volume struct at offset 144 is empty=0A=
pvdata -- logical volume struct at offset 145 is empty=0A=
pvdata -- logical volume struct at offset 146 is empty=0A=
pvdata -- logical volume struct at offset 147 is empty=0A=
pvdata -- logical volume struct at offset 148 is empty=0A=
pvdata -- logical volume struct at offset 149 is empty=0A=
pvdata -- logical volume struct at offset 150 is empty=0A=
pvdata -- logical volume struct at offset 151 is empty=0A=
pvdata -- logical volume struct at offset 152 is empty=0A=
pvdata -- logical volume struct at offset 153 is empty=0A=
pvdata -- logical volume struct at offset 154 is empty=0A=
pvdata -- logical volume struct at offset 155 is empty=0A=
pvdata -- logical volume struct at offset 156 is empty=0A=
pvdata -- logical volume struct at offset 157 is empty=0A=
pvdata -- logical volume struct at offset 158 is empty=0A=
pvdata -- logical volume struct at offset 159 is empty=0A=
pvdata -- logical volume struct at offset 160 is empty=0A=
pvdata -- logical volume struct at offset 161 is empty=0A=
pvdata -- logical volume struct at offset 162 is empty=0A=
pvdata -- logical volume struct at offset 163 is empty=0A=
pvdata -- logical volume struct at offset 164 is empty=0A=
pvdata -- logical volume struct at offset 165 is empty=0A=
pvdata -- logical volume struct at offset 166 is empty=0A=
pvdata -- logical volume struct at offset 167 is empty=0A=
pvdata -- logical volume struct at offset 168 is empty=0A=
pvdata -- logical volume struct at offset 169 is empty=0A=
pvdata -- logical volume struct at offset 170 is empty=0A=
pvdata -- logical volume struct at offset 171 is empty=0A=
pvdata -- logical volume struct at offset 172 is empty=0A=
pvdata -- logical volume struct at offset 173 is empty=0A=
pvdata -- logical volume struct at offset 174 is empty=0A=
pvdata -- logical volume struct at offset 175 is empty=0A=
pvdata -- logical volume struct at offset 176 is empty=0A=
pvdata -- logical volume struct at offset 177 is empty=0A=
pvdata -- logical volume struct at offset 178 is empty=0A=
pvdata -- logical volume struct at offset 179 is empty=0A=
pvdata -- logical volume struct at offset 180 is empty=0A=
pvdata -- logical volume struct at offset 181 is empty=0A=
pvdata -- logical volume struct at offset 182 is empty=0A=
pvdata -- logical volume struct at offset 183 is empty=0A=
pvdata -- logical volume struct at offset 184 is empty=0A=
pvdata -- logical volume struct at offset 185 is empty=0A=
pvdata -- logical volume struct at offset 186 is empty=0A=
pvdata -- logical volume struct at offset 187 is empty=0A=
pvdata -- logical volume struct at offset 188 is empty=0A=
pvdata -- logical volume struct at offset 189 is empty=0A=
pvdata -- logical volume struct at offset 190 is empty=0A=
pvdata -- logical volume struct at offset 191 is empty=0A=
pvdata -- logical volume struct at offset 192 is empty=0A=
pvdata -- logical volume struct at offset 193 is empty=0A=
pvdata -- logical volume struct at offset 194 is empty=0A=
pvdata -- logical volume struct at offset 195 is empty=0A=
pvdata -- logical volume struct at offset 196 is empty=0A=
pvdata -- logical volume struct at offset 197 is empty=0A=
pvdata -- logical volume struct at offset 198 is empty=0A=
pvdata -- logical volume struct at offset 199 is empty=0A=
pvdata -- logical volume struct at offset 200 is empty=0A=
pvdata -- logical volume struct at offset 201 is empty=0A=
pvdata -- logical volume struct at offset 202 is empty=0A=
pvdata -- logical volume struct at offset 203 is empty=0A=
pvdata -- logical volume struct at offset 204 is empty=0A=
pvdata -- logical volume struct at offset 205 is empty=0A=
pvdata -- logical volume struct at offset 206 is empty=0A=
pvdata -- logical volume struct at offset 207 is empty=0A=
pvdata -- logical volume struct at offset 208 is empty=0A=
pvdata -- logical volume struct at offset 209 is empty=0A=
pvdata -- logical volume struct at offset 210 is empty=0A=
pvdata -- logical volume struct at offset 211 is empty=0A=
pvdata -- logical volume struct at offset 212 is empty=0A=
pvdata -- logical volume struct at offset 213 is empty=0A=
pvdata -- logical volume struct at offset 214 is empty=0A=
pvdata -- logical volume struct at offset 215 is empty=0A=
pvdata -- logical volume struct at offset 216 is empty=0A=
pvdata -- logical volume struct at offset 217 is empty=0A=
pvdata -- logical volume struct at offset 218 is empty=0A=
pvdata -- logical volume struct at offset 219 is empty=0A=
pvdata -- logical volume struct at offset 220 is empty=0A=
pvdata -- logical volume struct at offset 221 is empty=0A=
pvdata -- logical volume struct at offset 222 is empty=0A=
pvdata -- logical volume struct at offset 223 is empty=0A=
pvdata -- logical volume struct at offset 224 is empty=0A=
pvdata -- logical volume struct at offset 225 is empty=0A=
pvdata -- logical volume struct at offset 226 is empty=0A=
pvdata -- logical volume struct at offset 227 is empty=0A=
pvdata -- logical volume struct at offset 228 is empty=0A=
pvdata -- logical volume struct at offset 229 is empty=0A=
pvdata -- logical volume struct at offset 230 is empty=0A=
pvdata -- logical volume struct at offset 231 is empty=0A=
pvdata -- logical volume struct at offset 232 is empty=0A=
pvdata -- logical volume struct at offset 233 is empty=0A=
pvdata -- logical volume struct at offset 234 is empty=0A=
pvdata -- logical volume struct at offset 235 is empty=0A=
pvdata -- logical volume struct at offset 236 is empty=0A=
pvdata -- logical volume struct at offset 237 is empty=0A=
pvdata -- logical volume struct at offset 238 is empty=0A=
pvdata -- logical volume struct at offset 239 is empty=0A=
pvdata -- logical volume struct at offset 240 is empty=0A=
pvdata -- logical volume struct at offset 241 is empty=0A=
pvdata -- logical volume struct at offset 242 is empty=0A=
pvdata -- logical volume struct at offset 243 is empty=0A=
pvdata -- logical volume struct at offset 244 is empty=0A=
pvdata -- logical volume struct at offset 245 is empty=0A=
pvdata -- logical volume struct at offset 246 is empty=0A=
pvdata -- logical volume struct at offset 247 is empty=0A=
pvdata -- logical volume struct at offset 248 is empty=0A=
pvdata -- logical volume struct at offset 249 is empty=0A=
pvdata -- logical volume struct at offset 250 is empty=0A=
pvdata -- logical volume struct at offset 251 is empty=0A=
pvdata -- logical volume struct at offset 252 is empty=0A=
pvdata -- logical volume struct at offset 253 is empty=0A=
pvdata -- logical volume struct at offset 254 is empty=0A=
pvdata -- logical volume struct at offset 255 is empty=0A=
--- List of physical volume UUIDs ---=0A=
=0A=
001: fUpDkm-NW7Z-IBxR-9u9p-qbJX-u5pA-CQqvdz=0A=
002: 3DZQlb-aM8N-6tSt-O8nS-nNit-on2p-zb7cFz=0A=
003: e9r6F4-W77i-1OFm-gjql-Im5x-4baI-daYKAX=0A=
=0A=

------=_NextPart_000_0005_01C2D0E8.8FEF7420
Content-Type: application/octet-stream;
	name="pvdata-hdd7"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="pvdata-hdd7"

--- Physical volume ---=0A=
PV Name               /dev/hdd7=0A=
VG Name               datavg=0A=
PV Size               2.93 GB [6144705 secs] / NOT usable 16.19 MB [LVM: =
128 KB]=0A=
PV#                   3=0A=
PV Status             NOT available=0A=
Allocatable           yes (but full)=0A=
Cur LV                1=0A=
PE Size (KByte)       16384=0A=
Total PE              186=0A=
Free PE               0=0A=
Allocated PE          186=0A=
PV UUID               e9r6F4-W77i-1OFm-gjql-Im5x-4baI-daYKAX=0A=
=0A=
--- Volume group ---=0A=
VG Name               =0A=
VG Access             read/write=0A=
VG Status             NOT available/resizable=0A=
VG #                  0=0A=
MAX LV                256=0A=
Cur LV                1=0A=
Open LV               0=0A=
MAX LV Size           1023.97 GB=0A=
Max PV                256=0A=
Cur PV                3=0A=
Act PV                3=0A=
VG Size               6.78 GB=0A=
PE Size               16 MB=0A=
Total PE              434=0A=
Alloc PE / Size       434 / 6.78 GB=0A=
Free  PE / Size       0 / 0=0A=
VG UUID               UJTB73-y6qL-wkx6-O74e-uDh1-p31H-UtetP7=0A=
=0A=
--- List of logical volumes ---=0A=
=0A=
pvdata -- logical volume "/dev/datavg/datalv" at offset   0=0A=
pvdata -- logical volume struct at offset   1 is empty=0A=
pvdata -- logical volume struct at offset   2 is empty=0A=
pvdata -- logical volume struct at offset   3 is empty=0A=
pvdata -- logical volume struct at offset   4 is empty=0A=
pvdata -- logical volume struct at offset   5 is empty=0A=
pvdata -- logical volume struct at offset   6 is empty=0A=
pvdata -- logical volume struct at offset   7 is empty=0A=
pvdata -- logical volume struct at offset   8 is empty=0A=
pvdata -- logical volume struct at offset   9 is empty=0A=
pvdata -- logical volume struct at offset  10 is empty=0A=
pvdata -- logical volume struct at offset  11 is empty=0A=
pvdata -- logical volume struct at offset  12 is empty=0A=
pvdata -- logical volume struct at offset  13 is empty=0A=
pvdata -- logical volume struct at offset  14 is empty=0A=
pvdata -- logical volume struct at offset  15 is empty=0A=
pvdata -- logical volume struct at offset  16 is empty=0A=
pvdata -- logical volume struct at offset  17 is empty=0A=
pvdata -- logical volume struct at offset  18 is empty=0A=
pvdata -- logical volume struct at offset  19 is empty=0A=
pvdata -- logical volume struct at offset  20 is empty=0A=
pvdata -- logical volume struct at offset  21 is empty=0A=
pvdata -- logical volume struct at offset  22 is empty=0A=
pvdata -- logical volume struct at offset  23 is empty=0A=
pvdata -- logical volume struct at offset  24 is empty=0A=
pvdata -- logical volume struct at offset  25 is empty=0A=
pvdata -- logical volume struct at offset  26 is empty=0A=
pvdata -- logical volume struct at offset  27 is empty=0A=
pvdata -- logical volume struct at offset  28 is empty=0A=
pvdata -- logical volume struct at offset  29 is empty=0A=
pvdata -- logical volume struct at offset  30 is empty=0A=
pvdata -- logical volume struct at offset  31 is empty=0A=
pvdata -- logical volume struct at offset  32 is empty=0A=
pvdata -- logical volume struct at offset  33 is empty=0A=
pvdata -- logical volume struct at offset  34 is empty=0A=
pvdata -- logical volume struct at offset  35 is empty=0A=
pvdata -- logical volume struct at offset  36 is empty=0A=
pvdata -- logical volume struct at offset  37 is empty=0A=
pvdata -- logical volume struct at offset  38 is empty=0A=
pvdata -- logical volume struct at offset  39 is empty=0A=
pvdata -- logical volume struct at offset  40 is empty=0A=
pvdata -- logical volume struct at offset  41 is empty=0A=
pvdata -- logical volume struct at offset  42 is empty=0A=
pvdata -- logical volume struct at offset  43 is empty=0A=
pvdata -- logical volume struct at offset  44 is empty=0A=
pvdata -- logical volume struct at offset  45 is empty=0A=
pvdata -- logical volume struct at offset  46 is empty=0A=
pvdata -- logical volume struct at offset  47 is empty=0A=
pvdata -- logical volume struct at offset  48 is empty=0A=
pvdata -- logical volume struct at offset  49 is empty=0A=
pvdata -- logical volume struct at offset  50 is empty=0A=
pvdata -- logical volume struct at offset  51 is empty=0A=
pvdata -- logical volume struct at offset  52 is empty=0A=
pvdata -- logical volume struct at offset  53 is empty=0A=
pvdata -- logical volume struct at offset  54 is empty=0A=
pvdata -- logical volume struct at offset  55 is empty=0A=
pvdata -- logical volume struct at offset  56 is empty=0A=
pvdata -- logical volume struct at offset  57 is empty=0A=
pvdata -- logical volume struct at offset  58 is empty=0A=
pvdata -- logical volume struct at offset  59 is empty=0A=
pvdata -- logical volume struct at offset  60 is empty=0A=
pvdata -- logical volume struct at offset  61 is empty=0A=
pvdata -- logical volume struct at offset  62 is empty=0A=
pvdata -- logical volume struct at offset  63 is empty=0A=
pvdata -- logical volume struct at offset  64 is empty=0A=
pvdata -- logical volume struct at offset  65 is empty=0A=
pvdata -- logical volume struct at offset  66 is empty=0A=
pvdata -- logical volume struct at offset  67 is empty=0A=
pvdata -- logical volume struct at offset  68 is empty=0A=
pvdata -- logical volume struct at offset  69 is empty=0A=
pvdata -- logical volume struct at offset  70 is empty=0A=
pvdata -- logical volume struct at offset  71 is empty=0A=
pvdata -- logical volume struct at offset  72 is empty=0A=
pvdata -- logical volume struct at offset  73 is empty=0A=
pvdata -- logical volume struct at offset  74 is empty=0A=
pvdata -- logical volume struct at offset  75 is empty=0A=
pvdata -- logical volume struct at offset  76 is empty=0A=
pvdata -- logical volume struct at offset  77 is empty=0A=
pvdata -- logical volume struct at offset  78 is empty=0A=
pvdata -- logical volume struct at offset  79 is empty=0A=
pvdata -- logical volume struct at offset  80 is empty=0A=
pvdata -- logical volume struct at offset  81 is empty=0A=
pvdata -- logical volume struct at offset  82 is empty=0A=
pvdata -- logical volume struct at offset  83 is empty=0A=
pvdata -- logical volume struct at offset  84 is empty=0A=
pvdata -- logical volume struct at offset  85 is empty=0A=
pvdata -- logical volume struct at offset  86 is empty=0A=
pvdata -- logical volume struct at offset  87 is empty=0A=
pvdata -- logical volume struct at offset  88 is empty=0A=
pvdata -- logical volume struct at offset  89 is empty=0A=
pvdata -- logical volume struct at offset  90 is empty=0A=
pvdata -- logical volume struct at offset  91 is empty=0A=
pvdata -- logical volume struct at offset  92 is empty=0A=
pvdata -- logical volume struct at offset  93 is empty=0A=
pvdata -- logical volume struct at offset  94 is empty=0A=
pvdata -- logical volume struct at offset  95 is empty=0A=
pvdata -- logical volume struct at offset  96 is empty=0A=
pvdata -- logical volume struct at offset  97 is empty=0A=
pvdata -- logical volume struct at offset  98 is empty=0A=
pvdata -- logical volume struct at offset  99 is empty=0A=
pvdata -- logical volume struct at offset 100 is empty=0A=
pvdata -- logical volume struct at offset 101 is empty=0A=
pvdata -- logical volume struct at offset 102 is empty=0A=
pvdata -- logical volume struct at offset 103 is empty=0A=
pvdata -- logical volume struct at offset 104 is empty=0A=
pvdata -- logical volume struct at offset 105 is empty=0A=
pvdata -- logical volume struct at offset 106 is empty=0A=
pvdata -- logical volume struct at offset 107 is empty=0A=
pvdata -- logical volume struct at offset 108 is empty=0A=
pvdata -- logical volume struct at offset 109 is empty=0A=
pvdata -- logical volume struct at offset 110 is empty=0A=
pvdata -- logical volume struct at offset 111 is empty=0A=
pvdata -- logical volume struct at offset 112 is empty=0A=
pvdata -- logical volume struct at offset 113 is empty=0A=
pvdata -- logical volume struct at offset 114 is empty=0A=
pvdata -- logical volume struct at offset 115 is empty=0A=
pvdata -- logical volume struct at offset 116 is empty=0A=
pvdata -- logical volume struct at offset 117 is empty=0A=
pvdata -- logical volume struct at offset 118 is empty=0A=
pvdata -- logical volume struct at offset 119 is empty=0A=
pvdata -- logical volume struct at offset 120 is empty=0A=
pvdata -- logical volume struct at offset 121 is empty=0A=
pvdata -- logical volume struct at offset 122 is empty=0A=
pvdata -- logical volume struct at offset 123 is empty=0A=
pvdata -- logical volume struct at offset 124 is empty=0A=
pvdata -- logical volume struct at offset 125 is empty=0A=
pvdata -- logical volume struct at offset 126 is empty=0A=
pvdata -- logical volume struct at offset 127 is empty=0A=
pvdata -- logical volume struct at offset 128 is empty=0A=
pvdata -- logical volume struct at offset 129 is empty=0A=
pvdata -- logical volume struct at offset 130 is empty=0A=
pvdata -- logical volume struct at offset 131 is empty=0A=
pvdata -- logical volume struct at offset 132 is empty=0A=
pvdata -- logical volume struct at offset 133 is empty=0A=
pvdata -- logical volume struct at offset 134 is empty=0A=
pvdata -- logical volume struct at offset 135 is empty=0A=
pvdata -- logical volume struct at offset 136 is empty=0A=
pvdata -- logical volume struct at offset 137 is empty=0A=
pvdata -- logical volume struct at offset 138 is empty=0A=
pvdata -- logical volume struct at offset 139 is empty=0A=
pvdata -- logical volume struct at offset 140 is empty=0A=
pvdata -- logical volume struct at offset 141 is empty=0A=
pvdata -- logical volume struct at offset 142 is empty=0A=
pvdata -- logical volume struct at offset 143 is empty=0A=
pvdata -- logical volume struct at offset 144 is empty=0A=
pvdata -- logical volume struct at offset 145 is empty=0A=
pvdata -- logical volume struct at offset 146 is empty=0A=
pvdata -- logical volume struct at offset 147 is empty=0A=
pvdata -- logical volume struct at offset 148 is empty=0A=
pvdata -- logical volume struct at offset 149 is empty=0A=
pvdata -- logical volume struct at offset 150 is empty=0A=
pvdata -- logical volume struct at offset 151 is empty=0A=
pvdata -- logical volume struct at offset 152 is empty=0A=
pvdata -- logical volume struct at offset 153 is empty=0A=
pvdata -- logical volume struct at offset 154 is empty=0A=
pvdata -- logical volume struct at offset 155 is empty=0A=
pvdata -- logical volume struct at offset 156 is empty=0A=
pvdata -- logical volume struct at offset 157 is empty=0A=
pvdata -- logical volume struct at offset 158 is empty=0A=
pvdata -- logical volume struct at offset 159 is empty=0A=
pvdata -- logical volume struct at offset 160 is empty=0A=
pvdata -- logical volume struct at offset 161 is empty=0A=
pvdata -- logical volume struct at offset 162 is empty=0A=
pvdata -- logical volume struct at offset 163 is empty=0A=
pvdata -- logical volume struct at offset 164 is empty=0A=
pvdata -- logical volume struct at offset 165 is empty=0A=
pvdata -- logical volume struct at offset 166 is empty=0A=
pvdata -- logical volume struct at offset 167 is empty=0A=
pvdata -- logical volume struct at offset 168 is empty=0A=
pvdata -- logical volume struct at offset 169 is empty=0A=
pvdata -- logical volume struct at offset 170 is empty=0A=
pvdata -- logical volume struct at offset 171 is empty=0A=
pvdata -- logical volume struct at offset 172 is empty=0A=
pvdata -- logical volume struct at offset 173 is empty=0A=
pvdata -- logical volume struct at offset 174 is empty=0A=
pvdata -- logical volume struct at offset 175 is empty=0A=
pvdata -- logical volume struct at offset 176 is empty=0A=
pvdata -- logical volume struct at offset 177 is empty=0A=
pvdata -- logical volume struct at offset 178 is empty=0A=
pvdata -- logical volume struct at offset 179 is empty=0A=
pvdata -- logical volume struct at offset 180 is empty=0A=
pvdata -- logical volume struct at offset 181 is empty=0A=
pvdata -- logical volume struct at offset 182 is empty=0A=
pvdata -- logical volume struct at offset 183 is empty=0A=
pvdata -- logical volume struct at offset 184 is empty=0A=
pvdata -- logical volume struct at offset 185 is empty=0A=
pvdata -- logical volume struct at offset 186 is empty=0A=
pvdata -- logical volume struct at offset 187 is empty=0A=
pvdata -- logical volume struct at offset 188 is empty=0A=
pvdata -- logical volume struct at offset 189 is empty=0A=
pvdata -- logical volume struct at offset 190 is empty=0A=
pvdata -- logical volume struct at offset 191 is empty=0A=
pvdata -- logical volume struct at offset 192 is empty=0A=
pvdata -- logical volume struct at offset 193 is empty=0A=
pvdata -- logical volume struct at offset 194 is empty=0A=
pvdata -- logical volume struct at offset 195 is empty=0A=
pvdata -- logical volume struct at offset 196 is empty=0A=
pvdata -- logical volume struct at offset 197 is empty=0A=
pvdata -- logical volume struct at offset 198 is empty=0A=
pvdata -- logical volume struct at offset 199 is empty=0A=
pvdata -- logical volume struct at offset 200 is empty=0A=
pvdata -- logical volume struct at offset 201 is empty=0A=
pvdata -- logical volume struct at offset 202 is empty=0A=
pvdata -- logical volume struct at offset 203 is empty=0A=
pvdata -- logical volume struct at offset 204 is empty=0A=
pvdata -- logical volume struct at offset 205 is empty=0A=
pvdata -- logical volume struct at offset 206 is empty=0A=
pvdata -- logical volume struct at offset 207 is empty=0A=
pvdata -- logical volume struct at offset 208 is empty=0A=
pvdata -- logical volume struct at offset 209 is empty=0A=
pvdata -- logical volume struct at offset 210 is empty=0A=
pvdata -- logical volume struct at offset 211 is empty=0A=
pvdata -- logical volume struct at offset 212 is empty=0A=
pvdata -- logical volume struct at offset 213 is empty=0A=
pvdata -- logical volume struct at offset 214 is empty=0A=
pvdata -- logical volume struct at offset 215 is empty=0A=
pvdata -- logical volume struct at offset 216 is empty=0A=
pvdata -- logical volume struct at offset 217 is empty=0A=
pvdata -- logical volume struct at offset 218 is empty=0A=
pvdata -- logical volume struct at offset 219 is empty=0A=
pvdata -- logical volume struct at offset 220 is empty=0A=
pvdata -- logical volume struct at offset 221 is empty=0A=
pvdata -- logical volume struct at offset 222 is empty=0A=
pvdata -- logical volume struct at offset 223 is empty=0A=
pvdata -- logical volume struct at offset 224 is empty=0A=
pvdata -- logical volume struct at offset 225 is empty=0A=
pvdata -- logical volume struct at offset 226 is empty=0A=
pvdata -- logical volume struct at offset 227 is empty=0A=
pvdata -- logical volume struct at offset 228 is empty=0A=
pvdata -- logical volume struct at offset 229 is empty=0A=
pvdata -- logical volume struct at offset 230 is empty=0A=
pvdata -- logical volume struct at offset 231 is empty=0A=
pvdata -- logical volume struct at offset 232 is empty=0A=
pvdata -- logical volume struct at offset 233 is empty=0A=
pvdata -- logical volume struct at offset 234 is empty=0A=
pvdata -- logical volume struct at offset 235 is empty=0A=
pvdata -- logical volume struct at offset 236 is empty=0A=
pvdata -- logical volume struct at offset 237 is empty=0A=
pvdata -- logical volume struct at offset 238 is empty=0A=
pvdata -- logical volume struct at offset 239 is empty=0A=
pvdata -- logical volume struct at offset 240 is empty=0A=
pvdata -- logical volume struct at offset 241 is empty=0A=
pvdata -- logical volume struct at offset 242 is empty=0A=
pvdata -- logical volume struct at offset 243 is empty=0A=
pvdata -- logical volume struct at offset 244 is empty=0A=
pvdata -- logical volume struct at offset 245 is empty=0A=
pvdata -- logical volume struct at offset 246 is empty=0A=
pvdata -- logical volume struct at offset 247 is empty=0A=
pvdata -- logical volume struct at offset 248 is empty=0A=
pvdata -- logical volume struct at offset 249 is empty=0A=
pvdata -- logical volume struct at offset 250 is empty=0A=
pvdata -- logical volume struct at offset 251 is empty=0A=
pvdata -- logical volume struct at offset 252 is empty=0A=
pvdata -- logical volume struct at offset 253 is empty=0A=
pvdata -- logical volume struct at offset 254 is empty=0A=
pvdata -- logical volume struct at offset 255 is empty=0A=
--- List of physical volume UUIDs ---=0A=
=0A=
001: fUpDkm-NW7Z-IBxR-9u9p-qbJX-u5pA-CQqvdz=0A=
002: 3DZQlb-aM8N-6tSt-O8nS-nNit-on2p-zb7cFz=0A=
003: e9r6F4-W77i-1OFm-gjql-Im5x-4baI-daYKAX=0A=
=0A=

------=_NextPart_000_0005_01C2D0E8.8FEF7420
Content-Type: application/octet-stream;
	name="pvdisplay-hdd5"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="pvdisplay-hdd5"

--- Physical volume ---=0A=
PV Name               /dev/hdd5=0A=
VG Name               datavg=0A=
PV Size               1.95 GB [4096449 secs] / NOT usable 16.19 MB [LVM: =
128 KB]=0A=
PV#                   1=0A=
PV Status             NOT available=0A=
Allocatable           yes (but full)=0A=
Cur LV                1=0A=
PE Size (KByte)       16384=0A=
Total PE              124=0A=
Free PE               0=0A=
Allocated PE          124=0A=
PV UUID               fUpDkm-NW7Z-IBxR-9u9p-qbJX-u5pA-CQqvdz=0A=
=0A=
=0A=

------=_NextPart_000_0005_01C2D0E8.8FEF7420
Content-Type: application/octet-stream;
	name="pvdisplay-hdd6"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="pvdisplay-hdd6"

--- Physical volume ---=0A=
PV Name               /dev/hdd6=0A=
VG Name               datavg=0A=
PV Size               1.95 GB [4096449 secs] / NOT usable 16.19 MB [LVM: =
128 KB]=0A=
PV#                   2=0A=
PV Status             available=0A=
Allocatable           yes (but full)=0A=
Cur LV                1=0A=
PE Size (KByte)       16384=0A=
Total PE              124=0A=
Free PE               0=0A=
Allocated PE          124=0A=
PV UUID               3DZQlb-aM8N-6tSt-O8nS-nNit-on2p-zb7cFz=0A=
=0A=
=0A=

------=_NextPart_000_0005_01C2D0E8.8FEF7420
Content-Type: application/octet-stream;
	name="pvdisplay-hdd7"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="pvdisplay-hdd7"

--- Physical volume ---=0A=
PV Name               /dev/hdd7=0A=
VG Name               datavg=0A=
PV Size               2.93 GB [6144705 secs] / NOT usable 16.19 MB [LVM: =
128 KB]=0A=
PV#                   3=0A=
PV Status             NOT available=0A=
Allocatable           yes (but full)=0A=
Cur LV                1=0A=
PE Size (KByte)       16384=0A=
Total PE              186=0A=
Free PE               0=0A=
Allocated PE          186=0A=
PV UUID               e9r6F4-W77i-1OFm-gjql-Im5x-4baI-daYKAX=0A=
=0A=
=0A=

------=_NextPart_000_0005_01C2D0E8.8FEF7420
Content-Type: application/octet-stream;
	name="pvscan"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="pvscan"

pvscan -- reading all physical volumes (this may take a while...)=0A=
pvscan -- ACTIVE   PV "/dev/hdd5" of VG "datavg" [1.94 GB / 0 free]=0A=
pvscan -- ACTIVE   PV "/dev/hdd6" of VG "datavg" [1.94 GB / 0 free]=0A=
pvscan -- ACTIVE   PV "/dev/hdd7" of VG "datavg" [2.91 GB / 0 free]=0A=
pvscan -- total: 3 [6.84 GB] / in use: 3 [6.84 GB] / in no VG: 0 [0]=0A=
=0A=

------=_NextPart_000_0005_01C2D0E8.8FEF7420
Content-Type: application/octet-stream;
	name="vgdisplay"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="vgdisplay"

--- Volume group ---=0A=
VG Name               datavg=0A=
VG Access             read/write=0A=
VG Status             available/resizable=0A=
VG #                  0=0A=
MAX LV                256=0A=
Cur LV                1=0A=
Open LV               1=0A=
MAX LV Size           1023.97 GB=0A=
Max PV                256=0A=
Cur PV                3=0A=
Act PV                3=0A=
VG Size               6.78 GB=0A=
PE Size               16 MB=0A=
Total PE              434=0A=
Alloc PE / Size       434 / 6.78 GB=0A=
Free  PE / Size       0 / 0=0A=
VG UUID               UJTB73-y6qL-wkx6-O74e-uDh1-p31H-UtetP7=0A=
=0A=
=0A=

------=_NextPart_000_0005_01C2D0E8.8FEF7420
Content-Type: application/octet-stream;
	name="vgscan"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="vgscan"

vgscan -- reading all physical volumes (this may take a while...)=0A=
vgscan -- found active volume group "datavg"=0A=
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created=0A=
vgscan -- WARNING: This program does not do a VGDA backup of your volume =
group=0A=
=0A=

------=_NextPart_000_0005_01C2D0E8.8FEF7420--
