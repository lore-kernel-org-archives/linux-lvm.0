Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3KEe6jB017484
	for <linux-lvm@redhat.com>; Mon, 20 Apr 2009 10:40:06 -0400
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3KEdlue031078
	for <linux-lvm@redhat.com>; Mon, 20 Apr 2009 10:39:48 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 809CC872EE
	for <linux-lvm@redhat.com>; Mon, 20 Apr 2009 16:39:47 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 3JalMauDWL6T for <linux-lvm@redhat.com>;
	Mon, 20 Apr 2009 16:39:47 +0200 (CEST)
Date: Mon, 20 Apr 2009 16:39:47 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Wierd lvm2 performance problems
Message-ID: <20090420143947.GD17461@maude.comedia.it>
References: <49EA534C.7090003@whgl.uni-frankfurt.de>
	<49EACA64.8070006@redhat.com>
	<49EB4045.7020407@whgl.uni-frankfurt.de>
	<20090420053949.GA16457@maude.comedia.it>
	<98cfe6a3ff352717b0d636c599e39c99.squirrel@ssl.verfeiert.org>
	<20090420134610.GB17461@maude.comedia.it>
	<741c3ae301bc52a1e6f3a1771355698e.squirrel@ssl.verfeiert.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <741c3ae301bc52a1e6f3a1771355698e.squirrel@ssl.verfeiert.org>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Mon, Apr 20, 2009 at 04:14:22PM +0200, Sven Eschenberg wrote:
>Hi Luca,
>
>On Mon, April 20, 2009 15:46, Luca Berra wrote:
>> On Mon, Apr 20, 2009 at 03:15:12PM +0200, Sven Eschenberg wrote:
>>>Hi Luca,
>>>
>>>Okay, let's assume a chunk size of C. No matter what your md looks like,
>>>the logical md volume consists of a series of size/C chunks. the very
>>>first chunk C0 will hold the LVM header.
>>>If I align the extends with the chunksize and the extends even have the
>>>chunksize, then every extens PEx of my PV equals exactly a chunk on any
>>> of
>>>the disks.
>>>Which in turn means, if I want to read PEx I have to read some chunk Cy
>>> on
>>>one disk, and PEx+1 would most certainly be a Chunk Cy+1 which would
>>>reside on a different physical disk.
>>
>> correct
>>
>>>So the question is: Why would you want to align the first PE to the
>>>stripesize, rather then the chunksize?
>>
>> Because when you _write_ incomplete stripes, the raid code
>> would need to do a read-modify-write of the parity block.
>
>I didn't think of this 'yet', then again all the preliminary tests I did
>so far were on a 4D raid10 - Didn't have the time to setup the raid5
>volume yet, because the performance issues on the raid10 were so amazing
>:-D.
>
>>
>> Filesystem, like ext3/4 and xfs have the ability to account for stripe
>> size in the block allocator to prevent unnecessary read-modify-writes,
>> but if you do not stripe-align the start of the filesystem you cannot
>> take advantage of this.
>>
>
>Since you mentioned it: What is the specific option (for xfs mainly) to
>modify this behavior?
-d sunit=n (chunk size in 512b blocks)
-d swidth=n (stripe size in 512b blocks)
or, more convenient
-d su=n (chunk size in bytes)
-d sw=n (stripe size in bites

eg. mkfs.xfs -d su=64k,sw=192k ....
for a 3+1 raid5 with default chunksize

>> The annoying issue is that rarely you have a (n^2)+P array, and pe_size
>> must be a power of 2.
>> So for example, given my 3D1P raid5 the only solution I devised was
>> having a chunk size which is a power of 2k, pe_start is aligned to
>> stripe, pe_size = chunk size, and I have to remember that every time I
>> extend a LV it has to be extended to the nearest multiple of 3 LE.
>
>Ouch, I see, I'm gonna be as lucky as you :-).
>
>Another question arose, when I thought about something: I actually wanted
>to place the OS on a stripe of mirrors, since this gives me the
>statistically best robustness against two failing disks. From what I could
>read in the md man page, non of the offered raid10 modes provides such a
>layout. Would I have to first mirror two drives with md and then stripe em
>together with md on top of md?

i believe raid10 to be smart enough, but i am not 100% confident,
you could ask on linux-raid ml.
stacking raid devices would be an alternative

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
