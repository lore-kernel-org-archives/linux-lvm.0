MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 03 Jun 2019 21:23:39 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <20190603132327.GA32187@reti>
References: <93f53408-2f37-dec3-5c68-deef021f530c@assyoma.it>
	<20190603132327.GA32187@reti>
Message-ID: <512bbf893225a1b4f6897b7540b09d1c@assyoma.it>
Subject: Re: [linux-lvm] =?utf-8?q?Fast_thin_volume_preallocation=3F?=
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Joe Thornber <thornber@redhat.com>

Il 03-06-2019 15:23 Joe Thornber ha scritto:
> On Fri, May 31, 2019 at 03:13:41PM +0200, Gionatan Danti wrote:
> 
>> - does standard lvmthin support something similar? If not, how do you 
>> see a
>> zero coalesce/compression/trim/whatever feature?
> 
> There isn't such a feature as yet.

Ok, so the NAS vendor did something custom/proprietary. This is a reason 
why I do *not* like such devices: how much testing and verification are 
done before and after such customization? Not a lot, I would say.

> With the next iteration of thin I'd like to
> get away from the fixed allocation block sizes that we're using which
> should greatly
> reduce the number of mappings that we need to create to provision a
> thick volume and
> so speed it up a lot.

Interesting. Do you plan to have an dynamic chunk size bound to some 
minumum/maximum? If so, how do you plan to tackle situations where a 
single big chunk should be split due to a small CoW write happening 
inside the big chunk? Example: a 128MB chunk-sized thin LV which is 
snapshotted and a small 4K writes happening at offset 32M from chunk 
start.

> Presumably you want a thick volume but inside a thin pool so that you
> can used snapshots?
> If so have you considered the 'external snapshot' feature?

Yes, in some cases they are quite useful. Still, a fast volume 
allocation can be an handy addition.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
