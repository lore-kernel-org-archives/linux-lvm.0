From: Nathan Scott <nathans@sgi.com>
Message-ID: <20020606232137.GB479@frodo>
References: <OF73D30ECA.36498F9C-ONC1256BD0.004E5691@kancelar.seznam.cz> <200206061435.g56EZpl28164@mail.pronto.tv>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200206061435.g56EZpl28164@mail.pronto.tv>
Subject: [linux-lvm] Re: mkfs - cannot set blocksize
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
Date: Thu Jun  6 18:23:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek.Les@firma.seznam.cz, Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Cc: linux-xfs@oss.sgi.com, linux-lvm@sistina.com

hi,

On Thu, Jun 06, 2002 at 04:35:51PM +0200, Roy Sigurd Karlsbakk wrote:
> linux ia32 only supports 4kB block size

4K pagesize, not blocksize.  [filesystem] blocksizes smaller than 4K
are also supported.  Thats unrelated to this problem though, which is
related to the device driver blocksize... mkfs is trying to tell the
device to do IOs in 512 byte chunks, but its not listening.  There's
some corner cases where mkfs will fail if the device driver ignores
its request to change the device block size.

> On Thursday 06 June 2002 16:27, Marek.Les@firma.seznam.cz wrote:
> > Hello,
> >
> > I am trying to test XFS with LVM and I've encountered this error while
> > trying to do mkfs.xfs on the LVM logical volume:
> > 
> > mkfs.xfs: warning - cannot set blocksize on block device
> > /dev/test_vg/test_lv: Invalid argument
> > I tried to find something in the mailing list but the only thing I found
> > was something about EVMS but no LVM stuff. Can anyone tell me, what exactly
> > this warning means and (if possible) how to get rid of it?
                                         ^^^^^^^^^^^^^^^^^^^^
We need to contact the LVM folks and ask them to implement the
BLKBSZSET ioctl (and while I'm at it, I'll mention that ENOTTY
should be returned instead of EINVAL for unrecognised ioctls,
apparently).

cheers.

-- 
Nathan
