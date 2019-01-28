References: <ba63b761-d169-a290-3cd9-c6d61f4d5514@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <d5a5f70a-8313-3b37-c84f-29e080d5df53@redhat.com>
Date: Mon, 28 Jan 2019 11:01:57 +0100
MIME-Version: 1.0
In-Reply-To: <ba63b761-d169-a290-3cd9-c6d61f4d5514@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Option devices/dir different from /dev does not work
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Andrei Borzenkov <arvidjaar@gmail.com>

Dne 26. 01. 19 v 22:14 Andrei Borzenkov napsal(a):
> I attempt to put device nodes for volumes in sub-directory of /dev to
> avoid accidental conflict between device name and volume group and
> general /dev pollution. VxVM always did it, using /dev/vx as base
> directory, so I would use something like /dev/lvm.

That is a very HARD task you want to achieve - I'd probably better advice you 
to avoid doing this.

First - please start out with reasoning.

1.
Normally it really DOES NOT matter where device node is - it's in /dev and you 
can create as my subdirs there - it will not help anything - as any app can 
still find the node be there.

2.
You CANNOT change where /dev/dm-XXX node will appear - it's made by kernel 
just one any DM device is created. Udev ONLY controls it's symlink.

3.
With LVM - we advice users to use  /dev/vg/lv  links - although you will find 
out there are way more of them in your /dev  pointing to final /dev/dm node - 
so you SHOULD be using these symlinks for passing devices to VxVM.

4.
If all your work is because you want to avoid LVM commands to access device
you've created and passed to your VMs - you have number of way  easier 
solutions - personally I'd recommend to use FILTERS (in lvm.conf). Just 
'accept' devices which are possible PVs for your hosting machine (be it 
/dev/sd* or whatever else you have) and reject any other device from scanning 
- this will greatly improve performance, avoids various scanning troubles and 
also makes your VMs completely separated.

In the upstream (unstable git HEAD) we have something named 'scan_lvs' in 
lvm.conf  - where you can globally disable scanning of any activated LV  (DM 
device with LVM- UUID prefix) - but it's also not a perfect solution in case 
you would need to use same actived devices locally and some others not.


Regards

Zdenek
