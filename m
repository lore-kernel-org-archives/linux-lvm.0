Date: Thu, 8 Jun 2000 10:23:21 +0200
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] LVM 0.8final for 2.2.15/2.2.16?
Message-ID: <20000608102321.A9694@jadzia.josv.com>
References: <200006080022.CAA16063@e35.marxmeier.com> <Pine.LNX.4.21.0006080135510.26807-100000@fogarty.jakma.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0006080135510.26807-100000@fogarty.jakma.org>; from paul@clubi.ie on Thu, Jun 08, 2000 at 01:47:35AM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Jakma <paul@clubi.ie>
Cc: Michael Marxmeier <mike@msede.com>, jan@gondor.com, ak@suse.de, linux-lvm@msede.com

I have followed only part of this thread, but the gest I get is that
people want to take an LVM snapshot of a file system, and the issue
at hand is the status of the file system after the sync. I would like
to make some remarks based on my experience with other volume managers
and file systems. If all or most of this is already a piece of cake
for you, please ignore it, but I reckon that there will be people
on the list (or reading the archives) that will find this useful.

1) To be useful the snapshot must be "atomic", which means that the
   snapshotted LV contains an image which conforms to the orginal at
   a certain time. Since creating the snapshot usually involves some
   copying of data blocks (to put it mildly) during which you do not
   pause the entire system, a smart mechanism must be created to 
   maintain this "illusion" of atomicity. 

   In HP's LVM a snapshot can only be created by splitting of a
   mirror copy from a mirrored LV (thus decreasing the number of
   mirror copies of the volume. It is this reason by 3-way mirroring
   is supported by HP LVM). To create a snapshot one usually first
   extends the number of mirror copies and then splits off the freshly
   created mirror.

   The Veritas eXtended File System (vxfs) has a built-in snapshot
   system which works kind-a interesting. Instead of doing a full
   block device copy of the file system, it uses an "overflow"
   block device where it saves the originals of a changed block
   in the original block device. When looking at the snapshot, the
   vxfs first checks the overflow area if a copy of the requested
   block is available there. If it is, that block is returned, if
   it isn't, the block is read from the underlying original since
   it obviously hasn't been changed since the creation of the
   snapshot (otherwise the original would have been present in the
   overflow area). In the worst case the overflow area must be as
   big as the original, but in typical cases it needs only be
   10% of the size of the original. After system reboot, the
   snapshot copy is gone.

   I would guess that such a volatile snapshot facility could be
   made into a generic feature available for every block device!

2) If you have a snapshot of a logical volume, the file system in
   there is always corrupt and needs to be fsck'ed. The point in
   time (atomic) creating of the snapshot resembles a system crash
   as far as the content of the snapshot is concerned. An fsck is
   therefore necessary. (A nice feature of the vxfs snapshot is that
   this fsck is not necessary, because the feature is implemented
   at the *file system* level).

3) People have been searching for a long time for a method to 
   prevent this fsck. You would need to have full cooperatioon with
   the file system code for this. The fs should support a "quiesce"
   function (through the vfs layer) which would result in a complete
   update of all ondisk data of the fs. A complete block sync is
   not enough because an fs might have incore data that should be
   flushed but which is not in the block buffer cache (think:
   inode cache, log, B-tree info). Doing a full sync just before
   the atomic snapshot is a good idea however because it limits
   the damage fsck must repair.

   And, but: READ ON:

4) Even if we could quiesce the fs, the resulting snapshot would
   still be partially corrupt because of the fact that we have
   (could have) open files in the file system. If an application
   updates its data with more than one write() system call, and
   the snapshot creation happens between two consecutive write()'s,
   the applications ondisk data is corrupt (from an application
   point of view). What we normally do in complex backup situations
   is stop the application, sync the fs, create the snapshot,
   start the application, backup the snapshot. In that scenario
   we have a stable copy of the application's data with only a
   minimal application downtime. This scenario also applies
   if you use hardware RAID snapshot features such as the
   Business Continuity Volumes of EMC's Symmetrix, or the
   Business Copy feature of HP's XP256.

5) So, ideally we would need an "application quiesce" in which
   we can instruct the application to update its ondisk image
   by making all necessary changes to its disk data (flush()ing)
   and informing the operating system of its quiesced state, 
   upon which the OS could make the snapshot and free the
   application to make changes again. Unix just does not support
   this particular model of application/OS interaction. And,
   most applications are internally not architected to easily
   support a quiesce. And the ones that are, are usually
   database management systems (such as Oracle) for which
   you can buy online backup features (such as Oracle Enterprise
   Backup Utility) with which you can create a stable copy of the
   database without snapshots or other features.


++Jos


And thus it came to pass that Paul Jakma wrote:
(on Thu, Jun 08, 2000 at 01:47:35AM +0100 to be exact)

> On Thu, 8 Jun 2000, Michael Marxmeier wrote:
> 
> > IMHO when creating a snapshot LVM could simply sync all outstanding
> > buffers for the block device vialog block_fsync() (not sure if this
> 
> to be 100% safe there must be no possibility that some fs code could
> run between block_fsync() and the actual point of snapshot creation i
> think. (right?)
>  
> > does a lock_kernel() is might even be sufficient.
> > 
> > Any reason why this is not suffiecient?
> > 
> 
> if you can be sure that lvm-snapshot won't be intterrupted between
> the sync and the actual snapshot, then it should be ok, shouldn't it?
> 
> > Michael
> > 
> 
> regards,
> -- 
> Paul Jakma	paul@clubi.ie
> PGP5 key: http://www.clubi.ie/jakma/publickey.txt
> -------------------------------------------
> Fortune:
> The unfacts, did we have them, are too imprecisely few to warrant our certitude.

-- 
The InSANE quiz master is always right!
(or was it the other way round? :-)
