Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
Subject: Re: [linux-lvm] summary of what I need to do to mount snapshot on XFS
References: <1010503449.28039.5.camel@cali.nesnahhouse.com>
    <20020109130259.GC744@tykepenguin.com>
    <1010606990.15375.22.camel@jeremy-linux.intranet.qualys.com>
In-Reply-To: <1010606990.15375.22.camel@jeremy-linux.intranet.qualys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16OSId-0005Vf-00@hermes.sistina.com>
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
Date: Wed Jan  9 17:39:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com, Jeremy Hansen <jeremy@troubletext.com>

If this works for you - good.  I have had heaps of issues that I have been 
working with various developers and trying to get fixed.

Basically if I used the SGI 2.4.17-xfs kernel with lvm-1.0.1rc4(ish) some 
file systems would work but others would fail.  Some would fail on snapshot 
creation, others would fail on snapshot mount and others would fail when the 
snapshot overflowed.  When I upgraded LVM to lvm-1.0.1 other filesystems 
issues were fixed but others broke again.  Check out the "Unable to get XFS, 
ext3, reiserfs & LVM to coexist happily"
http://marc.theaimsgroup.com/?l=linux-lvm&m=100994364215110&w=2
 thread on linux-lvm / linux-xfs mail archives and see if any of this relates 
to your problem.  With 2.4.17-xfs + lvm-1.0.1 upgrade patch + VFS-lock patch 
ext2/3 & resierfs will operate correctly but XFS will fail at snapshot 
creation.  You can do a little source code change and get a XFS snapshot 
created and mounted; but then it will fail on an overfull snapshot.  These 
problems are being worked on by myself and the great SGI XFS developers.

The lvm.c change you talk about I assume is the LVM_VFS_ENHANCEMENT change?  
For some reason when adding the lvm-1.0.1 upgrade patch this disappears from 
lvm.c   I have been able to get this to compile with the change but I have 
forgoten what I did.  

This is one question I would like answered by the LVM gurus:  should #define 
LVM_VFS_ENHANCEMENT still be there after upgrading to lvm-1.0.1?  What does 
LVM_VFS_ENHANCEMENT actually do w.r.t lvm-1.0.1rc4(ish) and lvm-1.0.1?  I 
know that LVM_VFS_ENHANCEMENT in older LVM versions was the locking of the 
VFS so that snapshots would be consistant - is this still correct and is it 
still needed?

For the "large discussion" you are talking about the "Unable to get XFS, 
ext3, reiserfs & LVM to coexist happily" thread - hit me off list and I will 
attempt to summarise it for you.

On Thu, 10 Jan 2002 06:09, Jeremy Hansen wrote:
> My issue wasn't so much with how to create the snapshot but how to
> simultaneously mount the snapshot with the live filesystem.  I saw a big
> thread about having to uncomment from lvm.c, did that but then got
> unresolved symbols...
>
> It seemed as if there were some issues and a large discussion related to
> doing this with XFS.
>
> Thanks
> -jeremy

-- 
Adrian Head

(Public Key available on request.)
