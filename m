Return-Path: <root@srv.sistina.com>
Date: Wed, 16 May 2001 19:14:07 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: [PATCH] [CFT] - LVM snapshotting support for XFS
Message-ID: <20010516191407.A14631@sistina.com>
References: <Steph@connex.com> <200105141752.f4EHqWH19225@jen.americas.sgi.com>
Mime-Version: 1.0
In-Reply-To: <200105141752.f4EHqWH19225@jen.americas.sgi.com>; from lord@sgi.com on Mon, May 14, 2001 at 12:52:32PM -0500
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Steve,

thanks a lot for your patch which I've added to our feature patch queue.

I'ld like to add it to post 1.0 LVM.

Regards,
Heinz    -- The LVM Guy --


On Mon, May 14, 2001 at 12:52:32PM -0500, Steve Lord wrote:
> > This message is in MIME format. Since your mail reader does not understand
> > this format, some or all of this message may not be legible.
> > 
> > ------_=_NextPart_000_01C0DC9D.5B6166A0
> > Content-Type: text/plain;
> > 	charset="iso-8859-1"
> > 
> > I'll be glad to give this a try.  I've been using the attached patches (in a
> > tgz) to use snapshots with xfs in the past.  Basically they are some short
> > LVM patches to allow writable snapshots.  Using this I was able to take a
> > snapshot and mount the snapshot read-write, allowing XFS to straighten
> > things out (without the benefit of an xfs_freeze-like command, it was like
> > turning the power off on the original of the system).  Then I would unmount
> > the snapshot, change it back to read-only, and remount it for normal
> > snapshot use.
> > 
> > I did have one other problem using XFS snapshots.  As long as the original
> > was mounted, I couldn't mount the snapshot as well because it had the same
> > uuid.  So before I could mount the snapshot read-write I had to change the
> > UUID using xfs_db (which also required writeable snapshots).  Actually, I
> > had to change it twice.  My usual sequence would be something like this:
> 
> I forgot about the uuid change step in there, yes this will need changing
> to make the filesystem mountable - I will think about this. The reason for
> the uuid code in XFS is to deal with hardware which has alternate paths to
> disks - it prevents you from mounting the same filesystem from what appear
> to be two devices, but are actually alternate routes to the same disks. It
> may be reasonable to override it for readonly mounts - although that too
> is really dangerous in the alternate path case.
> 
> 
> > 
> > # sync
> > # lvcreate --size 100 --chunksize 64  --snapshot --name snap0
> > /dev/volgr1/lvol0
> > # lvchange -p rw /dev/volgr1/snap0
> > # xfs_db -x -p xfs_admin -c 'uuid generate'
> > # xfs_db -x -p xfs_admin -c 'uuid generate'
> > # mount /dev/volgr1/snap0 /hd/vol_mnt1
> > # umount /dev/volgr1/snap0
> > # lvchange -p r /dev/volgr1/snap0
> > # mount /dev/volgr1/snap0 /hd/vol_mnt1
> > 
> > With a way to freeze the filesystem, I should be safer than just calling
> > sync and I don't think I'll need to do the read-write mount to replay.  Is
> > there a way around changing the UUID?
> 
> Using this could you should be able to do a readonly mount of the xfs
> snapshotted filesystem, modulo the uuid issue.
> 
> Steve
> 
> > 
> > CCed to linux-lvm, since somebody over there may be interested in testing
> > XFS snapshots.
> > 
> > Dale Stephenson
> > steph@connex.com
> > 
> > > -----Original Message-----
> > > From: Steve Lord [mailto:lord@sgi.com]
> > > Sent: Monday, May 14, 2001 9:50 AM
> > > To: linux-xfs@oss.sgi.com
> > > Subject: [PATCH] [CFT] - LVM snapshotting support for XFS
> > > 
> > > 
> > > 
> > > Here is some experimental code for XFS which should allow use 
> > > of the LVM
> > > snapshotting capability. There are two attachments to this message, a
> > > kernel patch which will apply to the current development tree 
> > > (2.4.4 base)
> > > and a tar file which adds a new command to the xfs commands. 
> > > You will also
> > > need to apply the VFS-lock.patch from the lvm sources to 
> > > enable snapshotting.
> > > 
> > > The new command added is xfs_freeze which can be used to stop 
> > > and flush
> > > an xfs filesystem and then restart it. If you apply the VFS-lock patch
> > > from the lvm sources then you will not need this.
> > > 
> > > I am looking for people to test this code, previous 
> > > experience with lvm 
> > > and its snapshotting facility would probably be a pre-requisit.
> > > 
> > > Steve
> > > 
> > > 
> > > 
> > 
> > 
> > ------_=_NextPart_000_01C0DC9D.5B6166A0
> > Content-Type: application/octet-stream;
> > 	name="writesnap.tgz"
> > Content-Transfer-Encoding: base64
> > Content-Disposition: attachment;
> > 	filename="writesnap.tgz"
> > 
> > H4sIAAEsADsAA+1YbU/bSBDmK/yKKdLlkjpObCexSXIgUMvpqqNwAtp+KMgy9iZx8ZtsxyAd+e+3
> > L363EziOUl3lR2qzLzOzM7PjfXaxIpu/880QaTcW4gNH83qeFuqLrReEIAqCLA+3BAxFHhV+MSSJ
> > tJUBaY4UScDyQ3k02gLhJZ1Yh2UQaj7AVhAib1PUj83/T8HzPFims7zvG74ZIT/o20bfiuye3nN9
> > c759uVjCe6SDOARBmQz3JoMRSHindjiOW6OY1xHFyWg8GQ6YzuEh8KI8HnZFETjaGChweLgD2xgr
> > +kP/XwGyAgR/73Db2wCGe+dAu2VF/IEVqaREg4UbqgGyO1MmYc6g7d/B/j58Of9weQwPD5DrHnUS
> > SwD9t0CrHUIXEkuAUxAPLnx3OV8Qez6yNc9DBrztJ7pkldiJG8vVb1V0ryMvNF2HLHX66eQktxCA
> > 55tOeNv+8/j8VH2H/SAzbGr3lwBw1iNbxWtM4ORz5gqemS0t68rZ7WbyRNLRbNSFeHnSSWInWHqb
> > 80Pgo3DpOzj/6dgqafgGwnpaBPusGdpeKuQHSA9dP5mOe3kJkpY3xMV0ZZo7lqN2K7HI4qEhtXJm
> > csMeUsm3GOaGrKhTyCnePt1HGt4qDRx0B2SPTGee26TYnzYOF/tbcOvd2Zd2jTdQ702dO/ls5IeJ
> > mx3az5alFUXWVENytMbpiOZquDCDLtYo70P8E1c++RZwtDSVWXlY7tzUNQsi11raiITNYznygazb
> > f2JnQ+G+iQuXfYJP2MXi5mVJAhoR8WbpbazFOMwNJQvsFCD/bhb8wY1KFi/U5o8+NH8ikC0XeuOe
> > 8S3oWZG+0Jw5eukbAOF/RRmt5X9hqGT8L4iU/5WG/18FhP9PPn9UBXXcD13XCvppFVRvAJjNpfFk
> > IGQ3gHWqJa2BPBHl7A4wkMZdBbjBQOjuUf5PobtOiC8VaJqMrWhjh8/O9oQENV1HQQAt7IN6cXr0
> > 18UfZ5eULHKijwi3Wok0BZZ3PcwTHXKBoE0ta/odSkWZ9IwSPFklCA3k+13G6zywHAA+XSvn9m5O
> > v4rd+Fi/woaudsHBippluXfIIPcB0G2DHLMJ+9cljSZXEWhyFakrSkl2c9I0MYZrhnAAQjEkADqh
> > Bkub46ZJ0hmKiSQcF7enhRwSijZc59cQdAvhDyuWn1naPADGOzBzfbIP7K6mOQbpnB8fvac0nreV
> > I678BlLFTlG04iG/n4pOn2SVePA0o0SyZLMo9lBIT8EezT6pp4ilPy2ifPGQK01sykO+bQYB5urg
> > kerJsOvOyjcFVlL0Wvk0G6Vi+9HHVIPvhDz/R/NA1xx87r8u/2PiF8v8P1KUhv9fA1X+T6uAsv+F
> > FlIehzGI0mQoTYS9deyfKBZ0hpPBeCLt5d7/0qgr49e/JHeVhJ3wEQg65hRhmnbNYtdiXS7pWsVp
> > G+8ifoi4PsLjvx+dXBxnc+ywLYizV5rA+FKSh/gWwkmy3JXk4m0E48a6VdnzQyid5ITF2rFj+Oc3
> > iOaUA2ztHvc5rkKtyenP5L5a1+nrC0vyZdGyMLVNPMFKsVPqzEfoa9y5rnLXM2zU+MxQyPDl+acy
> > qZbTkuSlkpg4M/XKZY+LOVqrU1VLI93fEOkmexh11orG2kl1cCB2rtdlhGG1cZa++utiSN/Gtung
> > zOJw2N8dqNbHD6dn51inPsJ/H2J5sWSt2nWKwXf+S/TPDrxS2d876DS5zw533VTt+Krua6x+zvU1
> > znHX04p+yeKqudk1aNCgQYMGDRo0aNCgQYMGPz/+AWeG5d0AKAAA
> > 
> > ------_=_NextPart_000_01C0DC9D.5B6166A0--
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
