Message-ID: <52541.195.212.29.226.1037092283.squirrel@webmail.nnm.ee>
From: "Liivo Liivrand" <liivo@nnm.ee>
In-Reply-To: <20021111225402.29940.1223.Mailman@hermes.sistina.com>
References: <20021111225402.29940.1223.Mailman@hermes.sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] need to restore corrupted VG, help needed!
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
Date: Tue Nov 12 03:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello All!

I had a disk crash on my system and now I need to have my VG back, but
how? I had two HDDs, one containing root partition and one with LVM. HDD
with root partition crashed and backup was too old to restore :-( Now I
installed new system (RedHat 8.0) and need urgently to have my files from
old LVs, but I can't. Please help me! Look down, I think that problem is
in PV#, but how can I change it?

Output follows:
--- Cut ---
# fdisk -l /dev/hde

Disk /dev/hde: 16 heads, 63 sectors, 79780 cylinders
Units = cylinders of 1008 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hde1   *         1       203    102280+  fd  Linux raid autodetect
/dev/hde2           204      1243    524160   8e  Linux LVM
/dev/hde3          1244      1446    102312   fd  Linux raid autodetect
/dev/hde4          1447     79780  39480336   85  Linux extended
/dev/hde5          1447     79780  39480304+  8e  Linux LVM

# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "sys"
vgscan -- found exported volume group "vgPV_EXP"
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume group "vg" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
groups

# vgimport -f vg /dev/hde5
vgimport -- ERROR: wrong number of physical volumes to import volume group
"vg"

# pvdisplay /dev/hde5
--- Physical volume ---
PV Name               /dev/hde5
VG Name               vg
PV Size               37.65 GB [78960609 secs] / NOT usable 4.18 MB [LVM:
161 KB]
PV#                   2
PV Status             NOT available
Allocatable           yes
Cur LV                0
PE Size (KByte)       4096
Total PE              9637
Free PE               9637
Allocated PE          0
PV UUID               7OuTtg-ci2d-4jcK-zhlO-0W5F-YvlT-lzkXMp

# pvdata -v /dev/hde5
--- Physical volume ---
PV Name               /dev/hde5
VG Name               vg
PV Size               37.65 GB [78960609 secs] / NOT usable 4.18 MB [LVM:
161 KB]
PV#                   2
PV Status             NOT available
Allocatable           yes
Cur LV                0
PE Size (KByte)       4096
Total PE              9637
Free PE               9637
Allocated PE          0
PV UUID               7OuTtg-ci2d-4jcK-zhlO-0W5F-YvlT-lzkXMp

--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                255
Cur LV                11
Open LV               0
MAX LV Size           255.99 GB
Max PV                255
Cur PV                2
Act PV                2
VG Size               75.29 GB
PE Size               4 MB
Total PE              19274
Alloc PE / Size       9583 / 37.43 GB
Free  PE / Size       9691 / 37.86 GB
VG UUID               rlXBoA-tr41-RwgY-vy0J-EnF2-tAvt-meH7ra

--- List of logical volumes ---

--- Logical volume ---
LV Name                /dev/vg/home
VG Name                vg
LV Write Access        read/write
LV Status              NOT available
LV #                   1
# open                 0
LV Size                16 GB
Current LE             4096
Allocated LE           4096
Allocation             next free
Read ahead sectors     120
Block device           58:0
read_ahead: 120

--- Logical volume ---
LV Name                /dev/vg/backup
VG Name                vg
LV Write Access        read/write
LV Status              NOT available
LV #                   2
# open                 0
LV Size                700 MB
Current LE             175
Allocated LE           175
Allocation             next free
Read ahead sectors     120
Block device           58:1
read_ahead: 120

--- Logical volume ---
LV Name                /dev/vg/opt
VG Name                vg
LV Write Access        read/write
LV Status              NOT available
LV #                   3
# open                 0
LV Size                1.02 GB
Current LE             260
Allocated LE           260
Allocation             next free
Read ahead sectors     120
Block device           58:2
read_ahead: 120

--- Logical volume ---
LV Name                /dev/vg/squid
VG Name                vg
LV Write Access        read/write
LV Status              NOT available
LV #                   4
# open                 0
LV Size                6 GB
Current LE             1536
Allocated LE           1536
Allocation             next free
Read ahead sectors     120
Block device           58:3
read_ahead: 120

--- Logical volume ---
LV Name                /dev/vg/install
VG Name                vg
LV Write Access        read/write
LV Status              NOT available
LV #                   5
# open                 0
LV Size                4 GB
Current LE             1024
Allocated LE           1024
Allocation             next free
Read ahead sectors     120
Block device           58:4
read_ahead: 120

--- Logical volume ---
LV Name                /dev/vg/tmp
VG Name                vg
LV Write Access        read/write
LV Status              NOT available
LV #                   6
# open                 0
LV Size                500 MB
Current LE             125
Allocated LE           125
Allocation             next free
Read ahead sectors     120
Block device           58:5
read_ahead: 120

--- Logical volume ---
LV Name                /dev/vg/usr
VG Name                vg
LV Write Access        read/write
LV Status              NOT available
LV #                   7
# open                 0
LV Size                2 GB
Current LE             512
Allocated LE           512
Allocation             next free
Read ahead sectors     120
Block device           58:6
read_ahead: 120

--- Logical volume ---
LV Name                /dev/vg/var
VG Name                vg
LV Write Access        read/write
LV Status              NOT available
LV #                   8
# open                 0
LV Size                1 GB
Current LE             256
Allocated LE           256
Allocation             next free
Read ahead sectors     120
Block device           58:7
read_ahead: 120

--- Logical volume ---
LV Name                /dev/vg/public
VG Name                vg
LV Write Access        read/write
LV Status              NOT available
LV #                   9
# open                 0
LV Size                4 GB
Current LE             1024
Allocated LE           1024
Allocation             next free
Read ahead sectors     120
Block device           58:8
read_ahead: 120

--- Logical volume ---
LV Name                /dev/vg/WebCD
VG Name                vg
LV Write Access        read/write
LV Status              NOT available
LV #                   10
# open                 0
LV Size                1.56 GB
Current LE             400
Allocated LE           400
Allocation             next free
Read ahead sectors     120
Block device           58:9
read_ahead: 120

--- Logical volume ---
LV Name                /dev/vg/scratch
VG Name                vg
LV Write Access        read/write
LV Status              NOT available
LV #                   11
# open                 0
LV Size                700 MB
Current LE             175
Allocated LE           175
Allocation             next free
Read ahead sectors     120
Block device           58:10
read_ahead: 120

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
--- List of physical volume UUIDs ---

001: Zy48rM-UOIi-0gP7-TvjK-apfK-4oJ1-0rvV2b
002: 7OuTtg-ci2d-4jcK-zhlO-0W5F-YvlT-lzkXMp

--- Cut ---
