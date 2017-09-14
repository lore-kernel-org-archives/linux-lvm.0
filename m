Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 656D66017A
	for <linux-lvm@redhat.com>; Thu, 14 Sep 2017 05:59:09 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC04B806A1
	for <linux-lvm@redhat.com>; Thu, 14 Sep 2017 05:59:05 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id E67FD4062A4A
	for <linux-lvm@redhat.com>; Thu, 14 Sep 2017 07:59:03 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 14 Sep 2017 07:59:04 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <595ff1d4-3277-ca5e-a18e-d62eaaf0b1a0@redhat.com>
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
Message-ID: <9aa2d67c38af3e4042bd3f37559b799d@xenhideout.nl>
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
To: linux-lvm@redhat.com

Zdenek Kabelac schreef op 13-09-2017 21:35:

> We are moving here in right direction.
> 
> Yes - current thin-provisiong does not let you limit maximum number of
> blocks individual thinLV can address (and snapshot is ordinary thinLV)
> 
> Every thinLV can address  exactly   LVsize/ChunkSize  blocks at most.

So basically the only options are allocation check with asynchronously 
derived intel that might be a few seconds late, as a way to execute some 
standard and general "prioritizing" policy, and an interventionalist 
policy that will (fs)freeze certain volumes depending on admin knowledge 
about what needs to happen in his/her particular instance.

>> This is part of the problem: you cannot calculate in advance what can 
>> happen, because by design, mayhem should not ensue, but what if your 
>> predictions are off?
> 
> Great - 'prediction' - we getting on the same page -  prediction is
> big problem....

Yes I mean my own 'system' I generally of course know how much data is 
on it and there is no automatic data generation.

Matthew Patton referenced quotas in some email, I didn't know how to do 
it as quickly when I needed it so I created a loopback mount from a 
fixed sized container to 'solve' that issue when I did have an 
unpredictable data source... :p.

But if I do create snapshots (which I do every day) when the root and 
boot snapshots fill up (they are on regular lvm) they get dropped which 
is nice, but particularly the big data volume if I really were to move a 
lot of data around I might need to first get rid of the snapshots or 
else I don't know what will happen or when.

Also my system (yes I am an "outdated moron") does not have thin_ls tool 
yet so when I was last active here and you mentioned that tool (thank 
you for that, again) I created this little script that would give me 
also info:

$ sudo ./thin_size_report.sh
[sudo] password for xen:
Executing self on linux/thin
Individual invocation for linux/thin

     name               pct       size
     ---------------------------------
     data            54.34%     21.69g
     sites            4.60%      1.83g
     home             6.05%      2.41g
     --------------------------------- +
     volumes         64.99%     25.95g
     snapshots        0.09%     24.00m
     --------------------------------- +
     used            65.08%     25.97g
     available       34.92%     13.94g
     --------------------------------- +
     pool size      100.00%     39.91g

The above "sizes" are not volume sizes but usage amounts.

And the % are % of total pool size.

So you can see I have 1/3 available on this 'overprovisioned' thin pool 
;-).


But anyway.


>> Being able to set a maximum snapshot size before it gets dropped could 
>> be very nice.
> 
> You can't do that IN KERNEL.
> 
> The only tool which is able to calculate real occupancy - is
> user-space thin_ls tool.

Yes my tool just aggregated data from "lvs" invocations to calculate the 
numbers.

If you say that any additional allocation checks would be infeasible 
because it would take too much time per request (which still seems odd 
because the checks wouldn't be that computation intensive and even for 
100 gigabyte you'd only have 25.000 checks at default extent size) -- of 
course you asynchronously collect the data.

So I don't know if it would be *that* slow provided you collect the data 
in the background and not while allocating.

I am also pretty confident that if you did make a policy it would turn 
out pretty good.

I mean I generally like the designs of the LVM team.

I think they are some of the most pleasant command line tools anyway...

But anyway.

On the other hand if all you can do is intervene in userland, then all 
LVM team can do is provide basic skeleton for execution of some standard 
scripts.

> So all you need to do is to use the tool in user-space for this task.

So maybe we can have an assortment of some 5 interventionalist policies 
like:

a) Govern max snapshot size and drop snapshots when they exceed this
b) Freeze non-critical volumes when thin space drops below aggegrate 
values appropriate for the critical volumes
c) Drop snapshots when thin space <5% starting with the biggest one
d) Also freeze relevant snapshots in case (b)
e) Drop snapshots when exceeding max configured size in case of 
threshold reach.

So for example you configure max size for snapshot. When snapshots 
exceeds size gets flagged for removal. But removal only happens when 
other condition is met (threshold reach).

So you would have 5 different interventions you could use that could be 
considered somewhat standard and the admit can just pick and choose or 
customize.


> This is the main issue - these 'data' are pretty expensive to 'mine'
> out of data structures.

But how expensive is it to do it say every 5 seconds?


> It's the user space utility which is able to 'parse' all the structure
> and take a 'global' picture. But of course it takes CPU and TIME and
> it's not 'byte accurate'  -  that's why you need to start act early on
> some threshold.

I get that but I wonder how expensive it would be to do that 
automatically all the time in the background.

It seems to already happen?

Otherwise you wouldn't be reporting threshold messages.

In any case the only policy you could have in-kernel would be either 
what Gionatan proposed (fixed reserved space for certain volumes) (easy 
calculation right) or potentially allocation freeze at threshold for 
non-critical volumes,


