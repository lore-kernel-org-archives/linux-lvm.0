References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
	<aca4355a-d7f3-c116-fc7b-7379f269a21a@assyoma.it>
	<B6F45B41-86FC-4810-BC40-0EEE8DD9E372@redhat.com>
	<f2e24a01b1e548b6b15db6d30596208b@xenhideout.nl>
	<595ff1d4-3277-ca5e-a18e-d62eaaf0b1a0@redhat.com>
	<9aa2d67c38af3e4042bd3f37559b799d@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <eb24f4de-2b58-38a4-9c8d-950a36530ed7@redhat.com>
Date: Thu, 14 Sep 2017 21:05:54 +0200
MIME-Version: 1.0
In-Reply-To: <9aa2d67c38af3e4042bd3f37559b799d@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 14.9.2017 v 07:59 Xen napsal(a):
> Zdenek Kabelac schreef op 13-09-2017 21:35:
> 
>> We are moving here in right direction.
>>
>> Yes - current thin-provisiong does not let you limit maximum number of
>> blocks individual thinLV can address (and snapshot is ordinary thinLV)
>>
>> Every thinLV can address� exactly�� LVsize/ChunkSize� blocks at most.
> 
> So basically the only options are allocation check with asynchronously derived 
> intel that might be a few seconds late, as a way to execute some standard and 
> general "prioritizing" policy, and an interventionalist policy that will 
> (fs)freeze certain volumes depending on admin knowledge about what needs to 
> happen in his/her particular instance.


Basically user-land tool takes a runtime snapshot of kernel metadata
(so gets you information from some frozen point in time) then it processes the 
input data (up to 16GiB!) and outputs some number - like what is the
real unique blocks allocated in thinLV.  Typically snapshot may share some 
blocks - or could have already be provisioning all blocks  in case shared 
blocks were already modified.


>> Great - 'prediction' - we getting on the same page -� prediction is
>> big problem....
> 
> Yes I mean my own 'system' I generally of course know how much data is on it 
> and there is no automatic data generation.

However lvm2 is not 'Xen oriented' tool only.
We need to provide universal tool - everyone can adapt to their needs.

Since your needs are different from others needs.

> But if I do create snapshots (which I do every day) when the root and boot 
> snapshots fill up (they are on regular lvm) they get dropped which is nice, 

old snapshot are different technology for different purpose.

> 
> $ sudo ./thin_size_report.sh
> [sudo] password for xen:
> Executing self on linux/thin
> Individual invocation for linux/thin
> 
>  ��� name�������������� pct������ size
>  ��� ---------------------------------
>  ��� data����������� 54.34%���� 21.69g
>  ��� sites����������� 4.60%����� 1.83g
>  ��� home������������ 6.05%����� 2.41g
>  ��� --------------------------------- +
>  ��� volumes�������� 64.99%���� 25.95g
>  ��� snapshots������� 0.09%���� 24.00m
>  ��� --------------------------------- +
>  ��� used����������� 65.08%���� 25.97g
>  ��� available������ 34.92%���� 13.94g
>  ��� --------------------------------- +
>  ��� pool size����� 100.00%���� 39.91g
> 
> The above "sizes" are not volume sizes but usage amounts.

With 'plain'  lvs output is - it's just an orientational number.
Basically highest referenced chunk for a thin given volume.
This is great approximation of size for a single thinLV.
But somewhat 'misleading' for thin devices being created as snapshots...
(having shared blocks)

So you have no precise idea how many blocks are shared or uniquely owned by a 
device.

Removal of snapshot might mean you release  NOTHING from your thin-pool if all 
snapshot blocks where shared with some other thin volumes....


> If you say that any additional allocation checks would be infeasible because 
> it would take too much time per request (which still seems odd because the 
> checks wouldn't be that computation intensive and even for 100 gigabyte you'd 
> only have 25.000 checks at default extent size) -- of course you 
> asynchronously collect the data.

Processing of mapping of upto 16GiB of metadata will not happen in 
miliseconds.... and consumes memory and CPU...


> I mean I generally like the designs of the LVM team.
> 
> I think they are some of the most pleasant command line tools anyway...

We try really hard....


> On the other hand if all you can do is intervene in userland, then all LVM 
> team can do is provide basic skeleton for execution of some standard scripts.

Yes - we give all the power to suit thin-p for individual needs to the user.

> 
>> So all you need to do is to use the tool in user-space for this task.
> 
> So maybe we can have an assortment of some 5 interventionalist policies like:
> 
> a) Govern max snapshot size and drop snapshots when they exceed this
> b) Freeze non-critical volumes when thin space drops below aggegrate values 
> appropriate for the critical volumes
> c) Drop snapshots when thin space <5% starting with the biggest one
> d) Also freeze relevant snapshots in case (b)
> e) Drop snapshots when exceeding max configured size in case of threshold reach.

