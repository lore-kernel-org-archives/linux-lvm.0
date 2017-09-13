Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 477565D724
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 22:39:48 +0000 (UTC)
Received: from st41p57im-ztfb14250501.me.com (st41p57im-ztfb14250501.me.com
	[17.36.64.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B62094E4D4
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 22:39:47 +0000 (UTC)
Received: from process-dkim-sign-daemon.st41p57im-ztfb14250501.me.com by
	st41p57im-ztfb14250501.me.com
	(Oracle Communications Messaging Server 8.0.1.2.20170607 64bit (built
	Jun 7 2017)) id <0OW800900PLQWE00@st41p57im-ztfb14250501.me.com> for
	linux-lvm@redhat.com; Wed, 13 Sep 2017 22:39:47 +0000 (GMT)
Received: from icloud.com ([127.0.0.1]) by st41p57im-ztfb14250501.me.com
	(Oracle Communications Messaging Server 8.0.1.2.20170607 64bit (built
	Jun 7
	2017)) with ESMTPSA id <0OW800K5XPM9IS10@st41p57im-ztfb14250501.me.com>
	for linux-lvm@redhat.com; Wed, 13 Sep 2017 22:39:46 +0000 (GMT)
From: Dale Stephenson <dalestephenson@mac.com>
MIME-version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Wed, 13 Sep 2017 18:39:44 -0400
References: <C28D2468-1843-4019-A503-E566A305977D@mac.com>
	<d23b94a7-b5c5-4ee2-51c7-7dfa06cca3d2@redhat.com>
In-reply-to: <d23b94a7-b5c5-4ee2-51c7-7dfa06cca3d2@redhat.com>
Message-id: <42E7ED35-B32E-4C02-976A-7A9E5380EEA8@mac.com>
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


> On Sep 13, 2017, at 4:19 PM, Zdenek Kabelac <zkabelac@redhat.com> wrote:
> 
> Dne 13.9.2017 v 17:33 Dale Stephenson napsal(a):
>> Distribution: centos-release-7-3.1611.el7.centos.x86_64
>> Kernel: Linux 3.10.0-514.26.2.el7.x86_64
>> LVM: 2.02.166(2)-RHEL7 (2016-11-16)
>> Volume group consisted of an 8-drive SSD (500G drives) array, plus an additional SSD of the same size.  The array had 64 k stripes.
>> Thin pool had -Zn option and 512k chunksize (full stripe), size 3T with metadata volume 16G.  data was entirely on the 8-drive raid, metadata was entirely on the 9th drive.
>> Virtual volume “thin” was 300 GB.  I also filled it with dd so that it would be fully provisioned before the test.
>> Volume “thick” was also 300GB, just an ordinary volume also entirely on the 8-drive array.
>> Four tests were run directlyagainst each volume using fio-2.2.8, random read, random write, sequential read, sequential write.  Single thread, 4k blocksize, 90s run time.
> 
> Hi
> 
> Can you please provide output of:
> 
> lvs -a -o+stripes,stripesize,seg_pe_ranges
> 
> so we can see how is your stripe placed on devices ?

Sure, thank you for your help:
# lvs -a -o+stripes,stripesize,seg_pe_ranges
  LV               VG     Attr       LSize   Pool     Origin Data%  Meta%  Move Log Cpy%Sync Convert #Str Stripe PE Ranges               
  [lvol0_pmspare]  volgr0 ewi-------  16.00g                                                            1     0  /dev/md127:867328-871423
  thick            volgr0 -wi-a----- 300.00g                                                            1     0  /dev/md127:790528-867327
  thin             volgr0 Vwi-a-t--- 300.00g thinpool        100.00                                     0     0                          
  thinpool         volgr0 twi-aot---   3.00t                 9.77   0.13                                1     0  thinpool_tdata:0-786431 
  [thinpool_tdata] volgr0 Twi-ao----   3.00t                                                            1     0  /dev/md127:0-786431     
  [thinpool_tmeta] volgr0 ewi-ao----  16.00g                                                            1     0  /dev/sdb4:0-4095        

md127 is an 8-drive RAID 0

As you can see, there’s no lvm striping; I rely on the software RAID underneath for that.  Both thick and thin lvols are on the same PV.
> 
> SSD typically do needs ideally write 512K chunks.

I could create the md to use 512k chunks for RAID 0, but I wouldn’t expect that to have any impact on a single threaded test using 4k request size.  Is there a hidden relationship that I’m unaware of?

> (something like  'lvcreate -LXXX -i8 -I512k vgname’)
> 
Would making lvm stripe on top of an md that already stripes confer any performance benefit in general, or for small (4k) requests in particular?

> Wouldn't be 'faster' to just concatenate 8 disks together instead of striping - or stripe only across 2 disk - and then you concatenate 4 such striped areas…
> 
For sustained throughput I would expect striping of 8 disks to blow away concatenation — however, for small requests I wouldn’t expect any advantage.  On a non-redundant array, I would expect a single threaded test using 4k requests is going to end up reading/writing data from exactly one disk regardless of whether the underlying drives are concatenated or stripes.

> 64k stripes do not seem to look like ideal match in this case of 3 disk with 512K blocks

My mistake, I was sloppy with my terminology.  My RAID 0 had a 64k *chunksize*, so it was a stripe of 64k chunks, not a 64k stripe.  The stripe size was 512K, matching the thinpool chunk size.  My understanding is that having the thin pool chunksize match the full stripe size of the underlying array is the best performing choice (at least for throughput).

What is the best choice for handling 4k request sizes?

Thank you,
Dale Stephenson
