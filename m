References: <da37558c-157c-3817-ca59-96202f615be9@assyoma.it>
	<20170918185551.GB6025@redhat.com>
	<3c3eefcc34a6d322b790d91f63cb9d95@assyoma.it>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <03ce46a8-531e-0b16-b01c-f94e7ae2c6b3@gmail.com>
Date: Mon, 18 Sep 2017 22:08:19 +0200
MIME-Version: 1.0
In-Reply-To: <3c3eefcc34a6d322b790d91f63cb9d95@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Option to silence "WARNING: Sum of all thin volume
 sizes exceeds the size of thin pool"
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>, David Teigland <teigland@redhat.com>

Dne 18.9.2017 v 21:07 Gionatan Danti napsal(a):
> Il 18-09-2017 20:55 David Teigland ha scritto:
>> It's definitely an irritation, and I described a configurable alternative
>> here that has not yet been implemented:
>>
>> https://bugzilla.redhat.com/show_bug.cgi?id=1465974
>>
>> Is this the sort of topic where we should start making use of
>> https://github.com/lvmteam/lvm2/issues ?
> 
> Hi, the proposed solution on BZ entry seems somewhat too "invasive" to me.
> I think it generally is a good idea to warn the users about possibly 
> unexptected behavior (ie: full pool).
> 
> However, for the specific use-case of taking read-only snapshots, something as 
> simple as "--silencepoolsizewarn" flag (or similar configuration variable) 
> would do the trick without distrupting legitimate warnings.
> 


We can possibly print WARNING message only with the 1st. thin LV  which causes 
overprovisioining of thin-pool.

As  for 'read-only' snapshot - it really doesn't matter - the overprovisioned 
pool can in the 'worst' case end in out-of-space condition (i.e. fully 
rewritten origin)

Regards


Zdenek
