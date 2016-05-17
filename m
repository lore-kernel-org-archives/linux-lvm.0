References: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
	<5739B848.3060505@redhat.com> <119b520d472b019ced48357eff9fb389@dds.nl>
	<5739D494.2040103@redhat.com> <88ecf232d113c573e524088e67204c4f@dds.nl>
	<573AE7BD.3000008@redhat.com> <5751b613e8123d1c61ef8d08a5c01ea3@dds.nl>
	<57318838-1c71-f4e6-9869-a3f19df56a8b@redhat.com>
	<e3a1d746d1fc7279a7a9cd719cc3b4b4@dds.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <11d1b01f-f4cc-fcb7-8e47-4f819abc3341@redhat.com>
Date: Wed, 18 May 2016 00:26:23 +0200
MIME-Version: 1.0
In-Reply-To: <e3a1d746d1fc7279a7a9cd719cc3b4b4@dds.nl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Unexptected filesytem unmount with thin provision
 and autoextend disabled - lvmetad crashed?
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
To: Xen <list@xenhideout.nl>, LVM general discussion and development <linux-lvm@redhat.com>

On 17.5.2016 22:43, Xen wrote:
> Zdenek Kabelac schreef op 17-05-2016 21:18:
>
> I don't know much about Grub, but I do know its lvm.c by heart now almost :p.

lvm.c by grub is mostly useless...

> One of the things I don't think people would disagree with would be having one
> of either of:
>
> - autoextend and waiting with writes so nothing fails
> - no autoextend and making stuff read-only.

ATM user needs to write his own monitoring plugin tool to switch to
read-only volumes - it's really as easy as running bash script in loop.....


> Alright. BugZilla is just for me not very amenable to /positive changes/, it
> seems so much geared towards /negative bugs/ if you know what I mean. Myself I
> would like to use more of Jira (Atlassian) but I did not say that ;-).

We call them 'Request For Enhancements' BZ....

>> To give some 'light' where is the 'core of problem'
>>
>> Imaging you have few thin LVs.
>> and you operate on a single one - which is almost fully provisioned
>> and just a single chunk needs to be provisioned.
>> And you fail to write.  It's really nontrivial to decided what needs
>> to happen.
>
> First what I proposed would be for every thin volume to have a spare chunk.
> But maybe that's irrelevant here.

Well the question was not asking for your 'technical' proposal, as you have no 
real idea how it works and your visions/estimations/guesses have no use at all 
(trust me - far deeper thinking was considered so don't even waste your time 
to write those sentences...)

Also forget you write a new FS - thinLV is block device so there is no such 
think like 'fs allocates' space on device - this space is meant to be there....

> When you say "it is nontrivial to decide what needs to happen" what you mean
> is: what should happen to the other volumes in conjunction to the one that
> just failed a write (allocation).

Rather think in terms:

You have 2 thinLVs.

Origin + snapshot.

You write to origin - and you miss to write a block.

Such block may be located in  'fs' journal, it might be a 'data' block,
or fs metadata block.

Each case may have different consequences.

When you fail to write an ordinary (non-thin) block device  - this block is 
then usually 'unreadable/error' - but in thinLV case - upon read you get 
previous 100% valid' content - so you may start to imagine where it's all heading.

Basically solving these troubles when pool is 'full' is 'too late'.
If user wants something 'reliable'  - he needs to use different thresholds -
i.e. stopping at 90%....

But other users might be 'happy' with missing block (failing write area) and 
rather continue to use 'fs'....

You have many things to consider - but if you make policies too complex,
users will not be able to use it.

Users are already confused with 'simple' lvm.conf options like 
'issue_discards'....


> Personally, I feel the condition of a filesystem getting into a "cannot
> allocate" state, is superior.

As said - there is no thin-volume filesystem.


> However in this case it needs no other information. It is just a state. It
> knows: my block devices has 4M blocks (for instance), I cannot get new ones

Your thinking is from 'msdos' era - single process, single user.

You have multiple thin volumes active, with multiple different users all 
running their jobs in parallel and you do not want to stop every user when you 
are recomputing space in pool.

There is really no much point in explaining further details unless you are
willing to spend your time understanding deeply surrounding details.


> * In your example, the last block of the entire thin pool is now gone
> * In your example, no other thin LV can get new blocks (extents, chunks)
> * In your example, all thin LVs would need to start blocking writes to new
> chunks in case there is no autoextend, or possibly delay them if there is.
>
> That seems pretty trivial. The mechanic for it may not. It is preferable in my
> view if the filesystem was notified about it and would not even *try* to write

There is no 'try' operation.

It would probably O^2 complicate everything - and the performance would
drop by major factor - as you would need to handle cancellation....

> new blocks anymore. Then, it can immediately signal userspace processes
> (programs) about writes starting to fail.

For simplicity here - just think about failing 'thin' write as a disk with 
'write' errors, however upon read you get last written content....

>
> Will mention that I still haven't tested --errorwhenfull yet.
>
> But this solution does seem to indicate you would need to either get all
> filesystems to either plainly block all new allocations, or be smart about it.
> Doesn't make a big difference.

'extX' will switch to  'ro'  upon write failure (when configured this way).

'XFS' in 'most' cases now will shutdown itself as well (being improved)

extX is better since user may still continue to use it at least in read-only 
mode...


> It seems completely obvious that to me at this point, if anything from LVM (or
> e.g. dmeventd) could signal every filesystem on every affected thin volume, to
> enter a do-not-allocate state, and filesystems would be able to fail writes
> based on that, you would already have a solution right?

'bash' loop...


> It would be a special kind of read-only. It would basically be a third state,
> after read-only, and read-write.

Remember - not writing  'new' fs....

>
> But it would need to be something that can take affect NOW. It would be a kind
> of degraded state. Some kind of emergency flag that says: sorry, certain
> things are going to bug out now. If the filesystem is very smart, it might
> still work for a while as old blocks are getting filled. If not, new
> allocations will fail and writes will ....somewhat randomly start to fail.

You are preparing for lost battle.
Full pool is simply not a full fs.
And thin-pool may get out-of-data  or out-of-metadata....

>
> That would normally mean that filesystem operations such as DELETE would still

You really need to sit and think for a while what the snapshot and COW does 
really mean, and what is all written into a filesystem  (included with 
journal) when you delete a file.

> work, ie. you keep a running system on which you can remove files and make space.
>
> That seems to be about as graceful as it can get. Right? Am I wrong?

Wrong...

But on of our 'polices' visions are to also use 'fstrim' when some threshold 
is reached or before thin snapshot is taken...


Z.
