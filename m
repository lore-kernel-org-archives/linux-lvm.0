From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] error in mounitng snapshot LVs
Message-Id: <20020205233335.I2928@lynx.turbolabs.com>
References: <20011221084531.A22947@lsc.hu>
    <Pine.LNX.4.43.0202060830060.24753-100000@anubhav.lan.deeproot.co.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.43.0202060830060.24753-100000@anubhav.lan.deeproot.co.in>;
    from abhas@deeproot.co.in on Wed, Feb 06, 2002 at 08:38:46AM +0000
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
Date: Wed Feb  6 00:34:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Abhas Abhinav <abhas@deeproot.co.in>
Cc: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

On Feb 06, 2002  08:38 +0000, Abhas Abhinav wrote:
> Lately, i decided to start using snapshots to backup some data. I
> created snapshot volumes as per the lvcreate man page and the
> LVM-HOWTO on the sistina web site... however, i get stuck everytime i
> try to moung the snapshot...
> -------
> anubhav:~# mount /dev/data/snap_work /mnt
> mount: block device /dev/data/snap_work is write-protected, mounting read-only
> mount: wrong fs type, bad option, bad superblock on /dev/data/snap_work,
>        or too many mounted file systems

You need the "VFS-lock" patch, from the LVM CVS repository.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
