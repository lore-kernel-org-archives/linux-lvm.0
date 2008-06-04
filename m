Received: from engineering.redhat.com (engineering.redhat.com [10.10.36.82])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m54AuHPn028266
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 06:56:17 -0400
Received: from engineering.redhat.com (localhost.localdomain [127.0.0.1])
	by engineering.redhat.com (8.13.1/8.13.1) with ESMTP id m54AuHWZ004305
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 06:56:17 -0400
Received: from localhost (mpatocka@localhost)
	by engineering.redhat.com (8.13.1/8.13.1/Submit) with ESMTP id
	m54AuGRk004300
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 06:56:16 -0400
Date: Wed, 4 Jun 2008 06:56:16 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [linux-lvm] ANNOUNCE: an experimental implementation of snapshot
	merging
In-Reply-To: <1212525819.19122.16.camel@behemoth.csg.stercomm.com>
Message-ID: <Pine.LNX.4.64.0806040651320.2902@engineering.redhat.com>
References: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
	<1212525819.19122.16.camel@behemoth.csg.stercomm.com>
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

On Tue, 3 Jun 2008, Chris Cox wrote:

> On Tue, 2008-06-03 at 15:26 -0400, Mikulas Patocka wrote:
>> Hi
>>
>> Here I release the first experimental implementation of snapshot merging.
>> Merging allows you to copy data in snapshot back to the origin device.
>> Once merging starts, it runs on background. When the merging finishes (you
>> see "0%" with "lvs" command), you should remove the merging snapshot with
>> lvremove command.
>
> I would think this would be VERY hard to do since both the "origin" and
> "snapshot" change (file deletes, etc).  Do you have a set of rules you
> use for the merge?

The rule is: "origin must not be mounted when you start merging". 
Currently it is not enforced by the lvm tool (you damage your filesystem, 
if you merge over a mounted filesystem), in final version, there will be a 
test to refuse merging in this case.

If you merge a snapshot, you are going to lose the data in the origin. If 
you don't want to lose them, create another snapshot before you start 
merging (then, the new snapshot will contain the data in the origin).

Another rule is: while merging is in progress, don't create other 
snapshots --- well, you can, but they will contain inconsistent midstate. 
Snapshots that were created before the merging started will be preserved 
OK.

Mikulas
