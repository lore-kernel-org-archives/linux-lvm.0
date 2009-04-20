Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3KDkUUD004925
	for <linux-lvm@redhat.com>; Mon, 20 Apr 2009 09:46:30 -0400
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3KDkAFE001148
	for <linux-lvm@redhat.com>; Mon, 20 Apr 2009 09:46:11 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 6D07587328
	for <linux-lvm@redhat.com>; Mon, 20 Apr 2009 15:46:10 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id zzFPyhoXOdME for <linux-lvm@redhat.com>;
	Mon, 20 Apr 2009 15:46:10 +0200 (CEST)
Date: Mon, 20 Apr 2009 15:46:10 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Wierd lvm2 performance problems
Message-ID: <20090420134610.GB17461@maude.comedia.it>
References: <49EA534C.7090003@whgl.uni-frankfurt.de>
	<49EACA64.8070006@redhat.com>
	<49EB4045.7020407@whgl.uni-frankfurt.de>
	<20090420053949.GA16457@maude.comedia.it>
	<98cfe6a3ff352717b0d636c599e39c99.squirrel@ssl.verfeiert.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98cfe6a3ff352717b0d636c599e39c99.squirrel@ssl.verfeiert.org>
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

On Mon, Apr 20, 2009 at 03:15:12PM +0200, Sven Eschenberg wrote:
>Hi Luca,
>
>Okay, let's assume a chunk size of C. No matter what your md looks like,
>the logical md volume consists of a series of size/C chunks. the very
>first chunk C0 will hold the LVM header.
>If I align the extends with the chunksize and the extends even have the
>chunksize, then every extens PEx of my PV equals exactly a chunk on any of
>the disks.
>Which in turn means, if I want to read PEx I have to read some chunk Cy on
>one disk, and PEx+1 would most certainly be a Chunk Cy+1 which would
>reside on a different physical disk.

correct

>So the question is: Why would you want to align the first PE to the
>stripesize, rather then the chunksize?

Because when you _write_ incomplete stripes, the raid code
would need to do a read-modify-write of the parity block.

Filesystem, like ext3/4 and xfs have the ability to account for stripe
size in the block allocator to prevent unnecessary read-modify-writes,
but if you do not stripe-align the start of the filesystem you cannot
take advantage of this.

The annoying issue is that rarely you have a (n^2)+P array, and pe_size
must be a power of 2.
So for example, given my 3D1P raid5 the only solution I devised was
having a chunk size which is a power of 2k, pe_start is aligned to
stripe, pe_size = chunk size, and I have to remember that every time I
extend a LV it has to be extended to the nearest multiple of 3 LE.

Regards,
L.

>Regards
>
>-Sven
>
>
>On Mon, April 20, 2009 07:39, Luca Berra wrote:
>> On Sun, Apr 19, 2009 at 05:16:21PM +0200, Sven Eschenberg wrote:
>>> Unfortunately I don't have the box at hand for 2 days, but I asked md to
>>> use a chunksize of 2048K and the /proc/mdstat reported 2048K, last time
>>> I
>>> checked.
>>> The LVM hat a phy-extsize of 2M and with the --dataalignment option set
>>> to
>>> 2M, pvs reported a pe_start value of 2M aswell.
>>
>> if you have a 2M chunk size, a full stripe is 2M*(N-1), where N-1 is the
>> number of drives in your array minus redundancy. (i.e. for a 5 drive
>> raid5 a stripe size would be 8M).
>>
>> L.
>>
>> --
>> Luca Berra -- bluca@comedia.it
>>           Communication Media & Services S.r.l.
>>    /"\
>>    \ /     ASCII RIBBON CAMPAIGN
>>     X        AGAINST HTML MAIL
>>    / \
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
