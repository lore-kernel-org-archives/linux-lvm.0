Message-ID: <4FE97CD6.70707@redhat.com>
Date: Tue, 26 Jun 2012 11:11:50 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <4FE8770C.7090502@shiftmail.org>
	<20120625162703.GC17857@agk-dp.fab.redhat.com>
In-Reply-To: <20120625162703.GC17857@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Still missing for supporting dm-thin
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
To: Spelic <spelic@shiftmail.org>, linux-lvm@redhat.com

Dne 25.6.2012 18:27, Alasdair G Kergon napsal(a):
> On Mon, Jun 25, 2012 at 04:34:52PM +0200, Spelic wrote:
>> 1) It is not possible to backup and restore a VG config (vgcfgrestore in
>> particular refuses to work) if there is a dm-thin volume. This is a very
>> serious problem that does not allow to recover even non-thin volumes if
>> there is a thin volume around. Even automatic backups from
>> /etc/lvm/archive cannot be restored/used. This puts data at risk, please
>> fix this.
>
> We do want to find a way to do this for non-thin volumes - the current
> restrictions are indeed tighter than they need to be.
>
> For thin volumes though it's a complex problem to work out what can
> be restored safely and what can't.  (The metadata saying where a volume is is
> now split between the LVM metadata and the thin metadata.)

We need history also for all LVs used by thin-pool - so currently the safest
is to disable restore until we are sure we could provide some solution, where 
the user does not easily break whole VG in non-repairable way.

>
>> 2) less important: it is apparently not possible to change the --zero
>> flag for a thin pool once created.
>
> That should be just another lvchange parameter.
>


While going from  --zero mode to non zero is quite ok, the opposite direction 
might have unexpected side effects.

If the block were provisioned in the non-zero mode - they may have random pool 
content on unwritten data areas - thus if user may arbitrarily switch between 
zeroing type - the content would be unpredictable, and we would need to keep 
this as some history flag - once the pool was started without zeroing,
we may not guarantee, provisioned unwritten data blocks will have zero 
content.  So for full support we have to make clear, how we will keep history 
info - i.e. to avoid bugreports where the weird data will be received in the 
zero mode.  (something like tainted kernel ?)

It is getting even more complex when I play with discard options...

Zdenek
