References: <c0a0c50159e74ffc44bf813b82673f1b@tudorholton.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <a032c5fd-5381-49f3-0b16-a9baac9b5e43@redhat.com>
Date: Mon, 17 Sep 2018 14:41:44 +0200
MIME-Version: 1.0
In-Reply-To: <c0a0c50159e74ffc44bf813b82673f1b@tudorholton.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-MW
Subject: Re: [linux-lvm] (Why) Does lvmcreate --raid6 need 5 drives?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, tudor@tudorholton.com

On 09/17/2018 01:36 AM, tudor@tudorholton.com wrote:
> This question was originally put on ServerFault here: 
> https://serverfault.com/questions/931150/why-does-lvmraid6-need-5-drives
>
> I'm investigating using LVMRAID instead of MD+LVM. In my case, I'm 
> looking at a RAID6. As expected, the docs say you need N+1 devices for 
> RAID5, and a minimum of 3 drives. The docs say for RAID 6 you need N+2.
>
> However, it then says that the minimum drives required is 5, which 
> means that N is different.
>
> In an MD RAID6, only 4 drives are required; 2 for striping, 2 for 
> parity. So if I built RAID6+LVM I'd only need 4 drives whereas, 
> according to the docs, I'd need 5 drives for LVMRAID6.  It was my 
> understanding that LVMRAID is really just LVM on MD, so I don't 
> understand the difference.

That's correct.


>
> Thomas on ServerFault pointed out that a minimum of 3 stripes is 
> hardcoded into the source code[1].
>
> But the commit message[2] doesn't seem to indicate a reasoning behind 
> requiring a higher number of striped for RAID6 than RAID5.
>
> Why does LVMRAID need 3 stripes for RAID6 where MD only needs 2?

We do have a constraint in lvm2 to require the raid6 minimum for N to be 3.

Configuring a raid6 LV (an array by MD terms) with 2 data stripes is 
suboptimal for performance,
because data striping is minimal in this case.  In addition, the 
metadata overhead is maximal
for parity, P- and Q-syndromes being half of the brutto size of the 
raid6 LV.

Regards,
Heinz

>
> Cheers,
> Tudor.
>
> [1] 
> https://sourceware.org/git/?p=lvm2.git;a=blob;f=tools/lvcreate.c;h=3c22794b6f1c3cbd155df65421de21dac0bfa9fc;hb=HEAD#l528
> [2] 
> https://sourceware.org/git/?p=lvm2.git;a=commit;f=tools/lvcreate.c;h=ea0f604e704dc8418d962e20529fd1bcddf06bb7
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
