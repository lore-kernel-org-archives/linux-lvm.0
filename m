References: <1643811.X513TT2pbd@localhost.localdomain>
	<dff2c51f-70a9-3339-6fe8-06091608b572@redhat.com>
	<bdaefe2a481fb2f830153dbef1496f16@assyoma.it>
	<c175cc56-252b-d349-ebec-85e3683a7773@redhat.com>
	<d3cc86165ae3e27950b359dbf4eae1fe@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <9f9cc0bb-46b3-8b41-8532-48687af7d47d@redhat.com>
Date: Tue, 23 Jun 2020 23:53:13 +0200
MIME-Version: 1.0
In-Reply-To: <d3cc86165ae3e27950b359dbf4eae1fe@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Removing VG mappings using dmsetup tool
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
Cc: nsoffer@redhat.com, Vojtech Juranek <vjuranek@redhat.com>

Dne 23. 06. 20 v 23:34 Gionatan Danti napsal(a):
> Il 2020-06-23 23:02 Zdenek Kabelac ha scritto:
>> Hi
>>
>> ATM skilled admin can always easily enforce:
>>
>> 'dmsetup remove --force�� vg-lv'
> 
> Hi Zdenek,
> sure, but I find messing with dmsetup more error prone than using an LVM command.
> 
>> for i.e. linear devices to achieve this goal - however resolving this
>> at lvm2 is actually way more complex task when you start to consider
>> the situation
>> should be at least 'somehow' recoverable - it's quite complicated and
>> not really highly demanded functionality.
>> It's more simple if you have constrained world of known types of devices
>> and known use-case you are targeting to solve.
> 
> Would be an initial minimal support userful? For example, something as 
> "lvchange --error vg/lvm" which will only work on simple setup, while on more 
> complex ones would simply print a warning and return with exit code 1.
> 

There are 'couple' issue -

a) it would be nice to have this 'change' permanent ->  metadata update ->
but likely this user runs when some devices got missing - so lots of related 
trouble with 'MISSING' devices and metadata update.

b) when this would be only '--replacewitherror  y|n'  lvchange modifier - then
with next i.e. lvchange --refresh (or any other 'transient' table update) you 
get very same problematic reference of original PV.

c) it's unclear if we want to actually provide this as 'lvremove' feature - as
IMHO when 'error' replacement is required  - the most cleanest proceed is to 
never use this device again -  and ATM you can't  remove  'device' in use -
but with this kind of support we could probably migrate such device into
just 'error' placeholders (removable once devices are unused)  and space would
be relased in VG  (this would be probably my favorite path to add support
for this kind of forcible removal of used LV).

Regards

Zdenek
