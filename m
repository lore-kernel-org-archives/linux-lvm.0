References: <CA+X5Wn6TiCUp7aEn5Tkc8vpZfET9-7Ke2Wh1GHTOwy3CrMvN+w@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <b82fd1f8-4e13-b98d-5f73-92fca350dfc1@redhat.com>
Date: Thu, 10 Jan 2019 10:31:17 +0100
MIME-Version: 1.0
In-Reply-To: <CA+X5Wn6TiCUp7aEn5Tkc8vpZfET9-7Ke2Wh1GHTOwy3CrMvN+w@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Is "man lvcreate" for "-Z|--zero" incorrectly
	worded?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, james harvey <jamespharvey20@gmail.com>

Dne 10. 01. 19 v 4:05 james harvey napsal(a):
> On lvm2 2.02.183, man lvcreate includes:
> 
> -Z|--zero y|n
>     Controls zeroing of the first 4KiB of data in the new LV.  Default
> is y.  Snapshot COW volumes are always zeroed.  LV is not zeroed if
> the read only flag is set.  Warning: trying to mount an unzeroed LV
> can cause the system to hang.
> 
> This says only the "first 4KiB" is zeroed.
> 
> Yet, when running "lvcreate --chunksize <something large>", it says:
> 
>     WARNING: Pool zeroing and ###.00 MiB large chunk size slows down
> thin provisioning.
>     WARNING: Consider disabling zeroing (-Zn) or using smaller chunk
> size (<512.00 KiB).
> 
> Which seems to indicate it's going to zero the entire newly allocated
> chunk size, rather than only the first 4KiB.
> 

Hi

With thin-pool and thin-volumes -   -Z  has slightly modified meaning.
User controls thin-pool zeroing - it's possible the information got
somewhat lost over the 'man page' rework where it's now fully generated
from the source code.

So with thin-pool --zero means whether zeroing is enabled or skipped for 
provisioned chunks.

With zeroing is skipped  (-Zn) -  there is still ALWAYS 'cleared' initial 
device header - otherwise such device would become unpredictable for the 
system - as unprovisioned chunks always return 'zero' - so i.e. udev device 
scanning may guess it's empty device and later upon write to first chunk - we 
must make sure that at least initial disk header will be zeroed.

That's why user cannot have control over traditional aka 'zeroing for linears' 
behavior here - and we 'overloaded' --zero setting to give it this meaning.

I hope this better explains it  - I'll try to enhance man page - meanwhile
check  'man lvmthin'  Zeroing.

Zdenek.
