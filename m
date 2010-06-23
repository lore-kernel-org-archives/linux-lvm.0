Received: from firewall.xsintricity.com
	(ovpn01.gateway.prod.ext.phx2.redhat.com [10.5.9.1])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5NIxk3t021017
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 23 Jun 2010 15:00:07 -0400
Received: from macbook.xsintricity.com (macbook.xsintricity.com [172.31.0.7])
	(authenticated bits=0)
	by firewall.xsintricity.com (8.14.4/8.14.3) with ESMTP id
	o5NIxjBk005215
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 23 Jun 2010 14:59:45 -0400
Message-Id: <25E3A700-B320-4F84-8694-4DE5AD4D0A83@redhat.com>
From: Doug Ledford <dledford@redhat.com>
In-Reply-To: <4C1EE9ED.9080201@tlinx.org>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v936)
Date: Wed, 23 Jun 2010 14:59:45 -0400
References: <4BF5A883.7060503@tlinx.org>	<20100521051021.GA1412@maude.comedia.it>	<4BF62CBF.3070702@tlinx.org>	<20100522072321.GB12294@maude.comedia.it>
	<4BFEA099.9020005@redhat.com> <4C1EE9ED.9080201@tlinx.org>
Subject: Re: [linux-lvm] RAID chunk size & LVM 'offset' affecting RAID
	stripe alignment
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Jun 21, 2010, at 12:26 AM, Linda A. Walsh wrote:
> Revisiting an older topic (I got sidetracked w/other issues,
> as usual, fortunately email usually waits...).
>
> About a month ago, I'd mentioned docs for 2 HW raid cards
> (LSI & Rocket Raid) both suggested 64K as a RAID chunk size.
>
> Two responses came up, Doug Ledford said:
> Hardware raid and software raid are two entirely different things
> when it comes to optimization.
>
> And Luca Berra said:
> I think 64k might be small as a chunk size, depending on your
> array size you probably want a bigger size.
> (I asked why and Luca contiued..)
>
> First we have to consider usage scenarios, i.e. average read and
> average write size, large reads benefit from larger chunks,

Correction: all reads benefit from larger chunks now a days.  The only  
reason to use smaller chunks in the past was to try and get all of  
your drives streaming data to you simultaneously, which effectively  
made the total aggregate throughput of those reads equal to the  
throughput of one data disk times the number of data disks in the  
array.  With modern drives able to put out 100MB/s sustained by  
themselves, we don't really need to do this any more, and if we aren't  
attempting to get this particular optimization (which really only  
existed when you were doing single threaded sequential I/O anyway,  
which happens to be rare on real servers), then larger chunk sizes  
benefit reads because they help to ensure that reads will, as much as  
possible, only hit one disk.  If you can manage to make every read you  
service hit one disk only, you maximize the random I/O ops per second  
that your array can handle.

> small
> writes with too large chunks would still result on whole stripe
> Read-Modify-Write.

There is a very limited set of applications where the benefit of  
streaming writes versus a read-modify-write cycle are worth the trade  
off that they require.  Specifically, only if you are going to be  
doing more writing to your array than reading, or maybe if you are  
doing at least 33% of all commands as writes, then you should worry  
about this.  By far and away the vast majority of usage scenarios  
involve far more reads than writes, and in those cases you always  
optimize for reads.  However, even if you are optimizing for writes,  
then what I wrote above about trying to make it so that your writes  
always only fall on one disk (excepting the fact that parity also  
needs updated) still holds true unless you can make your writes  
*reliably* take up the entire stripe.  The absolute worst thing you  
could do is use a small chunk size thinking that it will cause your  
writes to skip the read-modify-write cycle and instead do a complete  
stripe write, then have your writes reliably only do half stripe  
writes instead of full stripe writes.  A half stripe write is worse  
than a full stripe write, and is worse than a single chunk write.  It  
is the worst case scenario.

> there were people on linux-raid ml doing benchmarks, and iirc
> using chunks between 256k and 1m gave better average results...
>
> (Doug seconded this, as he was the benchmarker..)
>  That was me.  The best results are with 256 or 512k chunk sizes.
> Above 512k you don't get any more benefit.
>
> ------
>
> My questions at this point -- why are SW and HW raid so different?
> Aren't they doing the same algorithms on the same media?

Yes and no.  Hardware RAID implementations provide a pseudo device to  
the operating system, and implement their own caching subsystem and  
command elevator algorithm on the card for both the pseudo device and  
the underlying physical drives.  Linux likewise has its own elevator  
and caching subsystems that work on the logical drive.  So, in the  
case of software raid you are usually talking the stack looks  
something like this:

filesystem -> cacheing layer -> block device layer with elevator for  
logical device -> raid layer -> block device layer with noop elevator  
for physical device -> scsi device layer -> physical drive

In the case of hardware raid controller, it's like this:

filesystem -> cacheing layer -> block device layer with elevator for  
logical device -> scsi layer -> raid controller driver -> hardware  
raid controller cacheing layer and elevator -> hardware raid  
controller raid stack -> hardware raid controller physical drive  
driver layer -> physical drive

So, while at a glance it might seem that they are implementing the  
same algorithms on the same devices, the details of how they do so are  
drastically different and hence the differences in optimal numbers.

