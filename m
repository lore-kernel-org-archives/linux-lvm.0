Message-ID: <51DDAB43.7070001@redhat.com>
Date: Wed, 10 Jul 2013 20:43:15 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <731d217f00b6d8f6c16a75cbe167baed.squirrel@mail.mohawksoft.com>
	<51DAF9AF.900@redhat.com>
	<b6fa555a0b30a89536d74e2d26c4dc35.squirrel@mail.mohawksoft.com>
	<51DB0CF6.7070400@redhat.com>
	<f86ce4aaade1aef71c980d7202140c78.squirrel@mail.mohawksoft.com>
	<51DD1A8E.9080702@redhat.com>
	<741f708c46ffac16eeab39629823d5c2.squirrel@mail.mohawksoft.com>
In-Reply-To: <741f708c46ffac16eeab39629823d5c2.squirrel@mail.mohawksoft.com>
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

Dne 10.7.2013 16:45, markw@mohawksoft.com napsal(a):
>> Dne 10.7.2013 05:45, markw@mohawksoft.com napsal(a):
>>> One more annoying question, if you have the patience.
>>>
>>> Suppose I create a thin provisioned volume, say disk0.
>>>
>>> I take a snapshot of disk0 and name it disk0_snap0
>>> After a number of changes I then take another snapshot, and call it
>>> disk0_snap1
>>>
>>> Is the thin provisioning stuff smart enough to realize that disk0_snap0
>>> should be rewired to reference disk0_snap1 as its origin? It would look
>>> like this:
>>>
>>> disk0 -> disk0_snap1 -> disk0_snap0
>>>
>>> What I would like to see is something like this:
>>>
>>> disk0 -> disk0_snap2 -> disk0_snap1 -> disk0_snap0
>>>
>>> Create disk0_snap3
>>>
>>> disk0 -> disk0_snap3 -> disk0_snap2 -> disk0_snap1 -> disk0_snap0
>>>
>>> Where all writes to disk0 result in CoW to disk0_snap3 and the remaining
>>> snaps remain unchanged.
>>>
>>> Here is the kicker, I want to perform a differential backup on
>>> disk0_snap3
>>> and disk0_snap2.  Suppose I already recreated disk0_snap2 on some
>>> server.
>>> I now want to update it to disk0_snap3. I need to get a block list from
>>> disk0_snap2 and disk0_snap3, then generate a list of blocks needed to
>>> permute snap2 to snap3.
>>>
>>> Any info?
>>>
>>
>> Yes - differential snapshot will be supported through thin provisioning
>> target - where you will be able to make a simple diff just by reading
>> metadata - it will be essential piece of replication.
>
> Is any of this in place now?

Surely not - if it would be in place - I'd suggest which command you should use :)

>
>>
>> AFAIK Joe has this in plan for some time - and there was even some
>> announcement from some third-party developer to support this.
>
> Do you have a link?


https://www.redhat.com/archives/dm-devel/2013-July/msg00005.html

>>
>> There is not going to be any upstream support for doing this with
>> old-snaps in foreseeable future.
>>
>> Also keep in mind your idea of using old-snap of snap of snap would be
>> very
>> slow and fragile to use.
>
> Well, the reason I am pursuing this.....
>
> At a previous employment a few years back, I created a system using LVM2,
> old style snapshots, and FUSE to create this functionality.
>
> Using my previous example as a reference
>
> disk0 would always have one live snapshot to maintain diffs, call it
> disk0_snap_root.

Using chain of old-snaps is just way too heavy for anything - you really need 
to use system which is not copying blocks


> I need to implement similar behavior at a new employer and really really
> want not to use FUSE and rewrite all that crap again and am trying to see
> how to get it done using the device mapper layer. Also this is going to be
> for a product that is expected to ship to customers in the relatively near
> term.
>
> Any information or insight you can share would be much appreciated. I am
> beginning to suspect that LVM will not be usable for the project.

As I said -  btrfs has some kind of functionality you are looking for,
Or you may start to help with lvm project...
(Or thin-provisioning tools in this case)

Zdenek
