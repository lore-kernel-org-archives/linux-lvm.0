Message-ID: <0f164d9a97cf0b37dc23ac0734ffd2a2.squirrel@mail.mohawksoft.com>
In-Reply-To: <51DDAB43.7070001@redhat.com>
References: <731d217f00b6d8f6c16a75cbe167baed.squirrel@mail.mohawksoft.com>
	<51DAF9AF.900@redhat.com>
	<b6fa555a0b30a89536d74e2d26c4dc35.squirrel@mail.mohawksoft.com>
	<51DB0CF6.7070400@redhat.com>
	<f86ce4aaade1aef71c980d7202140c78.squirrel@mail.mohawksoft.com>
	<51DD1A8E.9080702@redhat.com>
	<741f708c46ffac16eeab39629823d5c2.squirrel@mail.mohawksoft.com>
	<51DDAB43.7070001@redhat.com>
Date: Wed, 10 Jul 2013 15:16:26 -0400
From: markw@mohawksoft.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: markw@mohawksoft.com, LVM general discussion and development <linux-lvm@redhat.com>

> Dne 10.7.2013 16:45, markw@mohawksoft.com napsal(a):
>>> Dne 10.7.2013 05:45, markw@mohawksoft.com napsal(a):
>>> Yes - differential snapshot will be supported through thin provisioning
>>> target - where you will be able to make a simple diff just by reading
>>> metadata - it will be essential piece of replication.
>>
>> Is any of this in place now?
>
> Surely not - if it would be in place - I'd suggest which command you
> should use :)

Ahh, ok.

>
>>
>>>
>>> AFAIK Joe has this in plan for some time - and there was even some
>>> announcement from some third-party developer to support this.
>>
>> Do you have a link?
>
>
> https://www.redhat.com/archives/dm-devel/2013-July/msg00005.html
>
>>>
>>> There is not going to be any upstream support for doing this with
>>> old-snaps in foreseeable future.
>>>
>>> Also keep in mind your idea of using old-snap of snap of snap would be
>>> very
>>> slow and fragile to use.
>>
>> Well, the reason I am pursuing this.....
>>
>> At a previous employment a few years back, I created a system using
>> LVM2,
>> old style snapshots, and FUSE to create this functionality.
>>
>> Using my previous example as a reference
>>
>> disk0 would always have one live snapshot to maintain diffs, call it
>> disk0_snap_root.
>
> Using chain of old-snaps is just way too heavy for anything - you really
> need
> to use system which is not copying blocks

Well, yes, grabbing a new block and using it in the original volume would
be more efficient than copying old data to (n) snapshots. However, in the
system I wrote I only did the copy to one snapshot. All previous snaps
referred to the next newer snap in the chain.

>
>
>> I need to implement similar behavior at a new employer and really really
>> want not to use FUSE and rewrite all that crap again and am trying to
>> see
>> how to get it done using the device mapper layer. Also this is going to
>> be
>> for a product that is expected to ship to customers in the relatively
>> near
>> term.
>>
>> Any information or insight you can share would be much appreciated. I am
>> beginning to suspect that LVM will not be usable for the project.
>
> As I said -  btrfs has some kind of functionality you are looking for,
> Or you may start to help with lvm project...
> (Or thin-provisioning tools in this case)

Where's a good place to look to start?

>
> Zdenek
>
>
