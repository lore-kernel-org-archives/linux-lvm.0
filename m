Received: from engineering.redhat.com (engineering.redhat.com [10.10.36.82])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m54BBL9X003891
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 07:11:21 -0400
Received: from engineering.redhat.com (localhost.localdomain [127.0.0.1])
	by engineering.redhat.com (8.13.1/8.13.1) with ESMTP id m54BBKO2007401
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 07:11:20 -0400
Received: from localhost (mpatocka@localhost)
	by engineering.redhat.com (8.13.1/8.13.1/Submit) with ESMTP id
	m54BBK8a007396
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 07:11:20 -0400
Date: Wed, 4 Jun 2008 07:11:20 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [linux-lvm] ANNOUNCE: an experimental implementation of snapshot
	merging
In-Reply-To: <1212548240.29076.215.camel@pc.ilinx>
Message-ID: <Pine.LNX.4.64.0806040707450.2902@engineering.redhat.com>
References: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
	<1212525819.19122.16.camel@behemoth.csg.stercomm.com>
	<1212536286.29076.202.camel@pc.ilinx>
	<1212537926.2724.16.camel@behemoth.csg.stercomm.com>
	<87f94c370806031720ybdc557ax303c03fb8f4e56ff@mail.gmail.com>
	<1212548240.29076.215.camel@pc.ilinx>
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

On Tue, 3 Jun 2008, Brian J. Murrell wrote:

> On Tue, 2008-06-03 at 20:20 -0400, Greg Freemyer wrote:
>> Your making it too complicated.
>>
>> Effectively the snapshot immediately becomes the primary volume
>
> How can that be done?  I thought the snapshot was simply a device which
> upon creation (i.e. before any writes to the origin) is just a series of
> block-by-block pointers to the origin.  As blocks in the origin are
> changed, those blocks are copied down to the snapshot are replace the
> pointer to itself.
>
> So in the case where the origin has had 50% of it's blocks updated, in
> order for the snapshot to become the origin, that 50% which has been
> written down in to the snapshot need to be written back up into the
> origin (along with any blocks which were changed in the snapshot
> directly).  How can the snapshot "immediately" become the primary volume
> if that data migration has to happen?

The requests are transparently re-routed to the merging snapshot.

So, when you start merging, the origin device physically contains the old 
data (that are being overwritten by data from the snapshot), but when you 
make a read or write request to the origin, that request causes look-up in 
the exception table of the merging snapshot and if a match is found, the 
request is remapped to the snapshot.

So the merging snapshot and the origin appear to contain the same data. 
(in the final version, one of them will not appear in the list of logical 
volumes, so that it won't confuse the user --- but this is only userspace 
thing)

Mikulas

> b.
