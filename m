Return-Path: <piete.brooks@cl.cam.ac.uk>
Subject: Re: [linux-lvm] LVM on top of Software Raid 
In-reply-to: Your message of Mon, 26 Mar 2001 08:29:11 +0200.
             <sabefed6.028@MS106BN> 
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Mar 2001 07:41:10 +0100
From: Piete Brooks <Piete.Brooks@cl.cam.ac.uk>
Message-Id: <E14hQgh-0003WD-00@whittlesey.cl.cam.ac.uk>
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
Cc: Piete.Brooks@cl.cam.ac.uk

> Is it possible to use multiple devices as physical volumes?

Yes.

haverhill:~: sed 's/        / /' < /proc/lvm/global
LVM driver version 0.9.1_beta4 (09/02/2001)

Total:  6 VGs  14 PVs  13 LVs (13 LVs open 13 times)

Global: 151053 bytes malloced   IOP version: 10   2 days 20:57:47 active

VG:  vg01  [3 PV, 3 LV/3 open]  PE Size: 4096 KB
  Usage [KB/PE]: 3145728 /768 total  2527232 /617 used  618496 /151 free
  PVs: [AA] md8             1048576 /256       741376 /181       307200 /=
75    =

       [AA] md7             1048576 /256       737280 /180       311296 /=
76    =

       [AA] md6             1048576 /256      1048576 /256            0 /=
0     =

    LVs: [AWDL  ] repl                 409600 /100      1x open
  [AWDL  ] scratch                    2015232 /492      1x open
  [AWDL  ] tmp                         102400 /25       1x open

VG:  vg02  [1 PV, 2 LV/2 open]  PE Size: 4096 KB
  Usage [KB/PE]: 3997696 /976 total  3354624 /819 used  643072 /157 free
  PV:  [AA] md81            3997696 /976      3354624 /819       643072 /=
157   =

    LVs: [AWDL  ] grp3                2199552 /537      1x open
  [AWDL  ] ligrp8                     1155072 /282      1x open

VG:  vg06  [4 PV, 2 LV/2 open]  PE Size: 4096 KB
  Usage [KB/PE]: 15990784 /3904 total  15691776 /3831 used  299008 /73 fr=
ee
  PVs: [AA] md82            3997696 /976      3997696 /976            0 /=
0     =

       [AA] md83            3997696 /976      3997696 /976            0 /=
0     =

       [AA] md85            3997696 /976      3997696 /976            0 /=
0     =

       [AA] md86            3997696 /976      3698688 /903       299008 /=
73    =

    LVs: [AWDL  ] bigdisc            15167488 /3703     1x open
  [AWDL  ] bigtmp                      524288 /128      1x open

VG:  vg04  [1 PV, 1 LV/1 open]  PE Size: 4096 KB
  Usage [KB/PE]: 3997696 /976 total  3080192 /752 used  917504 /224 free
  PV:  [AA] md101           3997696 /976      3080192 /752       917504 /=
224   =

    LV:  [AWDL  ] var-log             3080192 /752      1x open

VG:  vg08  [1 PV, 1 LV/1 open]  PE Size: 4096 KB
  Usage [KB/PE]: 3997696 /976 total  1048576 /256 used  2949120 /720 free=

  PV:  [AA] md102           3997696 /976      1048576 /256      2949120 /=
720   =

    LV:  [AWDL  ] ligrp9              1048576 /256      1x open

VG:  vg10  [4 PV, 4 LV/4 open]  PE Size: 4096 KB
  Usage [KB/PE]: 15990784 /3904 total  5410816 /1321 used  10579968 /2583=
 free
  PVs: [AA] md103           3997696 /976      2265088 /553      1732608 /=
423   =

       [AA] md105           3997696 /976      3145728 /768       851968 /=
208   =

       [AA] md106           3997696 /976            0 /0        3997696 /=
976   =

       [AA] md107           3997696 /976            0 /0        3997696 /=
976   =

    LVs: [AWDL  ] grp2                1048576 /256      1x open
  [AWDL  ] grp11                       446464 /109      1x open
  [AWDL  ] grp16                       770048 /188      1x open
  [AWDL  ] grp17                      3145728 /768      1x open
haverhill:~: =


> The problem here seems to be related to the "partition ID" of the multi=
ple
> devices. If it is possible, how do I do it?

As I understand it, the check is
	partition ID is not anything other than 0x8e
meaning that `partition has no ID' is OK.
