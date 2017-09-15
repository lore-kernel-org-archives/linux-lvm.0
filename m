References: <914479528.2618507.1505463313888.ref@mail.yahoo.com>
	<914479528.2618507.1505463313888@mail.yahoo.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c9132947-fd69-517b-0552-9275a48e6b35@redhat.com>
Date: Fri, 15 Sep 2017 12:01:58 +0200
MIME-Version: 1.0
In-Reply-To: <914479528.2618507.1505463313888@mail.yahoo.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 15.9.2017 v 10:15 matthew patton napsal(a):
> 
>>   From the two proposed solutions (lvremove vs lverror), I think I would  prefer the second one.
> 
> I vote the other way. :)
> First because 'remove' maps directly to the DM equivalent action which brought this about. Second because you are in fact deleting the object - ie it's not coming back. That it returns a nice and timely error code up the stack instead of the kernel doing 'wierd things' is an implementation detail.
> 

It's not that easy.

lvm2  cannot just 'lose' the volume which is still mapped IN table (even if it 
will an error segment)

So the result of operation will be  some 'LV' in the lvm2 metadata.
which could be possibly flagged for 'automatic' removal later once it's no 
longer hold in use.

There could be seen 'some' similarity between snapshot marge -  where lvm2 
also maintains some 'fictional' volumes internally..

So 'lvm2' could possibly 'mask' device as 'removed'   - or it can keep it 
remapped to error target - which could be possibly usable for other things.


> Not to say 'lverror' might have a use of it's own as a "mark this device as in an error state and return EIO on every OP". Which implies you could later remove the flag and IO could resume subject to the higher levels not having already wigged out in some fashion. However why not change the behavior of 'lvchange -n' to do that on it's own on a previously activated entry that still has a ref count > 0? With '--force' of course

'lvrerror' can be also used for 'lvchange -an' - so not such 'lvremoval' and 
it could be used for other volumes (not just things) possibly -

so you get and lvm2 mapping of  'dmsetup wipe_table'

('lverror'  would be actually something like   'lvconvert --replacewitherror' 
-  likely we would not add a new 'extra' command for this conversion)

> 
> With respect to freezing or otherwise stopping further I/O to LV being used by virtual machines, the only correct/sane solution is one of 'power off' or 'suspend'. Reaching into the VM to freeze individual/all filesystems but otherwise leave the VM running assumes significant knowledge of the VM's internals and the luxury of time.


And 'suspend' can be dropped from this list ;) as so far  lvm2 is seeing a 
device left in suspend after command execution as a serious internal error,
and there is long list of good reasons for not leaking suspend devices.

Suspend is designed as short-living  'state' of device  - it's not meant to be 
held suspend for undefined amount of time - it cause lots of troubles to 
various /dev scanning softwares (lvm2 included....) - and as such it's has 
racy built-in :)


Regards

Zdenek
