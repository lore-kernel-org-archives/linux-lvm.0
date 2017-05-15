References: <4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
	<0535f3d744145eceea9121b1e68b622d@assyoma.it>
	<d6923067-a96f-191e-15e0-42a6bf29b37e@redhat.com>
	<4fb6f017d9734892eff6b0ef544d99fc@assyoma.it>
	<20ddda25-dacf-f4e2-8df4-f9bed1c62fe7@redhat.com>
	<c5bee073-7871-fbb9-370d-8a1b322bbd86@assyoma.it>
	<921a6b9c-103e-3c71-97d2-44ceb5a6bf87@redhat.com>
	<f87b9a3de7c1871142cd47251e18c5fe@assyoma.it>
	<a8c9afaa-6b63-e60c-e37e-a845fdc8ff40@assyoma.it>
	<d5cfbd0b-5e2d-375b-f474-54ba7483ece9@assyoma.it>
	<20170512134157.GA2523@nim>
	<b0e4f2d1cfca0ea32da27b1cb34bf1be@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <b3372535-379f-8771-7395-6b0e4ba72f0d@redhat.com>
Date: Mon, 15 May 2017 14:50:52 +0200
MIME-Version: 1.0
In-Reply-To: <b0e4f2d1cfca0ea32da27b1cb34bf1be@assyoma.it>
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
To: linux-lvm@redhat.com, Gionatan Danti <g.danti@assyoma.it>

Dne 14.5.2017 v 22:39 Gionatan Danti napsal(a):
> Il 12-05-2017 15:42 Joe Thornber ha scritto:
>> On Fri, May 12, 2017 at 03:02:58PM +0200, Gionatan Danti wrote:
>>> On 02/05/2017 13:00, Gionatan Danti wrote:
>>> >>Anyway, I think (and maybe I am wrong...) that the better solution is to
>>> >>fail *all* writes to a full pool, even the ones directed to allocated
>>> >>space. This will effectively "freeze" the pool and avoid any
>>> >>long-standing inconsistencies.
>>
>> I think dm-thin behaviour is fine given the semantics of write
>> and flush IOs.
>>
>> A block device can complete a write even if it hasn't hit the physical
>> media, a flush request needs to come in at a later time which means
>> 'flush all IOs that you've previously completed'.  So any software using
>> a block device (fs, database etc), tends to generate batches of writes,
>> followed by a flush to commit the changes.  For example if there was a
>> power failure between the batch of write io completing and the flush
>> completing you do not know how much of the writes will be visible when
>> the machine comes back.
>>
>> When a pool is full it will allow writes to provisioned areas of a thin to
>> succeed.  But if any writes failed due to inability to provision then a
>> REQ_FLUSH io to that thin device will *not* succeed.
>>
>> - Joe
> 
> True, but the real problem is that most of the failed flushes will *not* bring 
> the filesystem read-only, as both ext4 and xfs seems to go read-only only when 
> *metadata* updates fail. As this very same list recommend using ext4 with 
> errors=remount-ro on the basis that putting the filesystem in a read-only 
> state after any error I the right thing, I was somewhat alarmed to find that, 
> as far I can tell, ext4 goes read-only on metadata errors only.
> 
> So, let me reiterate: can we consider thinlvm + xfs as safe as thinlvm + ext4 
> + errors=remount-ro?


Hi

I still think you are mixing apples & oranges together and you expecting 
answer '42' :)

There is simply NO simple answer. Every case has its pros & cons.

There is simply cases where XFS beats Ext4 and there are opposite situations 
as well.

Also you WILL always get WRITE error - if your application doesn't care about 
write error - why do you expect any block-device logic could rescue you ??

Out-of-space thin-pool is simply a device which looks like seriously damaged 
disk where you always read something without any problem and you fail to write 
things here and there.

IMHO both filesystem XFS & Ext4 on recent kernels do work well - but no one 
can say there are no problems at all.

Things are getting better -  but  planning  usage of thin-pool to 'recover' 
overfilled pool is simple BAD planning. You should plan your thin-pool usage 
to NOT run out-of-space.

And last comment I always say -  full thin-pool it not  similar to full 
filesystem where you drop some 'large' file and you are happily working again 
- it's not working this way - and if someone hoped into this - he needs to use 
something else ATM.


Regards


Zdenek
