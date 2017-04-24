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
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
Date: Mon, 24 Apr 2017 23:59:06 +0200
MIME-Version: 1.0
In-Reply-To: <51faeb921acf634609b61bff5fd269d4@xenhideout.nl>
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

Dne 24.4.2017 v 23:02 Xen napsal(a):
> Zdenek Kabelac schreef op 23-04-2017 11:26:
> 
>> I'm just currious -  what the you think will happen when you have
>> root_LV as thin LV and thin pool runs out of space - so 'root_LV'
>> is replaced with 'error' target.
> 
> Why do you suppose Root LV is on thin?
> 
> Why not just stick to the common scenario when thin is used for extra volumes 
> or data?
> 
> I mean to say that you are raising an exceptional situation as an argument 
> against something that I would consider quite common, which doesn't quite work 
> that way: you can't prove that most people would not want something by raising 
> something most people wouldn't use.
> 
> I mean to say let's just look at the most common denominator here.
> 
> Root LV on thin is not that.

Well then you might be surprised - there are user using exactly this.

When you have rootLV on thinLV - you could easily snapshot it before doing any 
upgrade and revert back in case something fails on upgrade.
See also projects like snapper...

> 
> I have tried it, yes. Gives troubles with Grub and requires thin package to be 
> installed on all systems and makes it harder to install a system too.

lvm2 is cooking some better boot support atm....



> Thin root LV is not the idea for most people.
> 
> So again, don't you think having data volumes produce errors is not preferable 
> to having the entire system hang?

Not sure why you insist system hangs.

If system hangs - and you have recent kernel & lvm2 - you should fill bug.

If you set  '--errorwhenfull y'  - it should instantly fail.

There should not be any hanging..


> That's irrelevant; if the thin pool is full you need to mitigate it, rebooting 
> won't help with that.

well it's really admins task to solve the problem after panic call.
(adding new space).

Thin users can't expect to overload system in crazy way and expect the system 
will easily do something magical to restore all data.

Regards

Zdenek
