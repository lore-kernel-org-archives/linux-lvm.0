Message-ID: <3F328E3A.6070203@conterra.de>
From: Dieter Stueken <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Block-Level Backup
References: <1060247670.28307.37.camel@rocky> <20030807093631.GE381@fib011235813.fsnet.co.uk> <1060260466.4360.2.camel@chtephan.cs.pocnet.net> <20030807134451.GA30494@www.13thfloor.at> <20030807151127.GB5036@ti19> <20030807155421.GK381@fib011235813.fsnet.co.uk> <20030807163228.GC5036@ti19>
In-Reply-To: <20030807163228.GC5036@ti19>
Content-Transfer-Encoding: 8bit
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
Date: Thu Aug  7 12:39:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@sistina.com

Bill Rugolsky Jr. wrote:
> On Thu, Aug 07, 2003 at 04:54:21PM +0100, Joe Thornber wrote:
> 
>>This scheme only works if you don't use the device while you are
>>taking an incremental backup.  I think the real solution will be based
>>around snapshots.
> 
> 
> Right.  But I think the point is this: one won't mind keeping multiple
> (tower of hanoi) long-lived (week or more) block change indices, because
> the performance impact should be very low.
 >
> When it it time to do an actual backup, we simultaneously create a
> new block change index, take a regular snapshot, and freeze (or copy)
> the block-change index of interest.  Then we just back up the blocks
> from the snapshot volume indicated in the frozen block-change index and
> then delete the frozen block-change index and the snapshot volume.

For me this looks very similar to using rsync, but simultaneously
saving all files that are changed. Instead you optimize towards saving
the changed blocks only. Fine! but have you thought about how to restore
any file again if it was changed multiple times? It sounds a little bit
like my favorite unbeatable compression algorithm: it just counts all
1 and all 0 bits and writes just two numbers to tape :-)

But seriously: there is some other interesting possibility. After you
made the snapshot, don't try do save it elsewhere. Instead just keep it!
I use a similar system since a year now. It holds a full mirror of
all my data, thus its some kind of full backup. Each night I
synchronize all modified files, but keep the previous state, too.
Its like a  snapshot. As all unchanged data is shared between the
snapshots, the whole thing grows quite moderately compared to its
total size (200Gb).

Thus I have a snapshot of all my data for each day. I save them daily
for about a week. Then I thin them out, keeping the Sundays only.
After a few weeks I keep one snapshot per month etc. This is equivalent
to dealing with a bundle of tapes, but much much easier.

Also remember, I have the full filesystem on direct access for each
snapshot. No untaring, no merging of files etc. just "cp -a". Disk
devices become cheaper and larger each day. If my disk capacity is
exhausted, I put the disk offline and by a new one (about once a year).
And you have to compare the costs of the HD to tapes. There is no
big different any more and you save an expensive tape drive, too.

OK, I implemented all this by a completely different approach using
hardlinks. Thus shared data is kept file based. But the idea could
be implemented more effective based on shared data blocks. You need
some big block device, for each snapshot an array of block numbers.
Also an copy-on-write algorithm and probably a reference count for
each block (or some garbage algorithm after deleting a snapshot).
This is very similar to LVM snapshots, but not exactly the same...

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
     stueken@conterra.de
     http://www.conterra.de/
     (0)251-7474-501
