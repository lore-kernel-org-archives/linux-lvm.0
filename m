From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 18 Oct 2001 15:11:44 -0600
Subject: Re: [linux-lvm] snapshots
Message-ID: <20011018151144.N1144@turbolinux.com>
References: <MGEFJOBFIEAIADIKAMEKCECCCDAA.rdyas@adelphia.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MGEFJOBFIEAIADIKAMEKCECCCDAA.rdyas@adelphia.net>
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

On Oct 18, 2001  16:35 -0400, Robert Dyas wrote:
> 1)Has anyone had any luck creating a snapshot (lvcreate -L100M -s -n backup
> /dev/vg_master/lv_home) and then mounting it (mount -r /dev/vg_master/backup
> /mnt)? If so, what version of the kernel, mount tools, filesystem, etc are
> you using?

Yes, but I don't know the exact versions.

> 2) How can you use the snapshot feature to facilitate incremental or
> differential backups? Wouldn't the dump or other backup program have to
> twiddle the archive bit, but won't be able to since snapshots are readonly?

Um, "archive bit" is a severe DOS-ism, which doesn't exist in Unix.  An
incremental backup on Unix is based on the file modification timestamp
which does not need to be changed when doing the backup.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
