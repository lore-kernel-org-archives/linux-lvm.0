Received: from [10.34.131.133] (dhcp131-133.brq.redhat.com [10.34.131.133])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1A8XLd1001472
	for <linux-lvm@redhat.com>; Mon, 10 Feb 2014 03:33:22 -0500
Message-ID: <52F88ED0.8030201@redhat.com>
Date: Mon, 10 Feb 2014 09:33:20 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <20140123142700.315e2d3f@leda.localdomain>	<20140204095544.65cad0f2@leda.localdomain>	<52F1198B.8000706@redhat.com>	<20140207141420.54239977@leda.localdomain>	<20140208003607.503a44c9@leda.localdomain>
	<20140208005550.6b7e134d@leda.localdomain>
In-Reply-To: <20140208005550.6b7e134d@leda.localdomain>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] blkid_wiping breaks snapshots
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
To: linux-lvm@redhat.com

Dne 8.2.2014 00:55, Christian Hesse napsal(a):
> Christian Hesse <list@eworm.de> on Sat, 2014/02/08 00:36:
>> Hello everybody,
>>
>> I think I nailed it down with git bisect. My first bad commit is:
>>
>> 75628f341ad38b68aae33eae0b5700be2a6e5769
>> configure: enable blkid_wiping by default if the blkid library is present
>>
>> Looks like this wipes data that is still needed... Building a package with
>> '--disable-blkid_wipe' now to verify on another system.
>
> Uh, this only helps part of...
>
> I changed my test setup and used writable snapshots. After that I got:
>
> WARNING: DM_snapshot_cow signature detected on /dev/cvg/snap-home at
> offset 0. Wipe it? [y/n]
>
> (see https://bbs.archlinux.org/viewtopic.php?id=176504 for another report)
>
> Looks like disabling blkid_wiping fixes this. My snapshot corruption still
> occurs though. :-/
> Bad thing about it is that the corruption does not occur reliable when doing
> simple tests in 'git bisect'... Out of ideas for now - Will go to bed now.

Now this was helpful, I guess I think what is going on.

Zdenek
