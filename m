From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] LVM fails at bootup
Message-ID: <20011112123227.U1778@lynx.no>
References: <20011112141948.P715@sonsofthunder.yi.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011112141948.P715@sonsofthunder.yi.org>; from storm@tux.org on Mon, Nov 12, 2001 at 02:19:48PM -0500
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
Date: Mon Nov 12 13:31:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bradley M Alexander <storm@tux.org>
Cc: linux-lvm@sistina.com

On Nov 12, 2001  14:19 -0500, Bradley M Alexander wrote:
> I added the vgscan and the vgchange commands to the end of the checkroot.sh
> script (which in Debian is different from the mountfs.sh script). When the
> vgscan runs, it generates about two pages of drive errors:
> 
> hdb: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
> hdb: read_intr: error=0x04 { DriveStatusError }

Don't know about this - looks like hardware problems.

> followed by two
> 
> modprobe: Can't locate module /dev/vg01
> I get a series of "Can't locate module /dev/vg01/<logical volume> errors.

Maybe you need the following lines in your /etc/modules.conf:

alias block-major-58 lvm-mod
alias char-major-109 lvm-mod

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
