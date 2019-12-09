Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44F742166B29
	for <linux-lvm@redhat.com>; Mon,  9 Dec 2019 13:50:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C6F08F09AD
	for <linux-lvm@redhat.com>; Mon,  9 Dec 2019 13:50:53 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: =?utf-8?Q?=C5=81ukasz_Czerpak?= <lukasz.czerpak@gmail.com>
In-Reply-To: <9ce05dc0-25f9-cf62-3d7d-3911a7df90ea@redhat.com>
Date: Mon, 9 Dec 2019 14:50:46 +0100
Message-Id: <EE5C3FCA-1A0B-4518-927D-5108F109F5AA@gmail.com>
References: <D2CA32A7-3D9D-4490-9B42-89DC00E163FE@gmail.com>
	<8B290F6D-9D0B-4186-9F17-AAAB0BFA8DDA@gmail.com>
	<9ce05dc0-25f9-cf62-3d7d-3911a7df90ea@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Thin pool vg1-thinpool1-tpool (253:3)
 transaction_id is 549, while expected 505.
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
Content-Type: text/plain; charset="utf-8"
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

hi,

It’s Ubuntu 18.04.3:

$ lvm version
  LVM version:     2.02.176(2) (2017-11-03)
  Library version: 1.02.145 (2017-11-03)
  Driver version:  4.37.0

$ uname -a
Linux gandalf 4.15.0-72-generic #81-Ubuntu SMP Tue Nov 26 12:20:02 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

It’s weird as same error occurred few minutes ago. I wanted to take snapshot of thin volume and it first returned the following error:

$ lvcreate -s --name vmail-data-snapshot vg1/vmail-data                                                                                                                                       
Using default stripesize 64.00 KiB.                                                                                                                                                         
Can't create snapshot vmail-data-snapshot as origin vmail-data is not suspended.                                                                                                            
Failed to suspend thin snapshot origin vg1/vmail-data.

Then I tried with different volume:

$ lvcreate -s --name owncloud-data-snapshot vg1/owncloud-data                                                                                                                                 
Using default stripesize 64.00 KiB.
Thin pool vg1-thinpool1-tpool (253:2) transaction_id is 574, while expected 572.
Failed to suspend vg1/thinpool1 with queued messages.

Same error when then tried to export LXD’s container:

$ lvcreate -s --name owncloud-data-snapshot vg1/owncloud-data
  Using default stripesize 64.00 KiB.
  Thin pool vg1-thinpool1-tpool (253:2) transaction_id is 574, while expected 572.
  Failed to suspend vg1/thinpool1 with queued messages.

I did vgcfgbackup and transaction_id for thinpool1 was 573. I really don’t know what’s going on.
Wondering if this might be caused by LXD running as snap which is known to not interact with system's lvmetad and thus giving out of date information. LXD is configured to use thinpool1 as storage.

Maybe after I did vgcfgbackup, updated mismatching transaction_id and restored with vgcfgrestore, I got access to data and fake impression all was fixed.

—
Best Regards,
Łukasz Czerpak




> On 9 Dec 2019, at 14:36, Zdenek Kabelac <zkabelac@redhat.com> wrote:
> 
> Dne 08. 12. 19 v 21:47 Łukasz Czerpak napsal(a):
>> After googling a lot I figure out what to do and it worked - at least I can access the most critical data.
>> I’ve followed instructions from this blog post: https://blog.monotok.org/lvm-transaction-id-mismatch-and-metadata-resize-error/
>> However, I have no idea what was the root cause of this. I hope I can fully recover the volumes w/o re-creating the whole VG.
>> In case I did something terribly wrong that looked like the solution now, but may cause issues in future - I would appreciate any hints.
>>> 
>>> $ lvchange -ay vg1
>>> WARNING: Not using lvmetad because a repair command was run.
>>> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expected 505.
> 
> Hi
> 
> What's been you lvm2 & kernel version ?
> 
> This difference is too big for 'recent' versions - there should never be more
> then one - unless you are using old kernel & old lvm2.
> 
> Regards
> 
> Zdenek
> 
