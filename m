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
	<04498dc3-5030-079d-743f-69f40176fddf@redhat.com>
	<db6781f71691d7fb80d4f99844c8c3d9@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <607a0d33-7bd1-6baa-2a83-6d1094e72cb5@redhat.com>
Date: Mon, 5 Mar 2018 11:18:01 +0100
MIME-Version: 1.0
In-Reply-To: <db6781f71691d7fb80d4f99844c8c3d9@assyoma.it>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>
Cc: Xen <list@xenhideout.nl>

Dne 5.3.2018 v 10:42 Gionatan Danti napsal(a):
> Il 04-03-2018 21:53 Zdenek Kabelac ha scritto:
>> On the other hand all common filesystem in linux were always written
>> to work on a device where the space is simply always there. So all
>> core algorithms simple never counted with something like
>> 'thin-provisioning' - this is almost 'fine' since thin-provisioning
>> should be almost invisible - but the problem starts to be visible on
>> this over-provisioned conditions.
>>
>> Unfortunately majority of filesystem never really tested well all
>> those 'weird' conditions which are suddenly easy to trigger with
>> thin-pool, but likely almost never happens on real hdd....
> 
> Hi Zdenek, I'm a little confused by that statement.
> Sure, it is 100% true for EXT3/4-based filesystem; however, asking on XFS 
> mailing list about that, I get the definive answer that XFS was adapted to 
> cope well with thin provisioning ages ago. Is it the case?

Yes - it has been updated/improved/fixed - and I've already given you a link 
where you can configure the behavior of XFS when i.e. device reports  ENOSPC 
to the filesystem.

What need to be understood here is - filesystem were not originally designed
to ever see such kind of errors - where you simply created filesystem in past, 
the space was meant to be there all the time.

> Anyway, a more direct question: what prevented the device mapper team to 
> implement a full-read-only/fail-all-writes target? I feel that *many* 
> filesystem problems should be bypassed with full-read-only pools... Am I wrong?

Well complexity - it might look 'easy' to do on the first sight, but in 
reality it's impacting all hot/fast paths with number of checks and it would 
have rather dramatic performance impact.

The other case is, while for lots of filesystems it might look like best thing 
- it's not always true - so there are case where it's more desired
to have still working device with 'several' failing piece in it...

And 3rd moment is - it's unclear from kernel POV - where this 'full' pool 
moment actually happens - i.e. imagine running  'write' operation on one thin 
device and 'trim/discard' operation running on 2nd. device.

So it's been left on user-space to solve the case the best way -
i.e. user-space can initiate  'fstrim' itself when full pool case happens or 
get the space by number of other ways...

Regards

Zdenek
