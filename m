Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i28G1D826057
	for <linux-lvm@redhat.com>; Mon, 8 Mar 2004 11:01:13 -0500
Received: from localhost (30-223.surfsnel.dsl.internl.net [145.99.223.30])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i28G1AST010534
	for <linux-lvm@redhat.com>; Mon, 8 Mar 2004 11:01:11 -0500
Received: from localhost ([::1] helo=fel.tno.nl)
	by localhost with esmtp (Exim 4.30)
	id 1B0NBg-0001K7-P5
	for linux-lvm@redhat.com; Mon, 08 Mar 2004 17:01:04 +0100
Message-ID: <404C98C0.109@fel.tno.nl>
From: Jan Rhebergen <Rhebergen@fel.tno.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvmguy(s) assistance needed recovering VG
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Mar  8 16:26:07 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Dear readers,

Losing access to a VG seems to be a frequent problem especially with 
(relative) newbies like I am. Once before this occurred to me. With some 
coaching of Patrick (PJC) I was able to fully recover. I've tried to 
search the linux-lvm list but I keep getting the message "redhat.com is 
temporarily unavailable. Please try back later."

Now I am in trouble again! :( I've gone through a similar procedure as 
last time to try and recover the inaccessible VG. Alas, to no avail. So, 
please lvmguy(s) help me get my data back. (i'm not talking about 
recovering some lost mail or mp3's but i'm trying to recover 
valuable/unique scientific data)

An earlier message to this list details the actions leading up to the 
problems.

http://www.redhat.com/archives/linux-lvm/2004-March/msg00038.html

I'll recap shortly here, (result of pvdisplay and pvdata below).

After rearranging some LVs which seemed to go smoothly. I attempted to 
reboot in order to resize the LV that /usr was on. Reason being that on 
my system you cannot resize a mounted file system. Unfortunately, when 
rebooting (so before getting the chance to resize the LV with /usr) it 
could not find the VG!

Now I have an emergency system installed on the same box which still has 
some old configuration/meta data which I hope would enable me to restore 
an older configuration, which at least would grant me access to the root 
on lvm where the most recent configuration info can be found (yes, I 
know there is a lesson there). I've restored a previous configuration, 
but this failed to get my VGs back. Now the metadata on the two drives 
is different. I'm a bit scared to proceed any further fearing I might 
inflict more damage.

So please, lvmguy(s) if you can spare a moment to help me,... ?


regards,

Jan Rhebergen

PS: below the output of

lvm pvdisplay
lvm pvdisplay /dev/hdb
pvdisplay /dev/hda3
pvdisplay /dev/hdb
pvdata /dev/hda3
pvdata /dev/hdb


titan:~# lvm pvdisplay
  VG data differs between PVs /dev/hda3 and /dev/hdb
  1 PV(s) found for VG vg: expected 2
  Physical volume "/dev/hda3" of volume group "vg" is exported
  --- Physical volume ---
  PV Name               /dev/hda3
  VG Name               vg (exported)
  PV Size               37.98 GB / not usable 43.73 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              1214
  Free PE               0
  Allocated PE          1214
  PV UUID               E2IXqI-x6Dr-NIBk-EnhJ-UZt8-gcTn-n0YCoG

 titan:~# lvm pvdisplay /dev/hdb
  Physical volume "/dev/hdb" of volume group "vg" is exported
  --- Physical volume ---
  PV Name               /dev/hdb
  VG Name               vg (exported)
  PV Size               111.79 GB / not usable 41.46 MB
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              3576
  Free PE               528
  Allocated PE          3048
  PV UUID               r5BNbe-7xyz-SS53-89Vw-cHf0-wkGM-uChV9B



titan:~# pvdisplay /dev/hda3
--- Physical volume ---
PV Name               /dev/ide/host0/bus0/target0/lun0/part3
VG Name               vg
PV Size               37.98 GB [79650270 secs] / NOT usable 32.19 MB 
[LVM: 132 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                9
PE Size (KByte)       32768
Total PE              1214
Free PE               0
Allocated PE          1214
PV UUID               E2IXqI-x6Dr-NIBk-EnhJ-UZt8-gcTn-n0YCoG


titan:~# pvdisplay /dev/hdb
--- Physical volume ---
PV Name               /dev/ide/host0/bus0/target1/lun0/disc
VG Name               vg
PV Size               111.79 GB [234441648 secs] / NOT usable 32.19 MB 
[LVM: 137 KB]
PV#                   2
PV Status             NOT available
Allocatable           yes
Cur LV                1
PE Size (KByte)       32768
Total PE              3576
Free PE               528
Allocated PE          3048
PV UUID               r5BNbe-7xyz-SS53-89Vw-cHf0-wkGM-uChV9B




titan:~# pvdata /dev/hda3
--- Physical volume ---
PV Name               /dev/hda3
VG Name               vg
PV Size               37.98 GB [79650270 secs] / NOT usable 32.19 MB 
[LVM: 132 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                9
PE Size (KByte)       32768
Total PE              1214
Free PE               0
Allocated PE          1214
PV UUID               E2IXqI-x6Dr-NIBk-EnhJ-UZt8-gcTn-n0YCoG

--- Volume group ---
VG Name              
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                9
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                2
Act PV                2
VG Size               149.66 GB
PE Size               32 MB
Total PE              4789
Alloc PE / Size       1214 / 37.94 GB
Free  PE / Size       3575 / 111.72 GB
VG UUID               IqNxPQ-yO6B-d3qf-xZ6d-hFYD-fXNq-98dYNQ

--- List of logical volumes ---

pvdata -- logical volume "/dev/vg/root" at offset   0
pvdata -- logical volume "/dev/vg/var" at offset   1
pvdata -- logical volume "/dev/vg/home" at offset   2
pvdata -- logical volume "/dev/vg/usr" at offset   3
pvdata -- logical volume "/dev/vg/bigpart" at offset   4
pvdata -- logical volume "/dev/vg/swap" at offset   5
pvdata -- logical volume "/dev/vg/opt" at offset   6
pvdata -- logical volume "/dev/vg/tmp" at offset   7
pvdata -- logical volume "/dev/vg/hugepart" at offset   8
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

001: E2IXqI-x6Dr-NIBk-EnhJ-UZt8-gcTn-n0YCoG
002: n18rEv-LuND-tKv3-Vlxr-A6YD-MpG1-DWHW6M

titan:~# pvdata /dev/hdb
--- Physical volume ---
PV Name               /dev/hdb
VG Name               vg
PV Size               111.79 GB [234441648 secs] / NOT usable 32.19 MB 
[LVM: 137 KB]
PV#                   2
PV Status             NOT available
Allocatable           yes
Cur LV                1
PE Size (KByte)       32768
Total PE              3576
Free PE               528
Allocated PE          3048
PV UUID               r5BNbe-7xyz-SS53-89Vw-cHf0-wkGM-uChV9B

--- Volume group ---
VG Name              
VG Access             read/write
VG Status             NOT available/resizable
VG #                  1
MAX LV                256
Cur LV                9
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                2
Act PV                1
VG Size               149.69 GB
PE Size               32 MB
Total PE              4790
Alloc PE / Size       4015 / 125.47 GB
Free  PE / Size       775 / 24.22 GB
VG UUID               IqNxPQ-yO6B-d3qf-xZ6d-hFYD-fXNq-98dYNQ

--- List of logical volumes ---

pvdata -- logical volume struct at offset   0 is empty
pvdata -- logical volume struct at offset   1 is empty
pvdata -- logical volume "/dev/titan/hugepart" at offset   2
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

001: E2IXqI-x6Dr-NIBk-EnhJ-UZt8-gcTn-n0YCoG
002: r5BNbe-7xyz-SS53-89Vw-cHf0-wkGM-uChV9B
