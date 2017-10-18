Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DFB977DC0
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2017 15:52:08 +0000 (UTC)
Received: from sonic309-24.consmr.mail.ir2.yahoo.com
	(sonic309-24.consmr.mail.ir2.yahoo.com [77.238.179.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 285C9C047B7B
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2017 15:52:07 +0000 (UTC)
References: <cdc20ea7-200b-d998-a7f5-85ed622e84e2@yahoo.co.uk>
	<23013.8606.182033.796766@quad.stoffel.home>
	<4195b442-7241-1415-64bd-c626e0e7f4ef@yahoo.co.uk>
	<alpine.LRH.2.21.1710171644400.1285@fairfax.gathman.org>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <6067f2f4-587c-cd00-6567-98b8648d463a@yahoo.co.uk>
Date: Wed, 18 Oct 2017 16:52:01 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.1710171644400.1285@fairfax.gathman.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Subject: Re: [linux-lvm] raid10 to raid what? - convert
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
To: LVM general discussion and development <linux-lvm@redhat.com>



On 17/10/17 21:57, Stuart D. Gathman wrote:
> You still haven't said what you are trying to accomplish.  
> I wouldn't
> have bothered responding to such a vague question until 
> you provided
> some tantalizing clues.  Until your lastest clues, I would 
> have advised
> using rsync or dd to copy your data to a new volume.  But 
> now it sounds
> like you ran out of budget for another disk, or need to 
> minimize down
> time, and want to reconfigure in place.
>

gee, with this much enthusiasm I can imagine you solve many 
problems, however I can also imagine at the same time you 
create also problems that do not exists.
but honestly & truthfully appreciate this enthusiasm & help.

> First off, raid10 is a linux specialty (I didn't know LVM 
> supported it,
> thanks!), and is not the same as raid1+0 (raid1 on top of 
> raid0).
> However, your previous clue tells us that probably you 
> have at least 4
> disks in your raid10.  So you should be able to remove 2 
> legs from the
> raid10, and still have the equivalent of a raid0.  But 
> this is not
> certain as raid10 works perfectly well with 2 or 3 disks, 
> including the
> redundancy.  In any case, you can remove at least 1 leg 
> from your
> raid10.  Be sure to backup first in any case.
>
> Now that you've cut the disk used in half (and your data 
> is precariously
> dependent on the health of *both* underlying physical 
> disks), what did
> you want to do next?  Maybe you just want to create a 
> different kind of
> raid with the released space and do that rsync or dd?
>

I'm still looking for an answer - if it's possible then how 
to split raid10 into two raid0 LVs(with perhaps having data 
intact?)
I've been fiddling with --splitmirrors but either I got it 
wrong or I didn't and command just fails.
More than contemplating theories and general knowledge on 
raid I'd prise a lot succinct, concrete info, actuall 
experience of "howto".

But I shall now try my fiddling virtualized way, problem at 
hand I had, I had to solve different way completely.

> On Tue, 17 Oct 2017, lejeczek wrote:
>
>> no other raids but LVM's own.
>> not much in configuration, unless I misunderstand, 
>> question I'm posing is simple - is it possible to 
>> convert/split lvm raid10 LV into two raid0 LVs? (here one 
>> thing comes to mind: data stays intact?) Or raid10 LV to 
>> any other raid?
>>
>> As I sroogled I saw there is "mirror spitting" but term 
>> raid10 does not appear in that context, or I failed to 
>> find it.
>>
>> But man pages also mention, with regards to raid takeover:
>> "..
>>        ·  between striped/raid0 and raid10.
>> ..."
>> So it sounds like possible(so no other raid levels but 
>> these two), only might be intricate process/procedure, 
>> which is not documented, or again, I failed to find it.
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
