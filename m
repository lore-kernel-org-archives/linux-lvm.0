From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] summary of what I need to do to mount snapshot on XFS
Message-Id: <20020115104724.B11251@lynx.adilger.int>
References: <1010503449.28039.5.camel@cali.nesnahhouse.com>
    <E16OSId-0005Vf-00@hermes.sistina.com> <20020115151621.E11005@sistina.com>
    <E16QVD9-0003HS-00@hermes.sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16QVD9-0003HS-00@hermes.sistina.com>; from
    ahead@bigpond.net.au on Wed, Jan 16, 2002 at 01:09:16AM +1000
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
Date: Tue Jan 15 11:48:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Head <ahead@bigpond.net.au>
Cc: linux-lvm@sistina.com

On Jan 16, 2002  01:09 +1000, Adrian Head wrote:
> On Wed, 16 Jan 2002 00:16, Heinz J . Mauelshagen wrote:
> > > The lvm.c change you talk about I assume is the LVM_VFS_ENHANCEMENT
> > > change? For some reason when adding the lvm-1.0.1 upgrade patch this
> > > disappears from lvm.c   I have been able to get this to compile with the
> > > change but I have forgoten what I did.
> > >
> > > This is one question I would like answered by the LVM gurus:  should
> > > #define LVM_VFS_ENHANCEMENT still be there after upgrading to lvm-1.0.1?
> >
> > Yes.
> 
> I have found that using the generated lvm-1.0.1 upgrade patch that the 
> #define LVM_VFS_ENHANCEMENT gets removed.  If all I do is add it back in 
> manually - do I need to worry about other areas of the code that also need 
> touch-ups?  How would I tell?

Well, when you generate a new LVM patch it will just do a "diff" between
the lvm.c file in the LVM/kernel directory and the linux/md/lvm.c file.
If the VFS-lock patch is applied to the kernel sources and not the
LVM/kernel sources, it will be removed by the diff, meaning you will
need to apply the VFS-lock patch to the kernel again.

If you find you are doing a lot of patching, you could apply the VFS-lock
patch to the LVM/kernel/lvm.c file, and then subsequent patches that you
create will not have this part removed.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
