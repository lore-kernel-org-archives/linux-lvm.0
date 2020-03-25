References: <CACRKOwz_fOJiTVhbUqJR_EaxrKbf2bk+wb6LYOy0yWDkvt+buw@mail.gmail.com>
	<20200323082608.7i6wzq2t3k24hzun@reti>
	<7931a754-cf8e-eb6c-adf1-d54784dbf73f@redhat.com>
	<CACRKOwzT2qk_wWNo5m_ZeKa-S6ZoXSxPhJhQVGceNVDzmKu-GQ@mail.gmail.com>
	<7a6785c5-61b6-e398-293d-795ddc48e406@redhat.com>
	<3b205fe6a822fc4e33053985ed8ed51d@assyoma.it>
	<4f10a1a7-0dc4-0e66-641d-62176f26614e@redhat.com>
	<da1ff669e1f69c4f02c10dc4726190d9@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <26bc2a80-466c-18d5-2d7f-4877c05e172c@redhat.com>
Date: Wed, 25 Mar 2020 09:55:10 +0100
MIME-Version: 1.0
In-Reply-To: <da1ff669e1f69c4f02c10dc4726190d9@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] when bringing dm-cache online,
	consumes all memory and reboots
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Gionatan Danti <g.danti@assyoma.it>
Cc: Scott Mcdermott <scott@smemsh.net>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 24. 03. 20 v 23:35 Gionatan Danti napsal(a):
> Il 2020-03-24 16:09 Zdenek Kabelac ha scritto:
>> In past we had problem that when users have been using huge chunk size,
>> and small 'migration_threashold' - the cache was unable to demote chunks
>> from the cache to the origin device=EF=BF=BD (the size of 'required' dat=
a for
>> demotion were bigger then what has been allowed by threshold).
>>
>> So lvm2/libdm implemented protection to always set at least 8 chunks
>> is the bare minimum.
>>
>> Now we face clearly the problem from 'the other side' - users have way
>> too big chunks (we've seen users with 128M chunks) - and so threshold
>> is set to 1G
>> and users are facing serious bottleneck on the cache side doing to many
>> promotions/demotions.
>>
>> We will likely fix this by setting max chunk size somewhere around 2MiB.=
 >
> Thanks for the explanation. Maybe is a naive proposal, but can't you simp=
ly=20
> set migration_threshold equal to a single chunk for >2M sized chunks, and=
 8=20
> chunks for smaller ones?

Using large cache chunks likely degrades the usefulness and purpose of cach=
e.
Though we are missing some comparative tables showing how the
optimal layouts should look like.

So the idea is not to just 'let it somehow work' but rather to move it towa=
rds
more efficient usage of available resources.

Zdenek
