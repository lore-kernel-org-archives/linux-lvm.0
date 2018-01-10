References: <bc1ccc58-1771-183b-2d40-1d8b198fb8b5@suse.com>
	<20180109160622.GB24472@redhat.com>
	<0c7ad5f6-0399-e890-0205-281c0b9b9405@suse.com>
	<e644fe30-4a22-225e-9f70-1d8bc48b5d7e@redhat.com>
From: Eric Ren <zren@suse.com>
Message-ID: <04ad2444-ad44-3442-42cb-36b1ed18e484@suse.com>
Date: Wed, 10 Jan 2018 22:42:08 +0800
MIME-Version: 1.0
In-Reply-To: <e644fe30-4a22-225e-9f70-1d8bc48b5d7e@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [linux-lvm] The benefits of lvmlockd over clvmd?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

Zdenek,

Thanks for helping make this more clear to me :)

>
> There are couple fuzzy sentences - so lets try to make them more clear.
>
> Default mode for 'clvmd' is to 'share' resource everywhere - which 
> clearly comes from original 'gfs' requirement and 'linear/striped' 
> volume that can be easily activated on many nodes.
>
> However over the time - different use-cases got more priority so 
> basically every new  dm target (except mirror) does NOT support shared 
> storage (maybe raid will one day...).   So targets like snapshot, 
> thin, cache, raid  do require 'so called' exclusive activation.

Good to know the history about clvmd :)

>
> So here comes the difference -  lvmlockd  in its default  goes with 
> 'exclusive/local' activation and shared (old clvmd default) needs to 
> be requested.
>
> Another difference is -   'clvmd' world is 'automating' activation 
> around the whole cluster (so from node A it's possible to activate 
> volume on node B without ANY other command then 'lvchange).
>
> With 'lvmlockd' mechanism - this was 'dropped' and it's users 
> responsibility to initiate i.e. ssh command with activation on another 
> node(s) and resolve error handling.
>
> There are various pros&cons over each solution - both needs setups and 
> while 'clvmd' world is  'set & done'  lvmlockd world scripting needs 
> to be born in some way.

True.

> Also ATM  'lvmetad' can't be used even with lvmlockd - simply because 
> we are not (yet) capable to handle 'udev' around the cluster (and it's 
> not clear we ever will).

This sentence surprises me much. According to manpage of lvmlockd, it 
seems clear that lvmlockd can work with lvmetad now.
IIRC, it's not the first time you mentioned about "cluster udev". It 
gives me a impression that the currect udev system is not
100% reliable for shared disks in cluster, no matter if we use lvmetad 
or not, right? If so, could you please give an example
scenario where lvmetad may not work well with lvmlockd?

>
> On the positive side - we are working hard to enhance 'scanning' speed 
> - so in majority of use-cases there is no real performance gain with 
> lvmetad usage anyway.

Great! Thanks.

Regards,
Eric
