Date: Mon, 12 Jun 2000 14:53:22 -0500 (CDT)
From: Jay Weber <jay@lazy.accessus.net>
Subject: Re: [linux-lvm] LVM 0.8final for 2.2.15/2.2.16?
In-Reply-To: <Pine.LNX.4.21.0006121419500.16853-100000@rossi.itg.ie>
Message-ID: <Pine.OSF.4.21.0006121447220.27146-100000@lazy.accessus.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

You can get the patch from kernel.org /pub/linux/kernel/peopel/andrea/lvm
as well, that's the patch I was told SuSe is using.

Also, the kernel SRPM isn't available on SuSe ftp site last I checked, but
I found a kernel-patches.tar.gz in the 6.4 updates directory, which
includes the patches above. :)

I've noted that loopback device doesn't seem to work with the pvcreate
tool in the lvm-utils in andrea's backport or from the actual tarball from
the linux.msede.com.  It appears they changed the disk scanning procedure
and somewhere in that change the loop device doesn't show up in
/proc/partitions, hence never gets seen.

I believe I tried loop under 2.4-test1 as well (which has lvm included in
kernel) and it don't work there either?  Any thoughts?

On Mon, 12 Jun 2000, Paul Jakma wrote:

> On Tue, 6 Jun 2000, Andi Kleen wrote:
> 
> 
> > The SuSE 6.4 kernel contains a back port. You can download a source
> > rpm from ftp.suse.com 
> 
> you wouldn't have a specific URL would you?
> 
> --paulj
> 