FWIW, we don't generally have access to the raid stack on those  
hardware raid controllers to answer the question of why they perform  
best with certain block sizes, but my guess is that they have built in  
assumptions in the cacheing layer related to those block sizes, that  
result in them being hamstrung at other block sizes.

>  SW might
> be a bit slower at some things (or it might be faster if it's good
> SW and the HW doesn't clearly make it faster).
>
> Secondly, how would array size affect the choice for chunk size?

Array size doesn't affect optimal chunk size.

>  Wouldn't chunk size be based on your average update size, trading
> off against the increased benefit of a larger chunk size benefitting  
> reads more than writes.  I.e. if you read 10 times as much as write,
> then maybe faster reads provide a clear win, but if you update
> nearly as much as read, then a stripe size closer to your average
> update size would be preferable.

See my comments above, but in general, you can always play it safe  
with writes and use a large chunk size so that writes generally are  
single chunk writes.  If you do that, you get reasonably good writes,  
and optimal reads.  Unless you have very strict control of the writes  
on your device, it's almost impossible to have optimal full-stripe  
writes, and if you try to aim for that, you have a large chance of  
failure.  So, my advice is to not even try to go down that path.

> Concerning the benefit of a larger chunk size benefitting reads --
> would that benefit be less if one also was using read-ahead on the
> array?

The benefit of large chunk size for reads is that it keeps the read on  
a single device as frequently as possible.  Because readahead doesn't  
kick in immediately, it doesn't negate that benefit on random I/O, and  
on truly sequential I/O it turns out to still help things as it will  
start the process of reading from the next disk ahead of time but  
usually only after we've determined we truly are going to need to do  
exactly that.

> >-----------------------<
>  In another note, Luca Berra commented, in response to my  
> observation that my 256K-data wide stripes (4x64K chunks) would be  
> skewed by a
> chunk size on my PV's that defaulted to starting data at offset 192K:
>
> LB> it will cause multiple R-M-W cycles fro writes that cross stripe
> LB> boundary, not good.
>
> I don't see how it would make a measurable difference.

Alignment of the lvm device on top of the raid device most certainly  
will make a measurable difference.

>  If it did, wouldn't we also have to account for the parity disks so  
> that they
> are aligned as well -- as they also have to be written during a  
> stripe-write?  I.e. -- if it is a requirement that they be aligned,
> it seems that the LVM alignment has to be:
>
> (total disks)x(chunk-size)
>
> not
> (data-disks)x(chunk-size)

No.  If you're putting lvm on top of a raid array, and the raid array  
is a pv to the lvm device, then the lvm device will only see (data- 
disks)x(chunk-size) of space in each stripe.  The parity block is  
internal to the raid and never exposed to the lvm layer.

> as I *think* we were both thinking when we earlier discussed this.
>
> Either way, I don't know how much of an effect there would be if,
> when updating a stripe, some of the disks read/write chunk "N", while
> the other disks use chunk "N-1"...  They would all be writing 1
> chunk/stripe update, no?

No.  This goes to the heart of a full stripe write versus partial  
stripe write.  If your pv is properly aligned on the raid array, then  
a single stripe write of the lvm subsystem will be exactly and  
optimally aligned to write to a single stripe of the raid array.  So,  
let's say you have a 5 disk raid5 array, so 4 data disks and 1 parity  
disk.  And let's assume a chunk size of 256K.  That gives a total  
stripe width of 1024K.  So, telling the lvm subsystem to align the  
start of the data on a 1024K offset will optimally align the lv on the  
pv.  If you then create an ext4 filesystem on the lv, and tell the  
ext4 filesystem that you have a chunk size of 256k and a stripe width  
of 1024k, the ext4 filesystem will be properly aligned on the  
underlying raid device.  And because you've told the ext4 filesystem  
about the raid device layouts, it will attempt to optimize access  
patterns for the raid device.

That all being said, here's an example of a non-optimal access  
pattern.  Let's assume you have a 1024k write, and the ext4 filesystem  
knows you have a 1024k stripe width.  The filesystem will attempt to  
align that write on a 1024k stripe boundary so that you get a full  
stripe write.  That means that the raid layer will ignore the parity  
already on disk, will simply calculate new parity by doing an xor on  
the 1024k of data, and will then simply write all 4 256k chunks and  
the 256k parity block out to disk.  That's optimal.  If the alignment  
is skewed by the lvm layer though, what happens is that the ext4  
filesystems tries to lay out the write on the start of a stripe but  
fails, and instead of the write causing a very fast parity generation  
and write to a single stripe, the write gets split between two  
different stripes and since neither stripe is a full stripe write, we  
do one of two things: a read-modify-write cycle or a read-calculate- 
write cycle.  In either of those cases, it is a requirement that we  
read something off of disk and use it in the calculation of what needs  
to be written out to disk.  So, we end up touching two stripes instead  
of one and we have to read stuff in, introducing a latency delay,  
before we can write our data out.  So, it's highly important that, in  
so far as some layers are aware of raid device layouts, that those  
layers be *properly* aligned on our raid device or the result is not  
only suboptimal, but likely pathological.

>  The only conceivable impact on performance
> would be at some 'boundary' point -- if your volume contained
> multiple physical partitions -- but those would be far and few  
> between large areas where it should (?) make no difference.  Eh?
>
> Linda
>
>
>
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
