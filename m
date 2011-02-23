Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1NDw0Yq026010
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 08:58:00 -0500
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NDvlsU016690
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 08:57:48 -0500
Message-ID: <4D65124C.1070505@abpni.co.uk>
Date: Wed, 23 Feb 2011 13:57:32 +0000
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk> <1298466573.19562.147.camel@ubuntu>
In-Reply-To: <1298466573.19562.147.camel@ubuntu>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots and disk re-use
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


On 23/02/11 13:09, Joe Thornber wrote:
> On Wed, 2011-02-23 at 12:36 +0000, Jonathan Tripathy wrote:
>> Hi Everyone,
>>
>> We host many Xen VMs for customers. We use LVM as the fisk storage for
>> these VMs. When a customer cancels, we generally dd their LV with
>> /dev/zero, before removing the LV.
>>
>> If however we want to create a snapshot of a customer's LV, is there the
>> chance that the data may appear on a new future LV if we were to create
>> one (for a new customer)? Is is my understanding that most filesystems
>> don't actually remove data from a disk when deleting a file, but just
>> set an "ignore" tag of some sort...
> I'm a bit confused about your scenario.  But I think this will help:
>
> The snapshot device is composed of 2 sub devices, the origin and the
> exception store.  Someone who only has visibility of the snapshot (ie.
> your vm if your scenario is what I think it is) will have visibility of
> all of the origin.  So you _do_ need to worry about data leaks on the
> origin device.  Their view of the exception store is always a subset
> which has been overwritten by origin data first.  So data leaks are not
> an issue for the exception store.
>
> - Joe
>
Sorry Joe, I think I wrote my scenario in a confusing way.

The snapshot will be done in the Xen host, so the Xen host will see the 
snapshot. The VM will only see the "normal" LV (and continue to use it 
as normal). My concern is what happens when I remove the snapshot and 
later on I create a new additional LV for a new customer.

Please understand where my confusion lies. My current procedure for 
adding and removing customers is as follows:

When a customer leaves, zero their LV, then remove it
When a customer joins, create a new LV

I'm just not sure where "snapshots" fit into my above procedure

Thanks
