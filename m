Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k59IqNqf024903
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 14:52:23 -0400
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k59IqGw5001175
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 14:52:16 -0400
Received: from wolverine (unknown [192.168.1.71])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id 08F2C12EDD
	for <linux-lvm@redhat.com>; Fri,  9 Jun 2006 19:52:11 +0100 (BST)
From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: [linux-lvm] Problem creating snapshots with 2.6.16.9 and
	LVM2.02.06
Date: Fri, 9 Jun 2006 19:51:58 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20060609145645.GC7606@agk.surrey.redhat.com>
Message-Id: <20060609185211.08F2C12EDD@bluewhale.planbit.co.uk>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi Alasdair,

Thanks for the quick response.

I killed the uDev process that was running and retried it.  The snapshot was
created without any problems.  It looks like this is another example of the
interaction of uDev and LVM.

I followed the Debian bug reference that you gave.  The change in
/etc/udev.rules that was recommended works for me too:

Failing line:
	KERNEL=="dm-[0-9]*",           NAME=""

Working line:
	KERNEL=="dm-[0-9]*",           OPTIONS+="ignore_device"

This seems to keep uDev out of LVM's way, and LVM now works fine.

There seemed to a bit of discussion on the Debian bug tracker regarding
exactly where the problem is, so if there are any logs you would like or
similar then let me know.

Thanks and best regards,

Roger


> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Alasdair G Kergon
> Sent: 09 June 2006 15:57
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Problem creating snapshots with 2.6.16.9 and
> LVM2.02.06
> 
> > > Wombat:~# lvcreate -L10G -n snapdisk -s /dev/clientstore/userdisk
> > >   LV clientstore/snapdisk in use: not deactivating
> > >   Couldn't deactivate new snapshot.
> 
> Could be interaction (not yet understood) with udev - try disabling udev
> while
> running the command.
> 
> (Ref debian bug 343671)
> 
> Alasdair
> --
> agk@redhat.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
