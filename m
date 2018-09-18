References: <c0a0c50159e74ffc44bf813b82673f1b@tudorholton.com>
	<a032c5fd-5381-49f3-0b16-a9baac9b5e43@redhat.com>
	<086f04e0e43d27d5637a7516c4a27877@tudorholton.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <3f93f978-235f-214c-09cf-2b839b6048a3@redhat.com>
Date: Tue, 18 Sep 2018 11:14:02 +0200
MIME-Version: 1.0
In-Reply-To: <086f04e0e43d27d5637a7516c4a27877@tudorholton.com>
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



On 09/18/2018 01:41 AM, tudor@tudorholton.com wrote:
> --------snip------
>> We do have a constraint in lvm2 to require the raid6 minimum for N to 
>> be 3.
>>
>> Configuring a raid6 LV (an array by MD terms) with 2 data stripes is
>> suboptimal for performance,
>> because data striping is minimal in this case.  In addition, the
>> metadata overhead is maximal
>> for parity, P- and Q-syndromes being half of the brutto size of the 
>> raid6 LV.
>>
> My apologies.  I googled "brutto size" but came up with nothing. I do 
> have a basic understanding of P and Q syndromes so I think I have a 
> vague understanding of your meaning.

I have to apologize, I meant gross size

>
> I understand it's suboptimal, but not non-existent.  In particular why 
> is this a restriction and not just a warning?

The lvm2 code assumes data stripes to be more than parity/syndrome stripes.

>
> Performance aside, I could also argue that there's a use case for a 
> minimal (and not degraded) set before expansion.

Sure you could,  when expansion is planned one can create the raid6 set 
with the intended total stripes though.

That aside, this is a constraint for such use cases and we may 
eventually get rid of it.

Regards,
Heinz

>
>
> Cheers,
> Tudor.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
