From: "^YosH^" <yosh@liquidzone.net>
Subject: SV: SV: [linux-lvm] Need to remove broken hdd, and need to move the stuff i can from the broken disk
Message-ID: <000201c3548d$c97e85e0$0296a8c0@malin>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20030727225636.E31325@uk.sistina.com>
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
Date: Sun Jul 27 17:26:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@sistina.com

Yeah im using lvm1, sorry I did not mention this but I didn=92t realize
the new version was out, ill have to look into upgrading it... I have
done a fsck without the fs mounted both with and without the -c switch
with the same result every time, the lvm seem to hang and the following
shows up in my kernel log:

Jul 27 22:00:38 c-47bf72d5 kernel: hdg: dma_intr: status=3D0x51 {
DriveReady SeekComplete Error }
Jul 27 22:00:38 c-47bf72d5 kernel: hdg: dma_intr: error=3D0x40 {
UncorrectableError }, LBAsect=3D178127736, high=3D10, low=3D10355576,
sector=3D178127736
Jul 27 22:00:38 c-47bf72d5 kernel: end_request: I/O error, dev 22:00
(hdg), sector 178127736
Jul 27 22:00:38 c-47bf72d5 kernel: EXT3-fs error (device lvm(58,0)):
ext3_get_inode_loc: unable to read inode block - inode=3D86147073,
block=3D172294207


Before I can do anything else I need to reboot the box and try to access
the drive again...

Tried that pvdata command and got this:

[root@c-47bf72d5 root]# pvdata /dev/hdg
--- Physical volume ---
PV Name               /dev/hdg
VG Name               lvm
PV Size               232.89 GB [488397168 secs] / NOT usable 64.19 MB
[LVM: 142 KB]
PV#                   5
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       65536
Total PE              3725
Free PE               0
Allocated PE          3725
PV UUID               Nt2gWs-FbQf-Q20G-T918-Qivy-ZVbn-MJib57

--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                6
Act PV                6
VG Size               957.75 GB
PE Size               64 MB
Total PE              15324
Alloc PE / Size       15324 / 957.75 GB
Free  PE / Size       0 / 0
VG UUID               mkS2aX-LGUK-2WAg-wY5A-aR28-tL7t-u5iFCf

--- List of logical volumes ---

pvdata -- logical volume "/dev/lvm/lvm" at offset   0
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
--- List of physical volume UUIDs ---

001: BoIRX3-51Wt-qobG-9Bbs-s645-drey-Csd9VU
002: XfBQRE-eOz0-HD50-e88w-4MP0-mXMS-SrJxC3
003: OVUe6B-SI0R-71Xo-NU4s-BQwU-zPgR-Bf6RvM
004: 2Ea3i5-Jo0b-hB73-kENF-TffA-j4ep-QeZhRn
005: Nt2gWs-FbQf-Q20G-T918-Qivy-ZVbn-MJib57
006: 0EudhZ-dtuy-WuPG-r6ED-Fp9V-LFkb-CktrYG

it doesn=92t tell me much... is a upgrade to lvm2 hard to do? And do I
have to convert the lvm in some way? Maybe it will be easier to fix with
lvm2...



-----Ursprungligt meddelande-----
Fr=E5n: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]
F=F6r Alasdair G Kergon
Skickat: den 27 juli 2003 23:57
Till: linux-lvm@sistina.com
=C4mne: Re: SV: [linux-lvm] Need to remove broken hdd, and need to move
the stuff i can from the broken disk

On Sun, Jul 27, 2003 at 11:35:24PM +0200, ^YosH^ wrote:
> Seems I don=92t have that backup dir, don=92t even have a /etc/lvm =
dir...

That means you must be using LVM1.

Try the 'pvdata' command (see man page for options) to find out what's
on a particular PV.

[For people reading this in the list archives, the LVM2 command to see=20
the layout is lvdisplay --maps]

> I have been trying to move stuff of the lvm too to free som space, but
> the drive hangs everytime there is a dir that=92s located on the =
crashed
> disk...

Another option:=20
    An fsck (not while fs is mounted) with the badblocks option?  [-c]

But if the whole disk is gone, the best option is likely to be LVM2's=20
partial mode (see list archives).

Alasdair


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
