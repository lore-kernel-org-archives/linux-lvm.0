From: Eric Sandeen <sandeen@sgi.com>
In-Reply-To: <200201020451.g024pPg00867@oss.sgi.com>
References: <200201020451.g024pPg00867@oss.sgi.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1010173926.1414.12.camel@stout.americas.sgi.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to coexist happily
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
Date: Fri Jan  4 13:49:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Head <ahead@bigpond.net.au>
Cc: Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

Ok, I have 2.4.17-xfs (cvs checkout today) with patches from lvm-1.0.1,
applied lvm-1.0.1-2.4.17-xfs.patch then linux-2.4.11-VFS-lock.patch.

I tried creating lvm volumes & snapshots w/ an xfs filesystem.

I did run into problems (creating snapshot against my "test" volume
while it was mounted caused an oops; creating snapshot volume then
mounting test oopsed....) but eventually I got a volume mounted, and had
a snapshot volume against it.

Overflowing the snapshot behaved well:

lvm -- giving up to snapshot /dev/test/foo on /dev/test/snap: out of
space

I'll check out the oopses to see if I can figure out what's going on.

-Eric

On Tue, 2002-01-01 at 21:51, Adrian Head wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hope everyone had a happy new year  :-)
> 
> I'm starting to play around with LVM with the goal of having XFS, ext3, 
> reiserfs and LVM coexist nicely together.  
> 
> Has anyone been able to get , ext3, reiserfs, XFS and LVM running nicely 
> together?  

-- 
Eric Sandeen      XFS for Linux     http://oss.sgi.com/projects/xfs
sandeen@sgi.com   SGI, Inc.
