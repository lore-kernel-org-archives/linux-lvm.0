Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7IB0ntf004621
	for <linux-lvm@redhat.com>; Wed, 18 Aug 2010 07:00:49 -0400
Received: from mail-vw0-f46.google.com (mail-vw0-f46.google.com
	[209.85.212.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7IB0eSE029641
	for <linux-lvm@redhat.com>; Wed, 18 Aug 2010 07:00:40 -0400
Received: by vws3 with SMTP id 3so482145vws.33
	for <linux-lvm@redhat.com>; Wed, 18 Aug 2010 04:00:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4C6BA754.9070301@redhat.com>
References: <4c6aee11.60d9.abeffb90.3576b179@olemiss.edu>
	<4C6BA754.9070301@redhat.com>
Date: Wed, 18 Aug 2010 13:00:39 +0200
Message-ID: <AANLkTi=MgpgoE13eCRxmUOyJ_PR7Nfk4ebuL8YehYeOE@mail.gmail.com>
From: brem belguebli <brem.belguebli@gmail.com>
Subject: Re: [linux-lvm] linux-lvm Digest, Vol 78, Issue 4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi

2010/8/18 Bryn M. Reeves <bmr@redhat.com>:
> On 08/17/2010 09:16 PM, Daksh Chauhan wrote:
>>> A little history and why I am asking the question in this list.
>>> The customer needed to move from an existing SAN to a new SAN and wanted
>>> as little as possible down time for the Application. So they zoned the
>>> new SAN for access by the system and then added the new LUNs to the
>>> existing Volume Group. Then ran the pvmove commands. It worked with no
>>> problem on one of the PVs, but on the second one all the I/O hung at the
>>> Application and any commands that access the LVM information such as
>>> vgdisplay.
>>
>> Why not use LVM mirroring? Checkout lvconvert...
>
> Wrong tool for the job. There's currently no way to "split" an LVM2
> mirror leaving two usable devices (without resorting to manual edits of
> the metadata anyway).
>
Tricky but could work :
1) Add the target PV to the VG
2) lvconvert your linear LV to mirrored (each miror leg on each PV)
once synchronization is done
3) lvconvert the mirored LV to linear by removing the old PV (if
lvconvert allows you to do so).

> Using pvmove is the right way to approach this problem with the current
> tools and since it's going to be using the same kernel infrastructure to
> shovel the data around there's no guarantee the user won't run into the
> same kind of problem.
>
> Regards,
> Bryn.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
