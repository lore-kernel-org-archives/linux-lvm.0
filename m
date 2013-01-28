Message-ID: <51068238.1090809@redhat.com>
Date: Mon, 28 Jan 2013 14:50:48 +0100
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <20130124155312.GA10563@daedalus.cslab.ece.ntua.gr>
	<20130124180834.GA3122@agk-dp.fab.redhat.com>
	<51017F0C.20100@bmsi.com>
	<20130124234235.GB3122@agk-dp.fab.redhat.com>
	<20130125084410.GB10563@daedalus.cslab.ece.ntua.gr>
In-Reply-To: <20130125084410.GB10563@daedalus.cslab.ece.ntua.gr>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Sparse LVs, --virtualsize equal to --size
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
Cc: synnefo-devel@googlegroups.com, Vangelis Koukis <vkoukis@grnet.gr>

On 01/25/2013 09:44 AM, Vangelis Koukis wrote:
> On Thu, Jan 24, 2013 at 11:42:35pm +0000, Alasdair G Kergon wrote:
>> So look at thin provisioning with its zeroing option.
>> External origin.  (support currently being added to lvm)
>>
>> Or this not-yet-upstream target:
>> http://people.redhat.com/agk/patches/linux/editing/dm-add-zeroed-target.patch
>>
>> Alasdair
>
> Thanks Alasdair,
>
> this seems to fit the bill perfectly, it's a shame it's
> not yet merged upstream.
>
> Until then, if we are to go with the "snapshot-over-the-zero-target"
> route, can you comment on quantifying the space overhead of tracking
> chunks in the snapshot?

Beware! Large old-style snapshots may take a very long time to 
activate[1] (reportedly up to few hours) and my guess is many smaller 
snapshots will behave the same[2], the total amount of chunks written to 
all snapshots being the key to slow start...

You should definitely try it with your workflow before going too far 
that direction.

[1]Just search for 'lvm large snapshot'. Someone here may be able to 
point you to a more complete data.

[2] Not even trying to think about many larger ones as your usecase 
suggests: just update kernel and java few times and with journal FS you 
will soon be at few gigabytes per VM.

-- Marian

>
> Thanks again,
> Vangelis.
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
