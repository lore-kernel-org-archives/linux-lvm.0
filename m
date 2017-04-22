References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <6dd12ab9-0390-5c07-f4b7-de0d8fbbeacf@redhat.com>
Date: Sat, 22 Apr 2017 23:17:42 +0200
MIME-Version: 1.0
In-Reply-To: <b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
To: Xen <list@xenhideout.nl>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 22.4.2017 v 18:32 Xen napsal(a):
> Gionatan Danti schreef op 22-04-2017 9:14:
>> Il 14-04-2017 10:24 Zdenek Kabelac ha scritto:
>>> However there are many different solutions for different problems -
>>> and with current script execution - user may build his own solution -
>>> i.e.  call
>>> 'dmsetup remove -f' for running thin volumes - so all instances get
>>> 'error' device   when pool is above some threshold setting (just like
>>> old 'snapshot' invalidation worked) - this way user will just kill
>>> thin volume user task, but will still keep thin-pool usable for easy
>>> maintenance.
>>>
>>
>> This is a very good idea - I tried it and it indeed works.
> 
> So a user script can execute dmsetup remove -f on the thin pool?
> 
> Oh no, for all volumes.
> 
> That is awesome, that means a errors=remount-ro mount will cause a remount right?

Well 'remount-ro' will fail but you will not be able to read anything
from volume as well.

So as said - many users many different solutions are needed...

Currently lvm2 can't support that much variety and complexity...


> 
>> However, it is not very clear to me what is the best method to monitor
>> the allocated space and trigger an appropriate user script (I
>> understand that versione > .169 has %checkpoint scripts, but current
>> RHEL 7.3 is on .166).
>>
>> I had the following ideas:
>> 1) monitor the syslog for the "WARNING pool is dd.dd% full" message;
> 
> This is what my script is doing of course. It is a bit ugly and a bit messy by 
> now, but I could still clean it up :p.
> 
> However it does not follow syslog, but checks periodically. You can also 
> follow with -f.
> 
> It does not allow for user specified actions yet.
> 
> In that case it would fulfill the same purpose as > 169 only a bit more poverly.
> 
>> One more thing: from device-mapper docs (and indeed as observerd in my
>> tests), the "pool is dd.dd% full" message is raised one single time:
>> if a message is raised, the pool is emptied and refilled, no new
>> messages are generated. The only method I found to let the system
>> re-generate the message is to deactiveate and reactivate the thin pool
>> itself.
> 
> This is not my experience on LVM 111 from Debian.
> 
> For me new messages are generated when:
> 
> - the pool reaches any threshold again
> - I remove and recreate any thin volume.
> 
> Because my system regenerates snapshots, I now get an email from my script 
> when the pool is > 80%, every day.
> 
> So if I keep the pool above 80%, every day at 0:00 I get an email about it :p. 
> Because syslog gets a new entry for it. This is why I know :p.

The explanation here is simple - when you create a new thinLV - there is 
currently full suspend - and before 'suspend' pool is 'unmonitored'
after resume again monitored - and you get your warning logged again.


Zdenek
