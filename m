References: <CAKM4Aexk-=PBRMCUvXwzHxXzWCbYL22dSo+uHFXaasVCVuKddA@mail.gmail.com>
	<CAKM4AexhaSRAv4=aiuFpwHeB30eYrHr5PgktM9Ef67Y84M30Fw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c124b73e-1941-00bf-f57a-cb140d0c401b@redhat.com>
Date: Fri, 25 Jan 2019 22:47:19 +0100
MIME-Version: 1.0
In-Reply-To: <CAKM4AexhaSRAv4=aiuFpwHeB30eYrHr5PgktM9Ef67Y84M30Fw@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Question about thin-pool/thin LV with stripes
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Eric Ren <renzhengeek@gmail.com>

Dne 24. 01. 19 v 15:54 Eric Ren napsal(a):
> Hi,
> 
>     As you can see, only "mythinpool_tdata" LV has 2 stripes. Is that OK?
>     If I want to benefit performance from stripes, will it works for me? Or,
>     should I create dataLV, metadata LV, thinpool and thin LV using
>     step-by-step way
>     and specify "--stripes 2" in every steps?
> 
> 
> With single command to create thin-pool, the metadata LV is not created with 
> striped
> target. Is this designed on purpose, or just the command doesn't handle this 
> case very
> well for now?
> 

Hi

Yes this on purpose currently.

When you create 'thin-pool' - you are mostly specifying options for 'DATA' 
volume. The allocation of metadata is using 'internals' to pick the place
and other properties -  we can maybe introduce some policy option
to make metadata raid1 or striped or something like that.

ATM it's not so easy to do the best possible allocation - so
for skilled admin - it's always most 'secure' to build pool
from bricks - data LV + meta LV.

The automatic allocation will get enhanced over the time - but it's
always somewhere 'fuzzy' what is going to be the results.

Basically - what is 'unspecified' on command line and left for lvm2 to figure 
out - may change between releases - if we consider there is better solution.

Zdenek