I say you only implement per-volume space reservation, but anyway.

I just still don't see how one check per 4MB would be that expensive 
provided you do data collection in background.

You say size can be as low as 64kB... well.... in that case...

You might have issues.



But in any case,

a) For intervention, choice is between customization by code and 
customization by values.
b) Ready made scripts could take values but could also be easy to 
customize
c) Scripts could take values from LVM config or volume config but must 
be easy to know/change/know about.

d) Scripts could document where to set the values.

e) Personally I would do the following:

    a) Stop snapshots from working when a threshold is reached (95%) in a 
rapid fasion

    or

    a) Just let everything fill up as long as system doesn't crash

    b) Intervene to drop/freeze using scripts, where

       1) I would drop snapshots starting with the biggest one in case of 
threshold reach (general)

       2) I would freeze non-critical volumes ( I do not write to 
snapshots so that is no issue ) when critical volumes reached safety 
threshold in free space ( I would do this in-kernel if I could ) ( But 
Freezing In User-Space is almost the same ).

       3) I would shrink existing volumes to better align with this 
"critical" behaviour because now they are all large size to make moving 
data easier

       4) I would probably immediately implement these strategies if the 
scripts were already provided

       5) Currently I already have reporting in place (by email) so I 
have no urgent need myself apart from still having an LVM version that 
crashes

f) For a critical volume script, it is worth considering that small 
volumes are more likely to be critical than big ones, so this could also 
prompt people to organize their volumes in that way, and have a standard 
mechanism to first protect the free space of smaller volumes against all 
of the bigger ones, then the next up is only protected against ITS 
bigger ones, and so on.

Basically when you have Big, Medium and Small, Medium is protected 
against Big, and Small is protected against both others.

So the Medium protection is triggered sooner because it has a higher 
space need compared to the Small volume, so Big is frozen before Medium 
is frozen.

So when space then runs out, first Big is frozen, and when that doesn't 
help, in time Medium is also frozen.

Seems pretty legit I must say.

And this could be completely unconfigured, just a standard recipe using 
for configuration only the percentage you want to use.

Ie. you can say I want 5% free on all volumes from the top down, and 
only the biggest one isn't protected, but all the smaller ones are.

If several are the same size you lump them together.

Now you have a cascading system in which if you choose this script, you 
will have "Small ones protected against Big ones" protection in which 
you really don't have to set anything up yourself.

You don't even have to flag them as critical...

Sounds like fun to make in any case.


g) There is a little program called "pam_shield" that uses 
"shield_triggers" to select which kind of behaviour the user wants to 
use in blocking external IPs. It provides several alternatives such as 
IP routing block (blackhole) and iptables block.

You can choose which intervention you want. The scripts are already 
provided. You just have to select the one you want.


>> And to ensure that this is default behaviour?
> 
> Why you think this should be default ?
> 
> Default is to auto-extend thin-data & thin-metadata when needed if you
> set threshold bellow 100%.

Q: In a 100% filled up pool, are snapshots still going to be valid?

Could it be useful to have a default policy of dropping snapshots at 
high consumption? (ie. 99%). But it doesn't have to be default if you 
can easily configure it and the scripts are available.

So no, if the scripts are available and the system doesn't crash as you 
say it doesn't anymore, there does not need to be a default.

Just documented.

I've been condensing this email.

You could have a script like:

#!/bin/bash

# Assuming $1 is the thin pool I am getting executed on, that $2 is the 
threshold that
# has been reached, and $3 is the free space available in pool

MIN_FREE_SPACE_CRITICAL_VOLUMES_PCT=5

1. iterate critical volumes
2. calculate needed free space for those volumes based on above value
3. check against the free space in $3

4. perform action

Well I am not saying anything new here compared to Brassow Jonathan.

But it could be that simple to have a script you don't even need to 
configure.

More sophisticated then would be a big vs small script in which you 
don't even need to configure the critical volumes.

So to sum up my position is still:

a) Personally I would still prefer in-kernel protection based on quotas
b) Personally I would not want anything else from in-kernel protection
c) No other policies than that in the kernel
d) Just allocation block based on quotas based on lazy data collection

e) If people really use 64kB chunksizes and want max performance then 
it's not for them
f) The analogy of the aeroplane that runs out of fuel and you have to 
choose which passengers to eject does not apply if you use quotas.

g) I would want more advanced policy or protection mechanisms 
(intervention) in userland using above ideas.

h) I would want inclusion of those basic default scripts in LVM upstream

i) The model of "shield_trigger" of "pam_shield" is a choice between 
several default interventions


> We can discuss if it's good idea to enable auto-extending by default -
> as we don't know if the free space in VG is meant to be used for
> thin-pool or there is some other plan admin might have...

I don't think you should. Any admin that uses thin and that intends to 
auto-extend, will be able to configure so anyway.

When I said I wanted default, it is more like "available by default" 
than "configured by default".

Using thin is a pretty conscious choice.

As long as it is easy to activate protection measures, that is not an 
issue and does not need to be default imo.

Priorities for me:

1) Monitoring and reporting
2) System could block allocation for critical volumes
3) I can drop snapshots starting with the biggest one in case of <5% 
pool free
4) I can freeze volumes when space for critical volumes runs out

Okay sending this now. I tried to summarize.

See ya.
