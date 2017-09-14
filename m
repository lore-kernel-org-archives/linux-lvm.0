Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B214F66D23
	for <linux-lvm@redhat.com>; Thu, 14 Sep 2017 15:25:32 +0000 (UTC)
Received: from st41p57im-ztfb14250501.me.com (st41p57im-ztfb14250501.me.com
	[17.36.64.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07F79883D4
	for <linux-lvm@redhat.com>; Thu, 14 Sep 2017 15:25:31 +0000 (UTC)
Received: from process-dkim-sign-daemon.st41p57im-ztfb14250501.me.com by
	st41p57im-ztfb14250501.me.com
	(Oracle Communications Messaging Server 8.0.1.2.20170607 64bit (built
	Jun 7 2017)) id <0OW900L00ZOR7400@st41p57im-ztfb14250501.me.com> for
	linux-lvm@redhat.com; Thu, 14 Sep 2017 15:25:28 +0000 (GMT)
Received: from icloud.com ([127.0.0.1]) by st41p57im-ztfb14250501.me.com
	(Oracle Communications Messaging Server 8.0.1.2.20170607 64bit (built
	Jun 7
	2017)) with ESMTPSA id <0OWA00KHZ06FTC00@st41p57im-ztfb14250501.me.com>
	for linux-lvm@redhat.com; Thu, 14 Sep 2017 15:25:28 +0000 (GMT)
From: Dale Stephenson <dalestephenson@mac.com>
MIME-version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Thu, 14 Sep 2017 11:25:26 -0400
References: <C28D2468-1843-4019-A503-E566A305977D@mac.com>
	<d23b94a7-b5c5-4ee2-51c7-7dfa06cca3d2@redhat.com>
	<42E7ED35-B32E-4C02-976A-7A9E5380EEA8@mac.com>
	<bb529703-849c-93ff-f40c-1de8a6f49ce6@redhat.com>
In-reply-to: <bb529703-849c-93ff-f40c-1de8a6f49ce6@redhat.com>
Message-id: <443B4DE9-E41D-45CB-8CB6-1BC7600E1DBD@mac.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Performance penalty for 4k requests on thin
 provisioned volume
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
To: LVM general discussion and development <linux-lvm@redhat.com>


> On Sep 14, 2017, at 5:00 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:
> 
> Dne 14.9.2017 v 00:39 Dale Stephenson napsal(a):
>> I could create the md to use 512k chunks for RAID 0, but I wouldn’t expect that to have any impact on a single threaded test using 4k request size.  Is there a hidden relationship that I’m unaware of?
> 
> If you can reevaluate different setups you may possibly get much higher throughput.
> 
To be clear, while I would be interested in hearing about differing setups that would improve the 4k iops performance overall; I am most interested in getting the thin performance comparable to the thick performance.  I did not expect such a large differential between the two types.

> My guess would be - the best targeting layout should be probably striping no more then 2-3 disks and use bigger striping block.
> 
> And then just 'join' 'smaller' arrays together in lvm2 in 1 big LV.
> 
Is this advice given because the drives involved are SSD?  With rotational drives I would never expect concatenated small RAID 0 arrays to provide superior throughput to a single RAID 0.  The best chunk size for sustained throughput depends on the typical transaction, theoretical best case would have typical request size equal to a full stripe.

I would not expect the raid arrangement (at least for RAID 0 or concatenated drives) to have a significant impact on 4k request performance, however.  Too small to take advantage of striping.  Is there a reason why the arrangement would make a difference for this size?
> 
>>> (something like  'lvcreate -LXXX -i8 -I512k vgname’)
>>> 
>> Would making lvm stripe on top of an md that already stripes confer any performance benefit in general, or for small (4k) requests in particular?
> 
> Rule #1 - try to avoid 'over-combining' things together.
> - measure performance from 'bottom'  upward in your device stack.
> If the underlying devices gives poor speed - you can't make it better by any super0smart disk-layout on top of it.
> 
Fair enough.  I have done exactly that — the performance of the underlying md RAID and thick volumes is virtually identical, as I expected.  The thin performance is much, much lower on the same RAID.  So it’s not the underlying layer that is causing the poor speed, it’s the thin volume.

> 
>>> Wouldn't be 'faster' to just concatenate 8 disks together instead of striping - or stripe only across 2 disk - and then you concatenate 4 such striped areas…
>>> 
>> For sustained throughput I would expect striping of 8 disks to blow away concatenation — however, for small requests I wouldn’t expect any advantage. On a non-redundant array, I would expect a single threaded test using 4k requests is going to end up reading/writing data from exactly one disk regardless of whether the underlying drives are concatenated or stripes.
> It always depends which kind of load you expect the most.
> 
> I suspect spreading 4K blocks across 8 SSD is likely very far away from ideal layout.

Very true.  Trying to read/write a single 4k request across 8 drives, whether they are SSD or not, would require a 512-byte chunksize.  Not only is that not possible with md, the overhead associated with generating 8 i/o requests would more than eat up any tiny gain from parallel i/o.  (For rotational drives it’d be even worse, since you’d ensure the response time is governed by the slowest drive).

Which is why for a test like this, which is just using 4k requests in a single thread, I don’t really expect the arrangement of the RAID to have any significant effect.  No matter what kind of drive you are using, and however your drives are arranged, I’d expect the 4k requests only to read or write to a single disk.  So why is it so much slower on thin volumes than thick?

> Any SSD is typically very bad with 4K blocks -  it you want to 'spread' the load on mores SSDs  do not use less the 64K stripe chunks per SSD - this gives you (8*64) 512K stripe size.
> 
I am not using 4k “blocks” anywhere in the remapping layers.  I am using a 4k *request* size.  I want the highest possible number of iops for this request size; I know the throughput will stink compared to larger request sizes, but that’s to be expected.

> As for thin-pool chunksize -  if you plan to use lots of snapshots - keep the value lowest possible - 64K  or 128K thin-pool chunksize.
> 
Snapshots are the main attraction of thin provisioning to me, so 64k would be my preferred thin-pool chunksize for that reason.  However, neither a 64k thin-pool chunksize nor a 512k thin-pool chunksize eliminates the large performance difference between thin and thick volumes for 4k requests.

> But I'd still suggest to reevaluate/benchmark setup where you will use much lower number of SSD for load spreading - and use bigger strip chunks per each device. This should nicely improve performance in case of 'bigger' writes
> and not that much slow things down with  4K loads….
> 
Is the transactional latency so high compared to the data transfer itself that 3-drive SSD RAID 0 should outperform 8-drive SSD RAID 0 for a constant stripe size?  Sounds like an interesting test to run, but I wouldn’t expect it to affect 4k requests.

> 
>> What is the best choice for handling 4k request sizes?
> 
> Possibly NVMe can do a better job here.


What can be done to make *thin provisioning* handle 4k request sizes better?  There may be hardware that performs better for 4k requests than the ones I’m using, but I’m not bothered by the lvm thick volume performance on it.  What can I do to make the lvm thin volume perform as close to thick as possible?

Thank you,
Dale Stephenson
