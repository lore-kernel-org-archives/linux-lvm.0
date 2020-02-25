References: <d5dd6c06-1e9f-3737-8712-137f92e351cb@uwaterloo.ca>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <bcd5bb9d-9ea5-69ba-f041-7b0422b48405@redhat.com>
Date: Tue, 25 Feb 2020 10:38:31 +0100
MIME-Version: 1.0
In-Reply-To: <d5dd6c06-1e9f-3737-8712-137f92e351cb@uwaterloo.ca>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Eric Toombs <ewtoombs@uwaterloo.ca>

Dne 22. 02. 20 v 12:58 Eric Toombs napsal(a):
> Snapshot creation is already pretty fast:
> 
>> $ time sudo lvcreate --size 512M --snapshot --name snap /dev/testdbs/template
>>    Logical volume "snap" created.
>> 0.03user 0.05system 0:00.46elapsed 18%CPU (0avgtext+0avgdata 28916maxresident)k
>> 768inputs+9828outputs (0major+6315minor)pagefaults 0swaps
> 
> That's about half a second in real time. But I have a scenario that
> would benefit from it being even faster. I'm doing many small unit tests
> starting from a template filesystem. I do the snapshot, run the unit
> test on the snapshot, then delete the snapshot afterwards using
> lvremove. Each unit test, though, takes much less than a second to run
> (often on the order of 10ms), so most of the time is being spent making
> these snapshots.
> 
> So, is there a sort of "dumber" way of making these snapshots, maybe by
> changing the allocation algorithm or something?

Hi

IMHO - what takes most of the time are these couple things:

Each command has 'non-trivial' time overhead on its startup (scanning you 
system with devices and validating everything)

For old snapshots -  COW are needs to be 'created' & 'zeroed' as separate LV.

Then you need to 'flush' all existing IO on origin device (so it's in the 
consistent states - i.e. the filesystem synchronizes all it's content in its 
metadata) - this all takes some measurable amount of time.

You can 'prepare' empty zeroed LV ahead of time and then use
'lvconvert' to attach snapshot (with -Zn)  - this should speed-up attachment
of snapshot. For the 'second' point you could likely issue 'sync' ahead of 
time so most buffers will be flushed (if there is no big IO traffic).

Saying all this - why are you using old snapshot when you are targeting for 
performance ??

You really should consider usage of thin-pool - where you could chain a long 
series of snapshot without having a dramatic performance degradation of the 
whole IO throughput  - old snapshot are really meant to be used only if you 
want to take i.e. backup of a filesystem and you need some 'consistent' point 
in time - for everything else you should be using thin-pools nowdays...

Regards

Zdenek
