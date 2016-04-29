Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3T8Dfk6001052
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 04:13:41 -0400
References: <CAPLCSGBydm62eZuqACSfuX9Y7cHPC-GbnHzTRLBsp1hFHvRLbw@mail.gmail.com>
	<5720CDAF.1020604@redhat.com>
	<CAPLCSGAE9T_wWU5+9T0k5X+V6t7ztAguW84pUoh=Nfbir4J4iQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <572317B4.9030309@redhat.com>
Date: Fri, 29 Apr 2016 10:13:40 +0200
MIME-Version: 1.0
In-Reply-To: <CAPLCSGAE9T_wWU5+9T0k5X+V6t7ztAguW84pUoh=Nfbir4J4iQ@mail.gmail.com>
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

On 28.4.2016 16:36, Bhasker C V wrote:
> Zdenek,
>   Thanks. Here I am just filling it up with random data and so I am not
> concerned about data integrity
>   You are right, I did get page lost during write errors in the kernel
>
> The question however is even after reboot and doing several fsck of the ext4fs
> the file size "occupied" is more than the pool size. How is this ?
> I agree that data may be corrupted, but there *is* some data and this must be
> saved somewhere. Why is this "somewhere" exceeding the pool size ?

Hi

Few key principles -


1. You should always mount extX fs with  errors=remount-ro  (tune2fs,mount)

2. There are few data={} modes ensuring various degree of data integrity,
    An case you really care about data integrity here - switch to 'journal'
    mode at price of lower speed. Default ordered mode might show this.
    (i.e. it's the very same behavior as you would have seen with failing hdd)

3. Do not continue using thin-pool when it's full :)

4. We do miss more configurable policies with thin-pools.
    i.e. do plan to instantiate 'error' target for writes in the case
    pool gets full - so ALL writes will be errored - as of now - writes
    to provisioned blocks may cause further filesystem confusion - that's
    why  'remount-ro' is rather mandatory - xfs is recently being enhanced
    to provide similar logic.


Regards


Zdenek
