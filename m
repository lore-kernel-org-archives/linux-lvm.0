References: <3f51904f43c45f8c1259f1b050402358@assyoma.it>
	<5070f4fa-81ad-9c9a-b0a7-8d5463ea09d3@redhat.com>
	<056d2d5dd9a7846a56971ce5f4cb3537@assyoma.it>
	<4f98430e-f6eb-b7b7-d1b0-f54ad07361de@redhat.com>
	<7725f4635181d25b6dda227b7e7a39cb@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <281eb21d-2fae-ec6f-c30e-b7d30d53b8f1@redhat.com>
Date: Thu, 17 Sep 2020 23:46:26 +0200
MIME-Version: 1.0
In-Reply-To: <7725f4635181d25b6dda227b7e7a39cb@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvmcache with vdo - inconsistent block size
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
To: Gionatan Danti <g.danti@assyoma.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 17. 09. 20 v 23:41 Gionatan Danti napsal(a):
> Il 2020-09-17 21:27 Zdenek Kabelac ha scritto:
>> You've most likely found the bug and this should be likely disable
>> (and enabled only with some force option).
> 
> Hi Zdenek, I am not sure about what bug I found - can you be more explicit?
> 
>> Problem is, when such device stack is used for XFS - where the
>> 'geometry' changes, but for some other it's not a big issue (i.e.
>> ext4).

XFS doesn't like when 4K device becomes 512b sector based.


> Again, I am not sure about what we are speaking - generic thinlvm over VDO, or 
> about the caching issue discussed before? Why this should be an issue for XFS 
> vs EXT4? From RH docs, I can see VDO + thinlvm + XFS as being fully supported.

Here you are using separate level of tooling - so you have separate dealing
with errors on each device with its own tooling.

lvm2 is not yet capable to handle this stack on its own.

> 
> I'll do, but I first need to understand the core issue better.

Create XFS on 4K sector device - copy it on 512b and use it.

Zdenek
