Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB9IXsV28277
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 13:33:54 -0500
Received: from eastrmmtao02.cox.net (eastrmmtao02.cox.net [68.230.240.37])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB9IXhv7013637
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 13:33:43 -0500
Received: from [192.168.0.9] (really [70.179.95.46]) by eastrmmtao02.cox.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20051209183214.OQBW8508.eastrmmtao02.cox.net@[192.168.0.9]>
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 13:32:14 -0500
Message-ID: <4399CE19.80601@cox.net>
Date: Fri, 09 Dec 2005 13:34:01 -0500
From: Old Fart <rascal.jumper-747@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] If one disk fails i loose everything?
References: <439620CE.1030902@ee.duth.gr>
	<8777.208.178.77.200.1134146221.squirrel@mnementh.dragonhold.org>
In-Reply-To: <8777.208.178.77.200.1134146221.squirrel@mnementh.dragonhold.org>
Content-Transfer-Encoding: 7bit
Reply-To: rascal.jumper-747@cox.net.spamorama.redhat.com,
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

gwood@dragonhold.org wrote:
> In the answers below I've taken 'one linear volume group' to actually mean
> 'one linear volume using all the space in the volume group'.  If this is
> not what you meant, can you please describe your setup?
>
>   
>>   1. If one hard disk fails (hardware) do I loose all the data stored on
>>   the VG?
>>     
> I'm not sure where you searched, but the answer to this is a fundamental
> characteristic of RAID0 - there is no redundancy.  If you have a concat
> (rather than a stripe), then you /might/ be able to salvage /some/ data -
> but the chances are pretty slim that you'll get anything sane back out of
> it, and you're going to have to do some relatively low level stuff to do
> even that I would have thought.
>
>   
>>   2. Can I add a new hard disk in the VG without having to format it
>>   before? (I mean if it is full of data can I just add it?)
>>     
> Not easily using LVM on linux, no.  If it already has partitions on it,
> then the layout of the data on the drive is incorrect for LVM.  There may
> be tools out there to overlay the required metadata, but the underlying
> partitions will have to reduce in size, so this would require the
> filesystems to support being shrunk.
>
>   
>>   3. In case of failure can I recover the data from a single disk on
>>   another box?
>>     
> What sort of failure?  Any VG that has enough drives to provide you with a
> working volume group/volume can be imported to another machine and read. 
> So if you have 3 volumes over the VG, and only one of them doesn't have a
> complete set of blocks on it - the other 2 can be salvaged.  In the case
> of the arrangement you're talking about, no.
>
> If you need to be able to recover the data, then a simple linear volume
> (with no redundancy) is not a good idea.
>
> (In answer to the subject line, 'with the arrangement you're talking
> about' - YES')
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>   
Good discussion....the need to protect data under various contingencies 
is why I use raid5 sets as the PVs.  You can lose up to two and keep 
your data, hot add, have spares, etc.

-- 
Regards,

Old Fart
