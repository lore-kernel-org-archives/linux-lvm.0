References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<483184bceea4fad4baafef32408015b6@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <b8f49134-dea7-7620-dba7-0123282f0bd8@redhat.com>
Date: Fri, 14 Apr 2017 11:37:37 +0200
MIME-Version: 1.0
In-Reply-To: <483184bceea4fad4baafef32408015b6@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
To: Gionatan Danti <g.danti@assyoma.it>
Cc: Xen <list@xenhideout.nl>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 14.4.2017 v 11:07 Gionatan Danti napsal(a):
> Il 14-04-2017 10:24 Zdenek Kabelac ha scritto:
>>
>> But it's currently impossible to expect you will fill the thin-pool to
>> full capacity and everything will continue to run smoothly - this is
>> not going to happen.
> 
> Even with EXT4 and errors=remount-ro?

While usage of 'remount-ro' may prevent any significant damage of filesystem
as such - since the 1st. problem detected by ext4 stops - it's still not quite 
trivial to proceed easily further.

The problem is not with 'stopping' access - but to gain the access back.

So in this case - you need to run 'fsck' - and this fsck usually needs more 
space - and the complexity starts with - where to get this space.

In the the 'most trivial' case - you have the space in 'VG' - you just extend 
thin-pool and you run 'fsck' and it works.

But then there is number of cases ending with the case that you run out of 
metadata space that has the maximal size of ~16G so you can't even extend it, 
simply because it's unsupported to use any bigger size.

So while every case has some way forward how to proceed - none of them could 
be easily automated.

And it's so much easier to monitor and prevent this to happen compared with 
solving these thing later.

So all is needed is - user is aware what he is using and does proper action 
and proper time.

> 
>>
>> However there are many different solutions for different problems -
>> and with current script execution - user may build his own solution -
>> i.e.  call
>> 'dmsetup remove -f' for running thin volumes - so all instances get
>> 'error' device   when pool is above some threshold setting (just like
>> old 'snapshot' invalidation worked) - this way user will just kill
>> thin volume user task, but will still keep thin-pool usable for easy
>> maintenance.
>>
> 
> Interesting. However, the main problem with libvirt is that its pool/volume 
> management fall apart when used on thin-pools. Basically, libvirt does not 
> understand that a thinpool is a container for thin volumes (ie: 
> https://www.redhat.com/archives/libvirt-users/2014-August/msg00010.html)

Well lvm2 provides the low-level tooling here....

Zdenek
