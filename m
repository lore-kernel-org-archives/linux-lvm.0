Subject: Re: [linux-lvm] LVM Snapshots for remote archiving.
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <4017E699.5020703@gene.concordia.ca>
References: <4016EE45.1050300@gene.concordia.ca>
	 <1075246162.25365.16.camel@david.internal.NorcrossGroup.com>
	 <4017E699.5020703@gene.concordia.ca>
Message-Id: <1075310348.25365.43.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
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
Date: Wed Jan 28 12:33:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Wed, 2004-01-28 at 11:43, Chris Beck wrote:
> I guess I am misunderstanding how a snapshot volume works, I kinda 
> thought it would be this mythical transaction log - disk writes need to 
> be stored somewhere while the original volume is frozen and I was hoping 
> that I could move the whole thing around like any other file.
> 
> I was hoping to avoid rsync/rdiff because the snapshot volume itself was 
> a list of differences over the last 24 hours.
> 
> It is whispered that Greg Freemyer was heard, on or about 1/27/2004 6:29 
> PM to say:
> 
A snapshot is based on copy on write technology.  I guess you could use
it to create the transaction log you are talking about, but it is not
what it is designed to do, and I believe significant effort would be
involved.

Basically with a snapshot, a blank disk volume is created with a flag
table with one entry per block of master volume data.  All of the flag
entries are initialized as "unmodified".

When a write is performed to the master volume, the flag table is
checked.  If the flag for that particular block is set to "unmodified",
then a copy of the unmodified block is made to the snapshot area prior
to the write being performed.  The flag is then set to modified.

Future writes to that specific block will have no effect on the flag
table, nor on the snapshot volume.

For your transaction log, the flag table is significant, but the actual
snapshot volume is not.  It is just the old unmodified content.

To get a true set of differences over a 24-hour period, you would have
to create a snapshot at time T, and another at time T+24.  (Easily done
I think).

Then have code that went thru the flag table for snapshot T and
retrieved the blocks from snapshot T+24 that were marked as modified. 
(LVM will automatically get the block from the appropriate source: T+24
or Master volume)

Once done, the snapshot T would be deleted, and snapshot T+24 would be
maintained.  At the 48 hour mark, snapshot T+48 would be created and the
process repeated.

I don't think that is a trivial issue, and I think the code would have
to implemented in the kernel.

New code would also have to be developed to apply the above blocks.

HTH
Greg
-- 
Greg Freemyer
