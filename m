Received: from [10.40.200.19] (ovpn-200-19.brq.redhat.com [10.40.200.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43EnkJU023479
	for <linux-lvm@redhat.com>; Tue, 3 May 2016 10:49:47 -0400
References: <CAPLCSGBydm62eZuqACSfuX9Y7cHPC-GbnHzTRLBsp1hFHvRLbw@mail.gmail.com>
	<5720CDAF.1020604@redhat.com>
	<CAPLCSGAE9T_wWU5+9T0k5X+V6t7ztAguW84pUoh=Nfbir4J4iQ@mail.gmail.com>
	<572317B4.9030309@redhat.com>
	<CAPLCSGAma7ixsFmWHmuiJ4d426yBf+hunWCN+htijHmQnWCmOw@mail.gmail.com>
	<57287570.5090509@redhat.com>
	<CAPLCSGBXKXZLthYSFGUkG+kGO=8aUXh8SS4wh+6Ynj8A7xfh2w@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5728BA8A.3040009@redhat.com>
Date: Tue, 3 May 2016 16:49:46 +0200
MIME-Version: 1.0
In-Reply-To: <CAPLCSGBXKXZLthYSFGUkG+kGO=8aUXh8SS4wh+6Ynj8A7xfh2w@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Lvm think provisioning query
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 3.5.2016 14:21, Bhasker C V wrote:
> Here are the answers to your questions
>
> 1. fsck does not report any error and the file contained inside the FS is
> definitely greater than the allocatable LV size
> # fsck.ext4 -f -C0 /dev/virtp/vol01
> e2fsck 1.43-WIP (15-Mar-2016)
> Pass 1: Checking inodes, blocks, and sizes
> Pass 2: Checking directory structure
> Pass 3: Checking directory connectivity
> Pass 4: Checking reference counts
> Pass 5: Checking group summary information
> /dev/virtp/vol01: 12/65536 files (8.3% non-contiguous), 30492/262144 blocks
>
> 2. Size of the file
>
> # du -hs fil
> 69M     fil
>
> (please note here that the LV virtual size is 1G but the parent pool size is
> just 40M I expect the file not to exceed 40M at any cost.)
>
> 3. lvs
> # lvs
>    LV       VG    Attr       LSize  Pool     Origin Data%  Meta%  Move Log
> Cpy%Sync Convert
>    virtpool virtp twi-aotzD- 40.00m                 100.00 1.37
>    vol01    virtp Vwi-aotz--  1.00g virtpool
>
>
> You can do this on any virtual machine. I use qemu with virtio back-end.

But this is VERY different case.

You filesystem IS 1GB in size and ext4 provisions mostly all 'metadatata' 
during first mount.

So thin-pool has usually all filesystem's metadata space 'available' for 
updating and if you use  mount option data=ordered  (being default) - it 
happens that 'write' to provisioned space is OK, while write to 'data' space
gets async page lost.

And this all depends how are you willing to write your data.

Basically if you use page-cache and ignore  'fdatasync()'  you NEVER know what 
has been stored in disk (living in a dreamworld basically)
(i.e. close of your program/file descriptor  DOES NOT flush)

When thin-pool gets full and you have not managed to resize your data LV 
in-time various thing may go wrong - this is a fuzzy tricky land.

Now few people (me included) believe  thin volume should error 'ANY' further 
write when there was an overprovisioning error on a device and I'm afraid this 
can't be solved elsewhere then in target driver.
ATM this thin volume puts filesystem into very complex situation which does 
not have 'winning' scenario in number of cases - so we need to define number 
of policies.

BUT ATM we clearly communicate - when you run OUT of thin-pool space
it's serious ADMIN failure - and we could only try to lower damage.

Thin-pool overfull CANNOT be compared to writing to a full filesystem
and there is absolutely no guarantee about content of non-flushed files!

Expecting you run out-of-space in thin-pool and nothing bad can happens is 
naive ATM - we are cooperating at least with XFS/ext4 developers to solve some 
corner case, but there is still a lot of work to do as we exercise quite 
unusual error paths for them.


Zdenek
