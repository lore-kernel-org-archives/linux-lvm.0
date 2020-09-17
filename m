References: <2d496550-4609-0a26-489b-8721737c783b@redhat.com>
	<257A9B1C-04AC-4EDE-9671-9E7A60104F9F@gmail.com>
	<fad39006-f18f-d15e-b29b-bb7f59a33be1@redhat.com>
	<cf779b76e25707b8ec3361f55318a1c7@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <39ab5393-7667-901c-f2a1-f25f40d057f2@redhat.com>
Date: Thu, 17 Sep 2020 21:32:07 +0200
MIME-Version: 1.0
In-Reply-To: <cf779b76e25707b8ec3361f55318a1c7@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvm limitations
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>
Cc: =?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>

Dne 16. 09. 20 v 0:26 Gionatan Danti napsal(a):
> Il 2020-09-15 23:47 Zdenek Kabelac ha scritto:
>> Speaking of thin volumes - there can be at most 2^24 thin devices
>> (this is hard limit you've ask for ;)) - but you have only� ~16GiB of
>> metadata to store all of them - which gives you ~1KiB of data per such
>> volume -
>> quite frankly this is not too much� - unless as said - your volumes
>> are not changed at all - but then why you would be building all this...
>>
>> That all said -� if you really need that intensive amount of snapshoting,
>> lvm2 is likely not for you - and you will need to build something on your own,
>> as you will need way more efficient and 'targeted' solution for your purpose.
> 
> Thinvols are not activated by default - this means it should be not a big 
> problem managing some hundreds of them, as the OP ask. Or am I missing something?

Hundreds should be 'fine' - but hundred thousands does mean the lvm2 metadata 
will reach GiB range - and this is definitely NOT fine ;)  - since you would 
probably need around way more RAM to even manages this ;) and I'm not talking
about some places with O^2 complexity in the lvm2 code...

The metadata format is simply not going to fly here...

Zdenek
