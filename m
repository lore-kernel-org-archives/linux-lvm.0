References: <CAEmTpZEikmudjzJPadhreVxXBq9Lsa8bMkD20B0i1u-fMPks6Q@mail.gmail.com>
	<569F78FA.4050104@redhat.com> <569F854C.5070404@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <569F879B.8070401@redhat.com>
Date: Wed, 20 Jan 2016 14:11:55 +0100
MIME-Version: 1.0
In-Reply-To: <569F854C.5070404@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM and chain of snapshots
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
To: "Alexander E. Patrakov" <patrakov@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>, =?UTF-8?B?0JPQtdC+0YDQs9C40Lkg0JHQsNC20YPQutC+0LI=?= <g.bazhukov@ideco.ru>

Dne 20.1.2016 v 14:02 Alexander E. Patrakov napsal(a):
> 20.01.2016 17:09, Zdenek Kabelac wrote:
>> Using lots of old-snaphosts is very bad plan - really time to look at
>> thin-provisioning....
>> Old-snaps are not going to scale.....
>
> Well, I have already tried using lots of thin snapshots on my PC, in a context
> different from what Mark wants. Namely, my snapshots were created by Snapper,
> hourly.
>
> Thin snapshots may indeed scale well for reads and writes, but currently they
> don't scale at all for the initial activation. The problem is that "vgchange
> -ay" and "vgchange -an", by default, run "thin_check", and the more snapshots
> I have, the more it takes for "thin_check" to finish. With 1 snapshot, it is
> quick enough so that I don't notice. But with, say, 200 snapshots (some of
> which include creation of an iso image), it takes more than 1.5 minutes - more
> than the initramfs (or myself) is going to wait during the boot process.

Well the execution of thin_check is 'rather' security feature.
It's been added to capture possible errors of kernel driver.
I guess now we are possibly in the age where deep checking might no longer be 
necessary.

So if you feel the time spend on thin_checking doesn't pay-off - you can try 
to add option   '--skip-mappings'  (see lvm.conf field  global/thin_check_options)

Also  you really should not keep 200 snapshots if you don't need them.
So probably try to maintain your snapshots better (drop unneeded ones...)

And final note - I do not believe activation of multi-gigabyte old-snapshot is 
going to give you any better results - since reading of old metadata is 
actually much slower then management of thin-pool & thin_check - just try it....

It's fairly naive to expect old-snaps will do any better job when we are 
talking about 200 snaps.

Also there is no support for snaps of snaps of snaps with old-snapshot,
so it's not even comparable....

Regards

Zdenek
