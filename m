Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7JLRjv6005970
	for <linux-lvm@redhat.com>; Thu, 19 Aug 2010 17:27:45 -0400
Received: from mckesson.com (mail6.mckesson.com [143.112.68.15])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7JLRYTt014807
	for <linux-lvm@redhat.com>; Thu, 19 Aug 2010 17:27:35 -0400
From: "Allen, Jack" <Jack.Allen@mckesson.com>
Content-class: Produced By Microsoft Exchange V6.5
In-Reply-To: Produced By Microsoft Exchange V6.5
References: Produced By Microsoft Exchange V6.5
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 19 Aug 2010 17:27:01 -0400
Message-ID: <230ED15F81AFD3409345FFA4E565F0E50CF8FEC7@NDHV3000.na.corp.mckesson.com>
In-Reply-To: <AANLkTi=MgpgoE13eCRxmUOyJ_PR7Nfk4ebuL8YehYeOE@mail.gmail.com>
References: <4c6aee11.60d9.abeffb90.3576b179@olemiss.edu><4C6BA754.9070301@redhat.com>
	<AANLkTi=MgpgoE13eCRxmUOyJ_PR7Nfk4ebuL8YehYeOE@mail.gmail.com>
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of brem belguebli
Sent: Wednesday, August 18, 2010 7:01 AM
To: LVM general discussion and development
Subject: Re: [linux-lvm] linux-lvm Digest, Vol 78, Issue 4

Hi

2010/8/18 Bryn M. Reeves <bmr@redhat.com>:
> On 08/17/2010 09:16 PM, Daksh Chauhan wrote:
>>> A little history and why I am asking the question in this list.
>>> The customer needed to move from an existing SAN to a new SAN and
wanted
>>> as little as possible down time for the Application. So they zoned
the
>>> new SAN for access by the system and then added the new LUNs to the
>>> existing Volume Group. Then ran the pvmove commands. It worked with
no
>>> problem on one of the PVs, but on the second one all the I/O hung at
the
>>> Application and any commands that access the LVM information such as
>>> vgdisplay.
>>
>> Why not use LVM mirroring? Checkout lvconvert...
>
> Wrong tool for the job. There's currently no way to "split" an LVM2
> mirror leaving two usable devices (without resorting to manual edits
of
> the metadata anyway).
>
Tricky but could work :
1) Add the target PV to the VG
2) lvconvert your linear LV to mirrored (each miror leg on each PV)
once synchronization is done
3) lvconvert the mirored LV to linear by removing the old PV (if
lvconvert allows you to do so).

> Using pvmove is the right way to approach this problem with the
current
> tools and since it's going to be using the same kernel infrastructure
to
> shovel the data around there's no guarantee the user won't run into
the
> same kind of problem.
>
> Regards,
> Bryn.

============
I am not sure who suggested using the lvconvert command, but just
completed trying it. It works without hanging, but it does impact the
performance of the Application because of the I/O to synchronize the new
mirror. It seem the synchronizing has a higher priority than all the
other I/O.

Is there any way to control the synchronizing to limit the impact to the
Application?

I have looked for options to the lvconvert command and did not find
anything that.

I guess I could try the nice command to see if it affects it at all.

Any help with this would be greatly appreciated.

-----
Jack Allen
