Message-Id: <XFMail.20020401221818.jtrostel@snapserver.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
In-Reply-To: <20020402085912.G52863@wobbly.melbourne.sgi.com>
From: jtrostel@snapserver.com
Subject: [linux-lvm] Re: DQUOT_SYNC undefined in XFS CVS kernel (was: Can't build CVS
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
Date: Mon Apr  1 21:18:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Nathan Scott <nathans@sgi.com>
Cc: linux-lvm@sistina.com, linux-xfs@oss.sgi.com, Bas <weblists@gmx.net>, Jan Kara <jack@ucw.cz>, Adrian Head <ahead@bigpond.net.au>

Sorry.... I should have been paying attention... I too found this last week
when I was updating our XFS builds.  I also just changed the DQUOT_SYNC(dev) to
DQUOT_SYN_DEV(dev) and have not noticed any more strange manifestations from
that.

So... there's at least one more data point for you.

On 01-Apr-2002 Nathan Scott wrote:
> On Fri, Mar 29, 2002 at 10:26:41PM +1000, Adrian Head wrote:
>> I have also run into the XFS CVS kernel compile failing because of an 
>> undefined DQUOT_SYNC.  
>> 
>> Using the information given by Nathan I have tracked down the offending
>> patch 
>> that causes the problems.  In my case it was the LVM VFS-lock patch from the
>> Sistina LVM project.  What they seem to do is use DQUOT_SYNC to force the 
>> writing of cached Quota infomation before they lock the VFS during snapshot 
>> creation.  It would also seem that EVMS does the same thing.  
> 
> Aha, thanks for tracking this down Adrian.
> 
>> I expect that the XFS CVS kernel tree is actually ahead of the standard 
>> 2.4.18 kernel tree in this respect so we'll have to wait until 2.4.19 is 
>> released with the updated API's before other projects update their kernel 
>> patches.
> 
> Yes, the XFS trees contain all of the quota patches from:
> ftp://atrey.karlin.mff.cuni.cz/pub/local/jack/quota/v2.4/
> 
> I wouldn't expect these patches to be in 2.4.19 -- they are
> not in 2.5 yet and I think Jan is concentrating on that step
> first.
> 
>> Grep'ing through the kernel I have not been able to find any comments or 
>> explanations regarding this - so I have assumed that DQUOT_SYNC can be 
>> changed to DQUOT_SYNC_DEV without problems.  
> 
> Yes, by my understanding of the VFS quota subsystem that would
> be the correct thing to do.
> 
>> After making that change the kernel compiles cleanly and boots.  I'm unsure 
>> as yet if I have done the correct thing here.  Hopefuly someone will be able
>> to help us out and correct me if I'm incorrect.
> 
> I believe your change is correct, I've CC'd Jan in case there is
> anything that I've overlooked.
> 
> cheers.
> 
> 
>> The offending part of the VF-lock patch follows below:
>> 
>> Index: linus.21/fs/buffer.c
>> --- linus.21/fs/buffer.c Mon, 28 Jan 2002 09:51:50 -0500 root 
>> (linux/i/45_buffer.c 1.5.2.6 644)
>> +++ linus.21(w)/fs/buffer.c Mon, 28 Jan 2002 11:54:36 -0500 root 
>> (linux/i/45_buffer.c 1.5.2.6 644)
>> @@ -361,6 +361,34 @@
>>         fsync_dev(dev);
>>  }
>> 
>> +int fsync_dev_lockfs(kdev_t dev)
>> +{
>> +       /* you are not allowed to try locking all the filesystems
>> +       ** on the system, your chances of getting through without
>> +       ** total deadlock are slim to none.
>> +       */
>> +       if (!dev)
>> +               return fsync_dev(dev) ;
>> +
>> +       sync_buffers(dev, 0);
>> +
>> +       lock_kernel();
>> +       /* note, the FS might need to start transactions to
>> +       ** sync the inodes, or the quota, no locking until
>> +       ** after these are done
>> +       */
>> +       sync_inodes(dev);
>> +       DQUOT_SYNC(dev);   
>>          ^<====  ****All I did was to change this to
>>          DQUOT_SYNC_DEV(dev);****
>> +       /* if inodes or quotas could be dirtied during the
>> +       ** sync_supers_lockfs call, the FS is responsible for getting
>> +       ** them on disk, without deadlocking against the lock
>> +       */
>> +       sync_supers_lockfs(dev) ;
>> +       unlock_kernel();
>> +
>> +       return sync_buffers(dev, 1) ;
>> +}
>> +
>>  asmlinkage long sys_sync(void)
>>  {
>>         fsync_dev(0);
>> 
>> 
>> On Thu, 28 Mar 2002 07:30, Nathan Scott wrote:
>> > Hello,
>> >
>> > On Wed, Mar 27, 2002 at 09:45:48AM +0100, Bas wrote:
>> > > Hi,
>> > >
>> > > It's not possible for me to build the kernel mentioned above. I saw the
>> > > new qouta options and suspect it has something to do with it, but I'm
>> > > not
>> > > sure.
>> > >
>> > > Building everything goes fine, but at the end of the run it's not able
>> > > to
>> > > produce a kernel because of DQUOT_SYNC. I don't have the exact error
>> > > here.
>> >
>> > Hmm... 20020327 - that's yesterday.  DQUOT_SYNC doesn't appear in
>> > the source at all anymore (for awhile now), so I suspect the problem
>> > must be at your end.  Try getting a fresh CVS copy and/or "make clean".
>> > [ The other patches you mentioned should not have anything to do with
>> > this problem. ]
>> >
>> > $ find . -type f | xargs fgrep DQUOT_SYNC
>> > ./fs/buffer.c:  DQUOT_SYNC_SB(sb);
>> > ./fs/buffer.c:  DQUOT_SYNC_DEV(dev);
>> > ./include/linux/quotaops.h:#define DQUOT_SYNC_DEV(dev) 
>> > sync_dquots_dev(dev, -1) ./include/linux/quotaops.h:#define
>> > DQUOT_SYNC_SB(sb)    sync_dquots_sb(sb, -1)
>> > ./include/linux/quotaops.h:#define DQUOT_SYNC_DEV(dev)                  do
>> > { } while(0) ./include/linux/quotaops.h:#define DQUOT_SYNC_SB(sb)         
>> >          do { } while(0) $
>> >
>> > FWIW, DQUOT_SYNC used to come from include/linux/quotaops.h
>> > too, and its definition was also dependent on CONFIG_QUOTA.
>> > The reason you'd be getting an unresolved symbol would be a
>> > file referencing DQUOT_SYNC wasn't #include'ing quotaops.h;
>> > but thats all by-the-by - the real problem is related to the
>> > source you're using I suspect - it certainly doesn't match
>> > CVS of yesterday.
>> >
>> > cheers.
>> 
>> -- 
>> Adrian Head
>> 
>> (Public Key available on request.)
> 
> -- 
> Nathan

-- 
John M. Trostel
Senior Software Engineer
Quantum Corp. / NASD
jtrostel@snapserver.com
