References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<e364950a-22fa-6cd2-ed81-2c675b4b3390@suse.com>
	<c53601ab-e003-0c9b-038f-a3f6475a1e6a@redhat.com>
From: Eric Ren <zren@suse.com>
Message-ID: <db8ea14b-afdf-5297-3e38-12ef7bbe4d89@suse.com>
Date: Tue, 12 Sep 2017 05:35:53 +0800
MIME-Version: 1.0
In-Reply-To: <c53601ab-e003-0c9b-038f-a3f6475a1e6a@redhat.com>
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi Zdenek,

> lvm2 is using  upstream community BZ located here:
>
> https://bugzilla.redhat.com/enter_bug.cgi?product=LVM%20and%20device-mapper 
>
>
> You can check RHBZ easily for all lvm2 bZ
> (mixes  RHEL/Fedora/Upstream)
>
> We usually want to have upstream BZ being linked with Community BZ,
> but sometimes it's driven through other channel - not ideal - but 
> still easily search-able.

Yes, it's a place where problems are discussed. Thanks for your reminder :)

> [...snip...]
> It's should be opposite case - unless something regressed recently...
> Easiest is to write out  lvm2 test suite some test.
>
> And eventually bisect which commit broke it...

Good to know! I will find time to test different versions on both 
openSUSE and Fedora.

>
>> - pvmove is slow. I know it's not fault of LVM. The time is almost 
>> spent in DM (the IO dispatch/copy).
>
> Yeah - this is more or less design issue inside kernel - there are
> some workarounds - but since primary motivation was not to overload
> system - it's been left a sleep a bit - since focus gained  'raid' target

Aha, it's a good reason. Ideally, it would be good for pvmove having 
some option to control
the IO rate. I know it's not easy...

> and these pvmove fixes are working with old dm mirror target...
> (i.e. try to use bigger  region_size for mirror in lvm.conf  (over 512K)
> and evaluate performance  - there is something wrong - but core mirror 
> developer is busy with raid features ATM....

Thanks for the suggestion.

>
>
>> - snapshot cannot be used in cluster environment. There is a usecase: 
>> user has a central backup system
>
> Well, snapshot CANNOT work in cluster.
> What you can do is to split snapshot and attach it different volume,
> but exclusive assess is simply required - there is no synchronization 
> of changes like with cmirrord for old mirror....

Got it! Advanced features like snapshot/thinp/dmcache, have their own 
metadata. The payment for having those metadata
changes cluster-aware is painful.

> We do our best....

Like you guys have been always doing, thanks!

Regards,
Eric
