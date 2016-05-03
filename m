Received: from [10.34.131.216] (dhcp131-216.brq.redhat.com [10.34.131.216])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u439suuH017714
	for <linux-lvm@redhat.com>; Tue, 3 May 2016 05:54:56 -0400
References: <CAPLCSGBydm62eZuqACSfuX9Y7cHPC-GbnHzTRLBsp1hFHvRLbw@mail.gmail.com>
	<5720CDAF.1020604@redhat.com>
	<CAPLCSGAE9T_wWU5+9T0k5X+V6t7ztAguW84pUoh=Nfbir4J4iQ@mail.gmail.com>
	<572317B4.9030309@redhat.com>
	<CAPLCSGAma7ixsFmWHmuiJ4d426yBf+hunWCN+htijHmQnWCmOw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <57287570.5090509@redhat.com>
Date: Tue, 3 May 2016 11:54:56 +0200
MIME-Version: 1.0
In-Reply-To: <CAPLCSGAma7ixsFmWHmuiJ4d426yBf+hunWCN+htijHmQnWCmOw@mail.gmail.com>
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

On 3.5.2016 08:59, Bhasker C V wrote:
> Does this mean the ext4 is showing wrong information. The file is reported
> being 90+MB but in actuality the size is less in the FS ?
> This is quite ok because it is just that file system being affected. I was
> however concerned that the file in this FS might have overwritten other LV
> data since the file is showing bigger than the volume size.
>

I've no idea what 'ext4' is showing you, but if you have i.e. 100M filesystem 
size, you could still have there e.g. 1TB file. Experience the magic:

'truncate -s 1T myfirst1TBfile'

As you can see 'ext4' is doing it's own over-provisioning with 'hole' files.
The only important bits are:
- is the filesystem consistent ?
- is 'fsck' not reporting any error ?

What's the 'real' size you get with 'du  myfirst1TBfile' or your wrong file ?

Somehow I don't believe you can get  i.e.  90+MB 'du' size with 10MB 
filesystem size and 'fsck' would not report any problem.

> I will try this using BTRFS.

For what exactly ??

Regard

Zdenek




>
>
> On Fri, Apr 29, 2016 at 10:13 AM, Zdenek Kabelac <zkabelac@redhat.com
> <mailto:zkabelac@redhat.com>> wrote:
>
>     On 28.4.2016 16:36, Bhasker C V wrote:
>
>         Zdenek,
>            Thanks. Here I am just filling it up with random data and so I am not
>         concerned about data integrity
>            You are right, I did get page lost during write errors in the kernel
>
>         The question however is even after reboot and doing several fsck of
>         the ext4fs
>         the file size "occupied" is more than the pool size. How is this ?
>         I agree that data may be corrupted, but there *is* some data and this
>         must be
>         saved somewhere. Why is this "somewhere" exceeding the pool size ?
>
>
>     Hi
>
>     Few key principles -
>
>
>     1. You should always mount extX fs with  errors=remount-ro  (tune2fs,mount)
>
>     2. There are few data={} modes ensuring various degree of data integrity,
>         An case you really care about data integrity here - switch to 'journal'
>         mode at price of lower speed. Default ordered mode might show this.
>         (i.e. it's the very same behavior as you would have seen with failing hdd)
>
>     3. Do not continue using thin-pool when it's full :)
>
>     4. We do miss more configurable policies with thin-pools.
>         i.e. do plan to instantiate 'error' target for writes in the case
>         pool gets full - so ALL writes will be errored - as of now - writes
>         to provisioned blocks may cause further filesystem confusion - that's
>         why  'remount-ro' is rather mandatory - xfs is recently being enhanced
>         to provide similar logic.
>
>
>
>     Regards
>
>
>     Zdenek
>
>     _______________________________________________
>     linux-lvm mailing list
>     linux-lvm@redhat.com <mailto:linux-lvm@redhat.com>
>     https://www.redhat.com/mailman/listinfo/linux-lvm
>     read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