But you are aware you can run such task even with cronjob.

> So for example you configure max size for snapshot. When snapshots exceeds 
> size gets flagged for removal. But removal only happens when other condition 
> is met (threshold reach).

We are blamed already for having way too much configurable knobs....


> 
> So you would have 5 different interventions you could use that could be 
> considered somewhat standard and the admit can just pick and choose or customize.
> 

And we have way longer list of actions we want to do ;) We have not yet come 
to any single conclusion how to make such thing manageable for a user...

> 
> But how expensive is it to do it say every 5 seconds?

If you have big metadata - you would keep you Intel Core busy all the time ;)

That's why we have those thresholds.

Script is called at  50% fullness, then when it crosses 55%, 60%, ... 95%, 
100%. When it drops bellow threshold - you are called again once the boundary 
is crossed...

So you can do different action at different fullness level...

> 
> I get that but I wonder how expensive it would be to do that automatically all 
> the time in the background.

If you are proud sponsor of your electricity provider and you like the extra 
heating in your house - you can run this in loop of course...


> It seems to already happen?
> 
> Otherwise you wouldn't be reporting threshold messages.

Threshold are based on  mapped size for whole thin-pool.

Thin-pool surely knows all the time how many blocks are allocated and free for
its data and metadata devices.

(Thought 'lvs' presented numbers are not 'synchronized' - there could be up to 
1.second delay between reported & real number)

> In any case the only policy you could have in-kernel would be either what 
> Gionatan proposed (fixed reserved space for certain volumes) (easy calculation 
> right) or potentially allocation freeze at threshold for non-critical volumes,


In the single thin-pool  all thins ARE equal.

Low number of 'data' block may cause tremendous amount of provisioning.

With specifically written data pattern you can (in 1 second!) cause 
provisioning of large portion of your thin-pool (if not the whole one in case 
you have small one in range of gigabytes....)

And that's the main issue - what we solve in  lvm2/dm  - we want to be sure 
that when thin-pool is FULL  -  written & committed data are secure and safe.
Reboot is mostly unavoidable if you RUN from a device which is out-of-space -
we cannot continue to use such device - unless you add MORE space to it within 
60second window.


All other proposals solve only very localized solution and problems which are 
different for every user.

I.e. you could have a misbehaving daemon filling your system device very fast 
with logs...

In practice - you would need some system analysis and detect which application 
causes highest pressure on provisioning  - but that's well beyond range lvm2 
team ATM with the amount of developers can provide....


> I just still don't see how one check per 4MB would be that expensive provided 
> you do data collection in background.
> 
> You say size can be as low as 64kB... well.... in that case...

Default chunk size if 64k for the best 'snapshot' sharing - the bigger the 
pool chunk is the less like you could 'share' it between snapshots...

(As pointed in other thread - ideal chunk for best snapshot sharing would be 
4K - but that's not affordable for other reasons....)


>  ����� 2) I would freeze non-critical volumes ( I do not write to snapshots so 
> that is no issue ) when critical volumes reached safety threshold in free 
> space ( I would do this in-kernel if I could ) ( But Freezing In User-Space is 
> almost the same ).

There are lots of troubles when you have freezed filesystems present in your 
machine fs tree... -  if you know all connections and restrictions - it can be 
'possibly' useful - but I can't imagine this being useful in generic case...

And more for your thinking -

If you have pressure on provisioning caused by disk-load on one of your 
'critical' volumes this FS 'freezeing' scripting will 'buy' you only couple 
seconds (depends how fast drives you have and how big thresholds you will use) 
and you are in the 'exact' same situation - expect now you have  system in 
bigger troubles - and you already might have freezed other systems apps by 
having them accessing your 'low-prio' volumes....

And how you will be solving 'unfreezing' in cases thin-pool usage drops down 
is also pretty interesting topic on its own...

I need to wish good luck when you will be testing and developing all this 
machinery.

>> Default is to auto-extend thin-data & thin-metadata when needed if you
>> set threshold bellow 100%.
> 
> Q: In a 100% filled up pool, are snapshots still going to be valid?
> 
> Could it be useful to have a default policy of dropping snapshots at high 
> consumption? (ie. 99%). But it doesn't have to be default if you can easily 
> configure it and the scripts are available.

All snapshots/thins with 'fsynced' data are always secure.
Thin-pool is protecting all user-data on disk.

The only lost data are those flying in your memory (unwritten on disk).
And depends on you 'page-cache' setup how much that can be...


Regards


Zdenek
