Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4K5OViJ022946
	for <linux-lvm@redhat.com>; Thu, 20 May 2010 01:24:31 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4K5OLwK011448
	for <linux-lvm@redhat.com>; Thu, 20 May 2010 01:24:22 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 47B1E86FDB
	for <linux-lvm@redhat.com>; Thu, 20 May 2010 07:24:20 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id Ca8NLlJ7Aj3o for <linux-lvm@redhat.com>;
	Thu, 20 May 2010 07:24:15 +0200 (CEST)
Date: Thu, 20 May 2010 07:24:15 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100520052415.GA27154@maude.comedia.it>
References: <059801caf769$fc848350$f58d89f0$@com>
	<4BF40A8B.2000201@alteeve.com>
	<20100519162401.GA4163@trillian.comsick.at>
	<4BF4660C.60307@cox.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BF4660C.60307@cox.net>
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, May 19, 2010 at 05:28:28PM -0500, Ron Johnson wrote:
> On 05/19/2010 11:24 AM, Michael Guntsche wrote:
>> On 2010.05.19 11:58:03 , Digimer wrote:
>>> On 10-05-19 11:43 AM, kevin wrote:
>>>> Howdy,
>>>>
>>>> (fdisk+mkfs+pvcreate+vgextend+lvextend) is the right way to go about adding
>>>
>>> The mkfs isn't supposed to be there, just set the new drive's
>>> partition to type '8e' (Linux LVM).
>> Or use the full device without any partition at all.
>>
>
> I wonder if this will have any adverse affects on drives with 4KB sectors?
it depends
on a disk with 4k sector, using the whole device is more likely to have
a correct alignment (0 is a multiple of 4k)

on a disk with 4k sector and the first sector shifted (some drives have
a jumper to achieve this, it might be called something like "XP
compatibility") using the whole device, or anything not aligned to
63x512byte will result in unaligned data.

afair recent kernels should expose the alignment and sector size under
/sys/block/..., (if the drive exposes that info and does not lie, that
is.) and fdisk/parted/lvm/md should correctly align data start.

On a personal note, i really despise partition tables, it is a broken
design from the early eighties, we should be able to move on. If you
must use a GPT partition, at least it has a backup block.

L.


-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
