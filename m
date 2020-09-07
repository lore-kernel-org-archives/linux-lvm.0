Date: Mon, 7 Sep 2020 09:09:08 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
In-Reply-To: <0B002628-0740-4DA4-A9BD-320A743A7A30@gmail.com>
Message-ID: <alpine.LRH.2.02.2009070907110.5779@file01.intranet.prod.int.rdu2.redhat.com>
References: <CACrcyfJBtsVFwf8wFjDAc1sOKPiOVBJjKbDC3c+3G-z6v5SCpA@mail.gmail.com>
	<0B002628-0740-4DA4-A9BD-320A743A7A30@gmail.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="185206533-864684669-1599484148=:5779"
Subject: Re: [linux-lvm] exposing snapshot block device
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: =?ISO-8859-15?Q?Tomas_Dalebj=F6rk?= <tomas.dalebjork@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--185206533-864684669-1599484148=:5779
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Fri, 4 Sep 2020, Tomas Dalebjörk wrote:

> hi
> I tried to perform as suggested
> # lvconvert —splitsnapshot vg/lv-snap
> works fine
> # lvconvert -s vg/lv vg/lv-snap
> works fine too
> 
> but...
> if I try to converting cow data directly from the meta device, than it doesn’t work
> eg
> # lvconvert -s vg/lv /dev/mycowdev
> the tool doesn’t like the path
> I tried to place a link in /dev/vg/mycowdev -> /dev/mycowdev
> and retried the operations 
> # lvconveet -s vg/lv /dev/vg/mycowdev
> but this doesn’t work either
> 
> conclusion  even though the cow device is an exact copy of the cow 
> device that I have saved on /dev/mycowdev before the split, it wouldn’t 
> work to use to convert back as a lvm snapshot 
> 
> not sure if I understand the tool correctly, or if there are other 
> things needed to perform, such as creating virtual information about the 
> lvm VGDA data on the first of this virtual volume named /dev/mycowdev 

AFAIK LVM doesn't support taking existing cow device and attaching it to 
an existing volume. When you create a snapshot, you start with am empty 
cow.

Mikulas

> let me know what more steps are needed
> 
> beat regards Tomas
> 
> Sent from my iPhone
> 
>       On 7 Nov 2019, at 18:29, Tomas Dalebjörk <tomas.dalebjork@gmail.com> wrote:
> 
>       ﻿Great, thanks!
> 
> Den tors 7 nov. 2019 kl 17:54 skrev Mikulas Patocka <mpatocka@redhat.com>:
> 
> 
>       On Tue, 5 Nov 2019, Tomas Dalebjörk wrote:
> 
>       > Thanks,
>       >
>       > That really helped me to understand how the snapshot works.
>       > Last question:
>       > - lets say that block 100 which is 1MB in size is in the cow device, and a write happen that wants to something or all data on that region of block
>       100.
>       > Than I assume; based on what have been previously said here, that the block in the cow device will be overwritten with the new changes.
> 
>       Yes, the block in the cow device will be overwritten.
> 
>       Mikulas
> 
>       > Regards Tomas
> 
> 
> 
--185206533-864684669-1599484148=:5779--
