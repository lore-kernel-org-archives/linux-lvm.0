Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p1NEIuPe028508
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 09:18:56 -0500
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1NEIhLw023193
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 09:18:44 -0500
Message-ID: <4D651735.1000802@abpni.co.uk>
Date: Wed, 23 Feb 2011 14:18:29 +0000
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<1298466573.19562.147.camel@ubuntu>
	<4D65124C.1070505@abpni.co.uk> <1298470564.19562.150.camel@ubuntu>
In-Reply-To: <1298470564.19562.150.camel@ubuntu>
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


On 23/02/11 14:16, Joe Thornber wrote:
> On Wed, 2011-02-23 at 13:57 +0000, Jonathan Tripathy wrote:
>
>> The snapshot will be done in the Xen host, so the Xen host will see the
>> snapshot. The VM will only see the "normal" LV (and continue to use it
>> as normal). My concern is what happens when I remove the snapshot and
>> later on I create a new additional LV for a new customer.
> When you remove the snapshot the exception store will have bits of the
> origin device on it.  Zero it before you use the space to provision a
> volume for a new customer.
>
> - Joe
>
>
And how do I zero just exception store?

Thanks
