Mime-Version: 1.0 (Apple Message framework v622)
In-Reply-To: <ca4f7e300507271310c5cb94e@mail.gmail.com>
References: <ca4f7e300507270144720cef7b@mail.gmail.com>
	<42E786B9.2080400@mattgillen.net>
	<20050727142440.GA4954@null.msp.redhat.com>
	<42E7C25E.10606@mattgillen.net>
	<ca4f7e300507271310c5cb94e@mail.gmail.com>
Message-Id: <6899cc340fd6b5e100508f11b9e30c0f@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Mirroring a Drive for load-balancing AND failover
Date: Thu, 28 Jul 2005 10:12:58 -0500
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fury <furiosod@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Yes, cmirror seems like what you are looking for (along with 
GNBD/iSCSI).

I am testing cmirror right now, it adds the ability to:
1) have a mirrored device in a cluster environment
2) do pvmoves on clustered volumes

Many of the pieces you need are in the form of patches currently, but 
we're working on pulling them together... maybe a month to get the 
kernel changes in + user space tools cleaned up.

If anyone is interested in helping me test this beast, I'd be thankful. 
  I've recently uncovered a data corruption issue (I think) in cluster 
mirrors when simultaneously doing looping lvs's, pvmove, and dd's from 
different machines. You need only a few machines and you can use gnbd 
for shared storage.  (Actually, gnbd is the _best_ device to use for 
this testing, as you can forcibly remove a single device while it is in 
use.  This obviously makes gnbd ideal for single machine mirror 
testing, as well.)

  brassow

On Jul 27, 2005, at 3:10 PM, Fury wrote:

> I am now looking at iSCSI.  The problem is exactly what Matt
> describes.  Recovery isn't that big of a deal, when the other server
> comes up I can carefully set one of the devices as failed, remove it,
> add it again, and get them to sync.  after a sync is complete on both
> servers, I can mount the drive on the server that went down and resume
> services.
>
> Maybe iSCSI will report things diferently to md (raid).  I will try.
>
> I'm looking forward to cmirror, I hear it will be ready soon.  I'm not
> completely sure it's what I need, maybe someone involved will see this
> and chime in.
>
> -Derek
>
> On 7/27/05, Matthew Gillen <me@mattgillen.net> wrote:
>> AJ Lewis wrote:
>>> On Wed, Jul 27, 2005 at 09:06:01AM -0400, Matthew Gillen wrote:
>>>
>>>> Fury wrote:
>>>>
>>>>> I've racked my brain on this one, so hopefully someone will be of 
>>>>> some help.
>>>>>
>>>>> I'm trying to set up two servers which share a drive and do not 
>>>>> have a
>>>>> Single Point of Failure.  They are on a local network with each 
>>>>> other.
>>>>> The best solution would be to have /dev/sda1 on one server mirrored
>>>>> with /dev/sda1 on the second server.
>>>>> ...
>>>>> A second solution was to use GFS/GNBD.  I can export each drive to 
>>>>> the
>>>>> other server, and do RAID 1 (on both servers) between the local
>>>>> /dev/sda1 and the remote gnbd device.  I then format the raid 
>>>>> device
>>>>> with GFS so both servers can mount it.
>>>>>
>>>>> Surprisingly, this last system works.  Both systems can mount the
>>>>> drive and read-write to it.  However, if either server in this
>>>>> configuration drops dead, the other server cannot deal with the 
>>>>> dead
>>>>> gnbd device, and the raid device and mount point are no longer 
>>>>> usable.
>>>>> I'm sure there are numerous other problems with this setup, also.
>>>>>
>>>>> So I'm looking for ideas.  With two servers, how can I mirror a 
>>>>> drive
>>>>> in real-time, and allow for failover?
>>>>
>>>> You might want to use something more like iSCSI + RAID:
>>>> http://linux-iscsi.sourceforge.net/
>>>
>>>
>>> How is that different than GNBD + RAID?  The issue isn't the network
>>> transport, it's recovery of a RAID on two nodes simultaneously.
>> I don't think he was even worried about recovery, although you're 
>> right
>> and that's another problem.  I read that he couldn't access anything
>> after a failure of one server, which is what I was addressing.
>>
>> Honestly, I don't know how GNBD works.  But if it makes makes the 
>> remote
>> volume look local and doesn't report problems in a way that RAID
>> understands (or at all), I can see how things would hang (just like a
>> client system would hang if an NFS server for a mounted filesystem 
>> went
>> down).  I imagine (but I don't know from personal experience) that 
>> iSCSI
>> (with the ConnFailTimeout=x sec) would report a failed write and RAID
>> knows how to handle that.
>>
>> But, like I said, I don't know for sure about any of this, since I
>> haven't tried it.  However, the page:
>> http://linas.org/linux/raid.html
>> mentions iSCSI, so it appears that some people have gotten it to work.
>> --Matt
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
