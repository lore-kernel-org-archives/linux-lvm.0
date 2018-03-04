References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
	<6dd12ab9-0390-5c07-f4b7-de0d8fbbeacf@redhat.com>
	<3831e817d7d788e93a69f20e5dda1159@xenhideout.nl>
	<0ab1c4e1-b15e-b22e-9455-5569eeaa0563@redhat.com>
	<51faeb921acf634609b61bff5fd269d4@xenhideout.nl>
	<4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
	<bd9a12f33412163e9c65b4a9b78eeb4f@xenhideout.nl>
	<6dd3a268-8a86-31dd-7a0b-dd08fdefdd55@redhat.com>
	<9142007eeb745a0f4774710b7c007375@assyoma.it>
	<bef0781efb3940275a1b4d2e88848924@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <04498dc3-5030-079d-743f-69f40176fddf@redhat.com>
Date: Sun, 4 Mar 2018 21:53:17 +0100
MIME-Version: 1.0
In-Reply-To: <bef0781efb3940275a1b4d2e88848924@xenhideout.nl>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 3.3.2018 v 19:17 Xen napsal(a):

>> In the past was argued that putting the entire pool in read-only mode
>> (where *all* writes fail, but read are permitted to complete) would be
>> a better fail-safe mechanism; however, it was stated that no current
>> dmtarget permit that.
> 
> Right. Don't forget my main problem was system hangs due to older kernels, not 
> the stuff you write about now.
> 
>> Two (good) solution where given, both relying on scripting (see
>> "thin_command" option on lvm.conf):
>> - fsfreeze on a nearly full pool (ie: >=98%);
>> - replace the dmthinp target with the error target (using dmsetup).
>>
>> I really think that with the good scripting infrastructure currently
>> built in lvm this is a more-or-less solved problem.
> 
> I agree in practical terms. Doesn't make for good target design, but it's good 
> enough, I guess.

Sometimes you have to settle on the good compromise.

There are various limitation coming from the way how Linux kernel works.

You probably still have 'vision' the block devices KNOWS from where the block 
comes from. I.E. you probably think  thin device is aware block is some 
'write' from  'gimp' made by user 'adam'.  The clear fact is - block layer 
only knows some 'pages' with some sizes needs to be written at some location 
on device - and that's all.

On the other hand all common filesystem in linux were always written to work 
on a device where the space is simply always there. So all core algorithms 
simple never counted with something like 'thin-provisioning' - this is almost 
'fine' since thin-provisioning should be almost invisible - but the problem 
starts to be visible on this over-provisioned conditions.

Unfortunately majority of filesystem never really tested well all those 
'weird' conditions which are suddenly easy to trigger with thin-pool, but 
likely almost never happens on real hdd....

So as said - situation gets better all the time, bugs are fixed as soon as the 
problematic pattern/use case is discovered - that's why it's really important 
users are opening bugzillas and report their problems with detailed 
description how to hit their problem - this really DOES help a lot.

On the other hand it's really hard to do something for users how are
just saying  'goodbye to LVM'....


>> But is someone *really* pushing thinp for root filesystem? I always
>> used it for data partition only... Sure, rollback capability on root
>> is nice, but it is on data which they are *really* important.
> 
> No, Zdenek thought my system hangs resulted from something else and then in 
> order to defend against that (being the fault of current DM design) he tried 
> to raise the ante by claiming that root-on-thin would cause system failure 
> anyway with a full pool.

Yes - this is still true.
It's a core logic of linux kernel and pages caching works.

And that's why it's important to take action *BEFORE* then trying to solve the 
case *AFTER* and hope the deadlock will not happen...


> I was envisioning some other tag that would allow a quotum to be set for every 
> volume (for example as a %) and the script would then drop the volumes with 
> the larger quotas first (thus the larger snapshots) so as to protect smaller 
> volumes which are probably more important and you can save more of them. I am 
> ashared to admit I had forgotten about that completely ;-).

Every user has quite different logic in mind - so really - we do provide 
tooling and user has to choose what fits bets...

Regards

Zdenek
