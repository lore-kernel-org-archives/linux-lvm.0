References: <a446fda9-d3c5-a184-8466-d63ae39f541c@redhat.com>
	<F484D1CA-73F2-49EE-9EE1-1902F322A591@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <4081c11e-d2b0-ebfa-d1a0-92a4efc79e81@redhat.com>
Date: Mon, 7 Sep 2020 18:42:08 +0200
MIME-Version: 1.0
In-Reply-To: <F484D1CA-73F2-49EE-9EE1-1902F322A591@gmail.com>
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

Dne 07. 09. 20 v 18:34 Tomas Dalebjörk napsal(a):
> thanks for feedback
> 
> so if I understand this correctly
> # fallocate -l 100M /tmp/pv1
> # fallocate -l 100M /tmp/pv2
> # fallocate -l 100M /tmp/pv3
> 
> # losetup —find —show /tmp/pv1
> # losetup —find —show /tmp/pv2
> # losetup —find —show /tmp/pv3
> 
> # vgcreate vg0 /dev/loop0
> # lvcreate -n lv0 -l 1 vg0
> # vgextend vg0 /dev/loop1
> # lvcreate -s -l 1 -n lvsnap /dev/loop1
> # vgchange -a n vg0
> 
> # lvconvert —splitsnapshot vg0/lvsnap
> 
> # vgreduce vg0 /dev/loop1


Hi

Here you would need to use 'vgsplit' rather - otherwise you
loose the mapping for whatever was living on /dev/loop1

> 
> # vgcreate vg1 /dev/loop2
> # lvcreate -n lv0 -l 1 vg1
> # vgextend vg1 /dev/loop1

And  'vgmerge'


> # lvconvert -s vg1/lvsnap vg1/lv0
> 
> not sure if the steps are correct?
> 


I hope you realize the content of vg1/lv0 must be exactly same
as vg0/lv0.

As snapshot COW volume contains only 'diff chunks' - so if you
would attach snapshot to 'different' lv - you would get only mess.


Zdenek
