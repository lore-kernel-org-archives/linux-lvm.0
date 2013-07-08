Message-ID: <51DB0CF6.7070400@redhat.com>
Date: Mon, 08 Jul 2013 21:03:18 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <731d217f00b6d8f6c16a75cbe167baed.squirrel@mail.mohawksoft.com>
	<51DAF9AF.900@redhat.com>
	<b6fa555a0b30a89536d74e2d26c4dc35.squirrel@mail.mohawksoft.com>
In-Reply-To: <b6fa555a0b30a89536d74e2d26c4dc35.squirrel@mail.mohawksoft.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots of snapshots are not supported yet
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
Cc: markw@mohawksoft.com

Dne 8.7.2013 19:57, markw@mohawksoft.com napsal(a):
>> Dne 8.7.2013 18:05, markw@mohawksoft.com napsal(a):
>>> I'm trying to get a snapshot of a snapshot. I know the new thin
>>> provisioning stuff supports this, but I'm not sure the release state is
>>> something I can use at a customer.
>>>
>>> Using LVM2, the snapshot format is tried and true, but inefficient if
>>> you
>>> want to take multiple snapshots.
>>>
>>> Looking at dmsetup, there doesn't seem like there would be an issue
>>> taking
>>> a snapshot of a snapshot, but it is disabled in the tools.
>>>
>>> I guess my question is this: Can it be done? Is there any reason why it
>>> should not work?
>>>
>>
>> 1. Noone has written support for it in lvm2. And AFAICK noone is working
>> on this.
>
> I thought I saw a patch for this in the 2010 time frame.
>

I'm not aware of any such support

>>
>> 2. Since the activation order of old snapshot is not as simple as with
>> other
>> targets, it's currently not so easy to add support for into lvm deptree
>> resolver.
>
> In my case I would, more or less, be maintaining a lot of the
> interdependency information for the chain of shapshots and it would
> managed by a daemon being controlled by an application, not really subject
> to the whims of a sys admin.


Beware the old snaps are meant to be used as a 'temporary  objects'
not something you want to keep for a long time - it's degrading write 
performance of origin device and there is also no safe resize support -
i.e. when you overfill snapshot - it's invalidated.  If you would
have used such snapshot as a base origin for a chain with not enough space - 
then whole chain is lost.

> Is there a stable and supported way of getting this functionality? FYI:
> I'm trying to use RHEL as the basis for this and I think that's an old
> 2.6.x kernel.

Kernel RHEL6 2.6 is a heavily modified version - so it has a lot
of features of 3.X kernel and dm support is basically back ported to very 
latest version - so you have there thin provisioning support.

If you want to use snaps of snaps - I'd really recommend to use
thins and report problems rather there - then trying to old snaps.
They were not designed for this use-case.

Zdenek
