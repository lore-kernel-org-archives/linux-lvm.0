From: Steven Lembark <lembark@wrkhors.com>
Subject: RE: [linux-lvm] LVM performance
Message-ID: <8690000.1006506624@dizzy>
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJIEADJCAA.steve.wray@the.net.nz>
References: <NBBBKLKHMJHIJLHOGAOJIEADJCAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Fri Nov 23 09:11:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Steve Wray <steve.wray@the.net.nz>

>> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
>> Behalf Of Bradley M Alexander
>> On Fri, Nov 23, 2001 at 05:32:07PM +1300, Steve Wray wrote:
>> >
>> > thats dead right; ide can't simultaneously write to the master and
>> > slave on the same controller. Also, the pair of drives uses the
>> > controller circuitry
>> > of the master, so it always pays to make the master the most modern
>> > one.
>>
>> Since both controllers have a drive master and a cd slave, this shouldn't
>> matter, per se.
>
> yeah but I thought I'd mention it, for completeness
> :)

Dependong on the bios, for example, there still could be
contention on the SB chipset for access to the controllers.
Point is that there can be multiple bottlenecks.

>> > > Can anyone give me any ideas as to why the machine gets
>> beaten about so
>> > > much during IO operations and more importantly how can I minimize the
>> > > impact.
>> >
>> > Dunno, if it was because the fs is striped across those drives then
>> > splitting them across controllers would have made it go away.
>>
>> Nothing should be striped across the drives. I have two PVs and made two
>> VGs, one on each drive. The way it works out, the data I am
>> mastering is on
>
> yup you have to tell it to stripe, as I recall. Never used that feature
> tho.

I'm using LVM with several striped volumes. Hardware is Tekram
160MB scsi + pair of 80MB drives. The striping works rather
nicely: sustained I/O is high for large copies and latency is
low for reads. The file system uses a 4KB page w/ the inodes
reduced to a reasonable value (e.g., mkfs.ext2 -b4096 -i10240).

If you are using the default of 1block / page then it can
hammer a system due to 2ndary access and higher write rate.

>> > I've seen no performance problems at all and really thrashed an
>> > LVM-root machine for test purposes while working on a movie. It took
>> > it well, performance-wise. (reliability is another issue; never go
>> > LVM-root... but thats just my 2 cents, YMMV).
>>
>> Yeah, I wasn't brave enough to go all out...And with the problems I was
>> having, I'm glad I made that decision. :)
>
> I think the worst part is the lack of backward compatibility
> at some stages of LVM. With root on LVM it can be a bit dangerous
> to upgrade! Or at least it was...

<broken-record>
This can also be a real pain to fix if something goes wrong. If
the lvm is --prefix-ed to, say, /lvm and the root volume is
on a paritition then you can fix most things w/o having to
play with rescue file systems.
</broken-record>

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
