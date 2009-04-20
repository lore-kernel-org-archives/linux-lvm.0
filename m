Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3KDG5Dg012549
	for <linux-lvm@redhat.com>; Mon, 20 Apr 2009 09:16:05 -0400
Received: from www.wohnheimg.uni-frankfurt.de (www.wohnheimg.uni-frankfurt.de
	[141.2.118.239])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3KDFldw025591
	for <linux-lvm@redhat.com>; Mon, 20 Apr 2009 09:15:48 -0400
Received: from localhost ([127.0.0.1] helo=ssl.verfeiert.org)
	by www.wohnheimg.uni-frankfurt.de with esmtp (Exim 4.69)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1LvtL6-0007vv-F6
	for linux-lvm@redhat.com; Mon, 20 Apr 2009 15:15:46 +0200
Message-ID: <98cfe6a3ff352717b0d636c599e39c99.squirrel@ssl.verfeiert.org>
In-Reply-To: <20090420053949.GA16457@maude.comedia.it>
References: <49EA534C.7090003@whgl.uni-frankfurt.de>
	<49EACA64.8070006@redhat.com> <49EB4045.7020407@whgl.uni-frankfurt.de>
	<20090420053949.GA16457@maude.comedia.it>
Date: Mon, 20 Apr 2009 15:15:12 +0200 (CEST)
Subject: Re: [linux-lvm] Wierd lvm2 performance problems
From: "Sven Eschenberg" <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: sven@whgl.uni-frankfurt.de,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Luca,

Okay, let's assume a chunk size of C. No matter what your md looks like,
the logical md volume consists of a series of size/C chunks. the very
first chunk C0 will hold the LVM header.
If I align the extends with the chunksize and the extends even have the
chunksize, then every extens PEx of my PV equals exactly a chunk on any of
the disks.
Which in turn means, if I want to read PEx I have to read some chunk Cy on
one disk, and PEx+1 would most certainly be a Chunk Cy+1 which would
reside on a different physical disk.

So the question is: Why would you want to align the first PE to the
stripesize, rather then the chunksize?

Regards

-Sven


On Mon, April 20, 2009 07:39, Luca Berra wrote:
> On Sun, Apr 19, 2009 at 05:16:21PM +0200, Sven Eschenberg wrote:
>> Unfortunately I don't have the box at hand for 2 days, but I asked md to
>> use a chunksize of 2048K and the /proc/mdstat reported 2048K, last time
>> I
>> checked.
>> The LVM hat a phy-extsize of 2M and with the --dataalignment option set
>> to
>> 2M, pvs reported a pe_start value of 2M aswell.
>
> if you have a 2M chunk size, a full stripe is 2M*(N-1), where N-1 is the
> number of drives in your array minus redundancy. (i.e. for a 5 drive
> raid5 a stripe size would be 8M).
>
> L.
>
> --
> Luca Berra -- bluca@comedia.it
>           Communication Media & Services S.r.l.
>    /"\
>    \ /     ASCII RIBBON CAMPAIGN
>     X        AGAINST HTML MAIL
>    / \
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
