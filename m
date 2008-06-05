Received: from engineering.redhat.com (engineering.redhat.com [10.10.36.82])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m55F9Cs7010029
	for <linux-lvm@redhat.com>; Thu, 5 Jun 2008 11:09:12 -0400
Received: from engineering.redhat.com (localhost.localdomain [127.0.0.1])
	by engineering.redhat.com (8.13.1/8.13.1) with ESMTP id m55F9CKi021451
	for <linux-lvm@redhat.com>; Thu, 5 Jun 2008 11:09:12 -0400
Received: from localhost (mpatocka@localhost)
	by engineering.redhat.com (8.13.1/8.13.1/Submit) with ESMTP id
	m55F9BZJ021446
	for <linux-lvm@redhat.com>; Thu, 5 Jun 2008 11:09:11 -0400
Date: Thu, 5 Jun 2008 11:09:11 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [linux-lvm] ANNOUNCE: an experimental implementation of snapshot
	merging
In-Reply-To: <1212588457.29076.252.camel@pc.ilinx>
Message-ID: <Pine.LNX.4.64.0806051102370.19487@engineering.redhat.com>
References: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
	<1212525167.29076.191.camel@pc.ilinx>
	<Pine.LNX.4.64.0806040656380.2902@engineering.redhat.com>
	<1212588457.29076.252.camel@pc.ilinx>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>



On Wed, 4 Jun 2008, Brian J. Murrell wrote:

> On Wed, 2008-06-04 at 07:07 -0400, Mikulas Patocka wrote:
>>
>>> A pedantic example would be to create an origin, O1 and then a snapshot
>>> of O1 called S1.  Make a bunch of changes to S1 and then create another
>>> snapshot of O1 called S2 and then block copy from S1 to S2 (presumably,
>>> although I don't know for sure, S2 only contains the same changed blocks
>>> as S1).
>>
>> No, if you block copy over /dev/vg/snapshot device, it will contain all
>> the blocks (regardless if they differ from the origin or not).
>
> So my premise of copying from S1 to S2 and the result that S2 would only
> contain real blocks for what differs to the origin and pointers for
> blocks that don't differ is false?

Yes, it's false.

If you overwrite a snapshot, you always allocate new exceptions of the 
written blocks --- regardless if the blocks differ from the origin or not.

>> There could theoretically be compare function, testing if the write equals
>> to actual data and dropping the write eventually --- but it would be too
>> much coding overhead for too little practical advantage.
>
> For certain use cases I think this would be a great advantage.  Think
> about this:
>
>     1. Create an LV and install a linux distro into it.
>     2. Make a snapshot and customize to the settings for a given
>        configuration (i.e. a group of hosts)
>     3. Now I want to make an (initially) identical (to the snapshot
>        customized in step 2) snapshot for each node in that
>        configuration
>
> Being able to do:
>
> # lvcreate -L5G -n pristine node_group
> [ install linux distro into /dev/node_group/pristine ]
> # lvcreate -s -L$size -n config1_master pristine
> # for node in $nodelist; do
>>     lvcreate -s -L$size -n $node pristine
>>     dd if=/dev/node_group/config1_master of=/dev/node_group/$node
>> done
>
> And have each of those snapshots be as efficient as config1_master.

You can do this if you copy the exception store (i.e. don't copy 
/dev/vg/snap or /dev/mapper/vg-snap --- instead, copy 
/dev/mapper/vg-snap-cow). Copy it to a new linear logical volume and then 
use lvconvert -s to turn it into a snapshot. When you copy 
/dev/mapper/vg-snap-cow, the snapshot and origin must be idle --- 
otherwise you'd be copying data while it's being modified.

Mikulas
