References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
	<6dd12ab9-0390-5c07-f4b7-de0d8fbbeacf@redhat.com>
	<3831e817d7d788e93a69f20e5dda1159@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <0ab1c4e1-b15e-b22e-9455-5569eeaa0563@redhat.com>
Date: Sun, 23 Apr 2017 11:26:43 +0200
MIME-Version: 1.0
In-Reply-To: <3831e817d7d788e93a69f20e5dda1159@xenhideout.nl>
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

Dne 23.4.2017 v 07:29 Xen napsal(a):
> Zdenek Kabelac schreef op 22-04-2017 23:17:
> 
>>> That is awesome, that means a errors=remount-ro mount will cause a remount 
>>> right?
>>
>> Well 'remount-ro' will fail but you will not be able to read anything
>> from volume as well.
> 
> Well that is still preferable to anything else.
> 
> It is preferable to a system crash, I mean.
> 
> So if there is no other last rather, I think this is really the only last 
> resort that exists?
> 
> Or maybe one of the other things Gionatan suggested.
> 
>> Currently lvm2 can't support that much variety and complexity...
> 
> I think it's simpler but okay, sure...
> 
> I think pretty much anyone would prefer a volume-read-errors system rather 
> than a kernel-hang system.

I'm just currious -  what the you think will happen when you have
root_LV as thin LV and thin pool runs out of space - so 'root_LV'
is replaced with 'error' target.

How do you think this will be ANY different from hanging your system ?


> It is just not of the same magnitude of disaster :p.

IMHO reboot is still quite fair solution in such case.

Regards

Zdenek
