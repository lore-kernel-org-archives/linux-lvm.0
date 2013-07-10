Message-ID: <51DDC0D5.2090900@redhat.com>
Date: Wed, 10 Jul 2013 22:15:17 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <731d217f00b6d8f6c16a75cbe167baed.squirrel@mail.mohawksoft.com>
	<51DAF9AF.900@redhat.com>
	<b6fa555a0b30a89536d74e2d26c4dc35.squirrel@mail.mohawksoft.com>
	<51DB0CF6.7070400@redhat.com>
	<f86ce4aaade1aef71c980d7202140c78.squirrel@mail.mohawksoft.com>
	<51DD1A8E.9080702@redhat.com>
	<741f708c46ffac16eeab39629823d5c2.squirrel@mail.mohawksoft.com>
	<51DDAB43.7070001@redhat.com>
	<d35fdbd25cedbfa7708394e716a3e288.squirrel@mail.mohawksoft.com>
In-Reply-To: <d35fdbd25cedbfa7708394e716a3e288.squirrel@mail.mohawksoft.com>
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
To: markw@mohawksoft.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 10.7.2013 22:12, markw@mohawksoft.com napsal(a):
>> Dne 10.7.2013 16:45, markw@mohawksoft.com napsal(a):
>
>> As I said -  btrfs has some kind of functionality you are looking for,
>> Or you may start to help with lvm project...
>> (Or thin-provisioning tools in this case)
>>
>> Zdenek
>
> That link you sent was good, I am looking in to it, it may provide a large
> amount of help.
>
> One last thing.... :-)
>
> Now imagine this:
>
> create disk0
>
> Activity on disk0
>
> Take a snapshot
> disk0 -> disk0_snap0
>
> Activity on disk0
>
> take a snapshot
> disk0 -> disk0_snap1
>
> (We will now use the differential between snap1 and snap0 to represent
> what needs to be backed up from snap1)
>
> This leaves us with something that looks like this:
>
> disk0 --> disk0_snap0
>         -> disk0_snap1
>
> Will we need to remap the parentage of disk0_snap0 so it looks something
> like this?
>
> disk0 -> disk0_snap1 -> disk0_snap0
> (Is this possible with dmsetup?)
>
> Or could we have many (order of hundreds or thousands) of snaps directly
> on disk0 and not impact performance?
>

Thin provisioning is written to support this. Note - you do not need to have 
snapshots present as active devices - i.e. you could snapshot your device 
every hour.

If you want to discover diff between _snap0 and _snap1 - you have number of 
choices - if you want to know 'filesystem' diff or block device diff.
Block device  diff could be detected by doing a diff in metadata between
btree for _snap0 and _snap1.

Also there are projects like 'snapper' for filesystem diffs.

Zdenek
