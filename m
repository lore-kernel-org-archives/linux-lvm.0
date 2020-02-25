Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE6172026FFE
	for <linux-lvm@redhat.com>; Tue, 25 Feb 2020 21:34:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13FCE85A313
	for <linux-lvm@redhat.com>; Tue, 25 Feb 2020 21:34:53 +0000 (UTC)
Sender: Evil Eric <ewtoombs@gmail.com>
References: <d5dd6c06-1e9f-3737-8712-137f92e351cb@uwaterloo.ca>
	<bcd5bb9d-9ea5-69ba-f041-7b0422b48405@redhat.com>
From: Eric Toombs <ewtoombs@uwaterloo.ca>
Message-ID: <bfd3824a-f360-b4ab-9a08-6a51c8c37a94@uwaterloo.ca>
Date: Tue, 25 Feb 2020 16:35:01 -0500
MIME-Version: 1.0
In-Reply-To: <bcd5bb9d-9ea5-69ba-f041-7b0422b48405@redhat.com>
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] faster snapshot creation?
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

I tried thin pools and got the same snapshot creation time, about .45s.

I also tried creating the entire vg in memory with losetup and that
didn't change the creation time either.

On 2020-02-25 04:38, Zdenek Kabelac wrote:
> Dne 22. 02. 20 v 12:58 Eric Toombs napsal(a):
>> Snapshot creation is already pretty fast:
>>
>>> $ time sudo lvcreate --size 512M --snapshot --name snap
>>> /dev/testdbs/template
>>> �� Logical volume "snap" created.
>>> 0.03user 0.05system 0:00.46elapsed 18%CPU (0avgtext+0avgdata
>>> 28916maxresident)k
>>> 768inputs+9828outputs (0major+6315minor)pagefaults 0swaps
>>
>> That's about half a second in real time. But I have a scenario that
>> would benefit from it being even faster. I'm doing many small unit tests
>> starting from a template filesystem. I do the snapshot, run the unit
>> test on the snapshot, then delete the snapshot afterwards using
>> lvremove. Each unit test, though, takes much less than a second to run
>> (often on the order of 10ms), so most of the time is being spent making
>> these snapshots.
>>
>> So, is there a sort of "dumber" way of making these snapshots, maybe by
>> changing the allocation algorithm or something?
> 
> Hi
> 
> IMHO - what takes most of the time are these couple things:
> 
> Each command has 'non-trivial' time overhead on its startup (scanning
> you system with devices and validating everything)
> 
> For old snapshots -� COW are needs to be 'created' & 'zeroed' as
> separate LV.
> 
> Then you need to 'flush' all existing IO on origin device (so it's in
> the consistent states - i.e. the filesystem synchronizes all it's
> content in its metadata) - this all takes some measurable amount of time.
> 
> You can 'prepare' empty zeroed LV ahead of time and then use
> 'lvconvert' to attach snapshot (with -Zn)� - this should speed-up
> attachment
> of snapshot. For the 'second' point you could likely issue 'sync' ahead
> of time so most buffers will be flushed (if there is no big IO traffic).
> 
> Saying all this - why are you using old snapshot when you are targeting
> for performance ??
> 
> You really should consider usage of thin-pool - where you could chain a
> long series of snapshot without having a dramatic performance
> degradation of the whole IO throughput� - old snapshot are really meant
> to be used only if you want to take i.e. backup of a filesystem and you
> need some 'consistent' point in time - for everything else you should be
> using thin-pools nowdays...
> 
> Regards
> 
> Zdenek
> 
