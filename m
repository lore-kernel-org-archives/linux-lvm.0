References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
	<aca4355a-d7f3-c116-fc7b-7379f269a21a@assyoma.it>
	<B6F45B41-86FC-4810-BC40-0EEE8DD9E372@redhat.com>
	<f2e24a01b1e548b6b15db6d30596208b@xenhideout.nl>
	<595ff1d4-3277-ca5e-a18e-d62eaaf0b1a0@redhat.com>
	<9aa2d67c38af3e4042bd3f37559b799d@xenhideout.nl>
	<eb24f4de-2b58-38a4-9c8d-950a36530ed7@redhat.com>
	<2d1025d7784ab44cbc03cfe7f6778599@xenhideout.nl>
	<58f99204-d978-3f6a-9db8-b7122b30575e@redhat.com>
	<458d105938796d90f4e426bc458e8cc4@xenhideout.nl>
	<f7665fc3546d23200e9b08c6cdb67d2e@xenhideout.nl>
	<67e57de26f65447bde9e55bcf9a99ccc@xenhideout.nl>
	<d4b39ca6a299eb609f27f99e24eb7e26@assyoma.it>
	<e313e53f07abafead1713f03cf179542@xenhideout.nl>
	<45079be3-aa18-01f4-a663-7015c018e6f1@redhat.com>
	<5a579d450c0b079c3bc635eeb70e7c62@xenhideout.nl>
	<943c9d2c-0dd6-5d9a-ce98-6b30d12824fc@redhat.com>
	<a0d46eaf4f73313e0db78da8d8594f2a@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <bc9ed569-8054-bf20-5f89-c8bd57580bd2@redhat.com>
Date: Thu, 21 Sep 2017 22:32:22 +0200
MIME-Version: 1.0
In-Reply-To: <a0d46eaf4f73313e0db78da8d8594f2a@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 21.9.2017 v 16:49 Xen napsal(a):
> 
> However you would need LVM2 to make sure that only origin volumes are marked 
> as critical.

'dmeventd' executed binary - which can be a simple bash script called at 
threshold level can be tuned to various naming logic.

So far there is no plan to enforce 'naming' or 'tagging' since from user base 
feedback we can see numerous ways how to deal with large volume naming 
strategies often made by external tools/databases -  so enforcing i.e. 
specific tag would require changes in larger systems - so when it's compared 
with rather simple tuning script of bash script...


> I actually think that if I knew how to do multithreading in the kernel, I 
> could have the solution in place in a day...
> 
> If I were in the position to do any such work to begin with... :(.
> 
> But you are correct that error target is almost the same thing.

It's the most 'safest'  - avoids any sort of further possibly damaging of 
filesystem.

Note - typical 'fs' may remount 'ro' at reasonable threshold time - the 
precise points depends on workload. If you have 'PB' arrays - surely leaving 
5% of free space is rather huge, if you work with GB on fast operation SSD - 
taking action at 70% might be better.

If anytime 'during' write  users hits 'full pool' - there is currently no 
other way then to stop using FS  - there are numerous way -

You can replace device with 'error'
You can replace device with 'delay' that splits reads to thin and writes to error

There is just not any way-back - FS should be checked  (i.e. full FS could be 
'restored' by deleting some files, but in the full thin-pool case  'FS' needs 
to get consistent first - so focusing on solving full-pool is like preparing 
for missed battle - focus should go into ensuring you not hit full pool and on 
the 'sad' occasion of 100% full pool - the worst case scenario is not all the 
bad - surely way better then 4 year old experience with old kernel and old 
lvm2....

>> What you would have to implement is to TAKE the space FROM them to
>> satisfy writing task to your 'active' volume and respect
>> prioritization...
> 
> Not necessary. Reserved space is a metric, not a real thing.
> 
> Reserved space by definition is a part of unallocated space.

How is this different from having VG with 1TB where you allocate for your 
thin-pool only i.e. 90% for thin-pool and you have 10% of free space for 
'extension' of thin-pool for your 'critical' moment.

I'm still not seeing any difference - except you would need to invest lot of 
energy into handling of this 'reserved' space inside kernel.

With actual versions of lvm2 you can handle these tasks at user-space and 
quite early before you reach 'real' out-of-space condition.

>> In other words - tuning 'thresholds' in userspace's 'bash' script will
>> give you very same effect as if you are focusing here on very complex
>> 'kernel' solution.
> 
> It's just not very complex.
> 
> You thought I wanted space consumption metric for all volumes including 
> snapshots and then invididual attribution of all consumed space.


Maybe you can try existing proposed solutions first and showing 'weak' points 
which are not solvable by it ?

We all agree we could not store 10G thin volume into 1G thin-pool - so there 
will be always the case of having  'full pool'.

Either you could handle reserves of 'early' remount-ro  or you keep some 
'spare' LV/space in VG you attach to thin-pool 'when' needed...
Having such 'great' level of free choice here is IMHO big advantage as it's 
always 'admin' to decide how to use available space in the best way -  instead 
of keeping 'reserves' somewhere hidden in kernel....

Regards

Zdenek
