Received: from [10.40.200.19] (ovpn-200-19.brq.redhat.com [10.40.200.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43FjC9L001121
	for <linux-lvm@redhat.com>; Tue, 3 May 2016 11:45:12 -0400
References: <929635034.3140318.1461840230292.JavaMail.yahoo.ref@mail.yahoo.com>
	<929635034.3140318.1461840230292.JavaMail.yahoo@mail.yahoo.com>
	<445afc4b9ae3fbf477f8f66db9d28580@dds.nl> <57234421.5040902@redhat.com>
	<CALm7yL05s2BrFL=C_r_BEP3jDkUgKWhRFgHSwhYNreEj9AgLNQ@mail.gmail.com>
	<57287A50.5020506@assyoma.it> <57288EB8.9020303@redhat.com>
	<5728A481.6080600@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5728C787.8030406@redhat.com>
Date: Tue, 3 May 2016 17:45:11 +0200
MIME-Version: 1.0
In-Reply-To: <5728A481.6080600@assyoma.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin handling of available space
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

On 3.5.2016 15:15, Gionatan Danti wrote:
> On 03/05/2016 13:42, Zdenek Kabelac wrote:
>>
>> What's wrong with  'lvs'?
>> This will give you the available space in thin-pool.
>>
>
> Oh, absolutely nothing wrong with lvs. I used "lsblk" only as an example of
> the block device/layer exposing some (lack of) features to upper layer.
>
> One note about the continued "suggestion" to use BTRFS. While for relatively

It's not  'continued' suggestion.

It's just the example of solution where   'filesystem & block layer' are tied 
together.  Every solution has some advantages and disadvantages.

> simple use case it can be ok, for more demanding (rewrite-heavy) scenarios
> (eg: hypervisor, database, ecc) it performs *really* bad, even when "nocow" is
> enabled.

So far I'm convinced layered design gives user more freedom - for the price
of bigger space usage.


>
> Anyway, ThinLVM + XFS is an extremely good combo in my opinion.
>

Yes, thought ext4 is quite good as well...

Zdenek
