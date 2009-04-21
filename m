Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3LHOqK8028183
	for <linux-lvm@redhat.com>; Tue, 21 Apr 2009 13:24:52 -0400
Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de
	[141.2.22.233])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3LHOb1l003135
	for <linux-lvm@redhat.com>; Tue, 21 Apr 2009 13:24:37 -0400
Received: from smtpauth.cluster.uni-frankfurt.de ([10.2.22.4]
	helo=smtpauth2.rz.uni-frankfurt.de)
	by mailout.rz.uni-frankfurt.de with esmtp (Exim 4.69)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1LwJi0-0004NO-NR
	for linux-lvm@redhat.com; Tue, 21 Apr 2009 19:24:36 +0200
Received: from ada-03.ghl40.whgl.uni-frankfurt.de ([141.2.119.133])
	by smtpauth2.rz.uni-frankfurt.de with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <sven@whgl.uni-frankfurt.de>)
	id 1LwJhq-0003bH-J6
	for linux-lvm@redhat.com; Tue, 21 Apr 2009 19:24:26 +0200
Message-ID: <49EE0143.5000200@whgl.uni-frankfurt.de>
Date: Tue, 21 Apr 2009 19:24:19 +0200
From: Sven Eschenberg <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Wierd lvm2 performance problems
References: <49EA534C.7090003@whgl.uni-frankfurt.de>	<49EACA64.8070006@redhat.com>	<49EB4045.7020407@whgl.uni-frankfurt.de>	<20090420053949.GA16457@maude.comedia.it>	<98cfe6a3ff352717b0d636c599e39c99.squirrel@ssl.verfeiert.org>
	<20090420134610.GB17461@maude.comedia.it>
In-Reply-To: <20090420134610.GB17461@maude.comedia.it>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Luca,

I gave this a little more thought ...

Luca Berra schrieb:
> On Mon, Apr 20, 2009 at 03:15:12PM +0200, Sven Eschenberg wrote:
>> Hi Luca,
>>
>> Okay, let's assume a chunk size of C. No matter what your md looks like,
>> the logical md volume consists of a series of size/C chunks. the very
>> first chunk C0 will hold the LVM header.
>> If I align the extends with the chunksize and the extends even have the
>> chunksize, then every extens PEx of my PV equals exactly a chunk on 
>> any of
>> the disks.
>> Which in turn means, if I want to read PEx I have to read some chunk 
>> Cy on
>> one disk, and PEx+1 would most certainly be a Chunk Cy+1 which would
>> reside on a different physical disk.
> 
> correct
> 
>> So the question is: Why would you want to align the first PE to the
>> stripesize, rather then the chunksize?
> 
> Because when you _write_ incomplete stripes, the raid code
> would need to do a read-modify-write of the parity block.

Okay, the question is, how often, if you modify files at random, do you 
really write a full stripe, even if the cache holds back all 
modification for a couple minutes. I wonder how often you can take 
advantage of this in normal mixed load situations.

> 
> Filesystem, like ext3/4 and xfs have the ability to account for stripe
> size in the block allocator to prevent unnecessary read-modify-writes,
> but if you do not stripe-align the start of the filesystem you cannot
> take advantage of this.

Okay, understood, but doesn't this imply, as long as my application 
running on top of an md and/or LV ontop of an md cannot take advantage 
of the layout information, it doesn't matter at all. I do see the 
advantage, I.E. if you have an RDBMS that can operate and organize 
itself ontop of some blockdevice which has a certain layout, or any 
filesystem taking this into account.
In contrast, if I am to export the blockdevice as iSCSI target in a 
plain NAS, this doesn't help me at all.
Now, even if I properly stripe align the pe_start, what happens if I am 
doing a whole disk online capacity expansion? As long as LVM cannot 
realign everything online, and the filesystem can realign itself (or 
update it's layout accordingly) online, this is pretty much pointless.

> 
> Regards,
> L.
> 

In the end it all comes down to, that in most cases aligning doesn't 
help, at leats not, if the whoel array configuration might change over 
time - or am I mistaken there?

Regards

-Sven
