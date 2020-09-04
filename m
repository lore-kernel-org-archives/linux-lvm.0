References: <CACrcyfJBtsVFwf8wFjDAc1sOKPiOVBJjKbDC3c+3G-z6v5SCpA@mail.gmail.com>
	<0B002628-0740-4DA4-A9BD-320A743A7A30@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <06b9d2f9-86eb-4b5d-6198-6608842e0448@redhat.com>
Date: Fri, 4 Sep 2020 14:37:59 +0200
MIME-Version: 1.0
In-Reply-To: <0B002628-0740-4DA4-A9BD-320A743A7A30@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 04. 09. 20 v 14:09 Tomas Dalebjörk napsal(a):
> hi
> 
> I tried to perform as suggested
> # lvconvert —splitsnapshot vg/lv-snap
> works fine
> # lvconvert -s vg/lv vg/lv-snap
> works fine too
> 
> but...
> if I try to converting cow data directly from the meta device, than it doesn’t 
> work
> eg
> # lvconvert -s vg/lv /dev/mycowdev
> the tool doesn’t like the path
> I tried to place a link in /dev/vg/mycowdev -> /dev/mycowdev

Hi

lvm2 does only support 'objects' within VG without any plan to support 
'external' devices.

So user may not take any 'random' device in a system and use it for
commands like lvconvert.

There is always very strict requirement to place block devices as VG member 
first (pvcreate, vgextend...) and then user can allocate space of this device 
for various LVs.

> conclusion
> even though the cow device is an exact copy of the cow device that I have 
> saved on /dev/mycowdev before the split, it wouldn’t work to use to convert 
> back as a lvm snapshot

COW data needs to be simply stored on an LV for use with lvm2.

You may of course use the 'dmsetup' command directly and arrange your
snapshot setup in the way to combine various kinds of devices - but this
is going completely without any lvm2 command involved - in this case
you have to fully manipulate all devices in your device stack with this
dmsetup command.

Regards

Zdenek
