From: Anders Widman <andewid@tnonline.net>
Message-ID: <907284671.20020530171458@tnonline.net>
Subject: Re[2]: [linux-lvm] LVM 2
In-Reply-To: <20020530151804.GA1179@fib011235813.fsnet.co.uk>
References: <15347980890.20020529141644@tnonline.net>
 <20020529141823.GC4655@fib011235813.fsnet.co.uk>
 <2169056421.20020529200758@tnonline.net>
 <20020530151804.GA1179@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu May 30 10:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Joe Thornber <joe@fib011235813.fsnet.co.uk>

> On Wed, May 29, 2002 at 08:07:58PM +0200, Anders Widman wrote:
>> > On Wed, May 29, 2002 at 02:16:44PM +0200, Anders Widman wrote:
>> What exactly shown in those diagrams? :)

> It's trying to answer the question 'how does io to a volume slow down
> if I take a snapshot'.  The *overhead* is plotted on the vertical scale,
> in terms of the time taken to do the operation with no snapshot.

> So if I use a chunk size of 16k we see that LVM2 has an overhead of
> 0.23, ie. the 'dbench 2' operation on a freshly snapshotted origin
> will take 1.23 times as long compared to the snapshot not being
> present.  EVMS on the other hand takes 7.84 times as long.  

> If you find the numbers confusing just look at the raw results in the
> first table.  If you use 8k chunk sizes with EVMS expect 'dbench 2' to
> take ~227 seconds compared to LVM2's ~15.

>> > LVM2 by default uses the same metadata format as LVM1, so there really
>> > isn't any conversion procedure.  So try LVM2 for a bit, if you don't
>> > like it (unlikely) revert to LVM1.  Please note that metadata backups
>> > and archives are held in a very different form.
>> 
>> So I can just install LVM2 and continue as usual, and switch back if I
>> get  into  trouble?

> Yes.

>> And, what if I get into trouble? I can not backup
>> all data. There is not enough space for that.

> What happens if you get in trouble with LVM1 ?  If that data is
> important you should really back it up, all drives fail eventually.

True.  Backups would be great, but, I have almost 1TB of data, and
there is difficult to find a costworthy sollution. Actually I have had
very  bad  luck  with some of my drives. During a  crash,  probably  a
electric  surge  or  something,  4  out  of  14  drives  got   severe
read/write   errors.   I   could, however, rebuild data using reiserfs
tools.

If there were errors in the logical volume management, things might be
more difficult to repair?

>> >>    Also,  is  it  possible to convert (with and LVM version) a spanded
>> >>    volume to a striped volume?
>> 
>> > Not until we get the new pvmove infrastructure.
>> 
>> So,   when newer pvmove tools develops it would be possible to convert
>> a spanned volume to a sriped (RAID0 or 5?) volume without loosing data?

> RAID5 is probably 6 months away, but I would hope to be able to remap
> a linear volume to a striped volume in the next month or so.

Ok.  I'll  wait  for  the RAID 5, as it would give me the redundancy I
need.

//Anders

> - Joe

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
