From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Rescue cd for lvm 1.0.3 (fwd)
Message-Id: <20020226092431.C12832@lynx.adilger.int>
References: <Pine.A32.4.33.0202261321320.16246-100000@as1.viastore.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.A32.4.33.0202261321320.16246-100000@as1.viastore.de>;
    from sar@viastore.de on Tue, Feb 26, 2002 at 01:27:40PM +0100
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
Date: Tue Feb 26 10:24:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Feb 26, 2002  13:27 +0100, Thorsten Sauter wrote:
> again a little question. i have currently the following configuration:
> 
> # fdisk -l /dev/hda
> /dev/hda1	1	1115		8e Linux LVM
> 
> /dev/hda1 => rootvg
> 
> rootvg
>    /dev/rootvg/root		/
>    /dev/rootvg/usr		/usr
>    /dev/rootvg/boot             /boot
> 
> Why this configuration is so bad? Is it better to leave the /boot on an
> "normal" ext2 filesystem? But, what files need the kernel from /boot to
> bootup the system correctly? I think the kernel will be stored in the
> master boot record with lilo?

Actually, if you use LILO it doesn't need to understand anything about LVM
in order to boot.  LILO 22.1 (or a patched LILO 21.6+) will talk with the
LVM driver to map out the blocks for the kernel and initrd into the MBR,
so that when you are booting it just reads the blocks by number.

Some possible problems include the fact that /boot may be too far from the
start of the disk and older BIOSes have problems with kernel/initrd over
cylinder 1024.  Also, you need to run LILO _every_ time you update your
kernel and initrd, because it has to re-map all of the blocks into the
MBR.

The real danger is having your / partition in LVM, because if there is
ever a problem with your LVM configuration then you cannot access the
right tools, and also your LVM config backups are inaccessible.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
