From: Bradley M Alexander <storm@tux.org>
Subject: Re: [linux-lvm] LVM fails at bootup
Message-ID: <20011112153013.Q715@sonsofthunder.yi.org>
References: <20011112141948.P715@sonsofthunder.yi.org> <20011112123227.U1778@lynx.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011112123227.U1778@lynx.no>
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
Date: Mon Nov 12 14:29:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Nov 12, 2001 at 12:32:27PM -0700, Andreas Dilger wrote:
> On Nov 12, 2001  14:19 -0500, Bradley M Alexander wrote:
> > I added the vgscan and the vgchange commands to the end of the checkroot.sh
> > script (which in Debian is different from the mountfs.sh script). When the
> > vgscan runs, it generates about two pages of drive errors:
> > 
> > hdb: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
> > hdb: read_intr: error=0x04 { DriveStatusError }
> 
> Don't know about this - looks like hardware problems.

I thought so too, but the fact that it only happens when I try to enable
LVM at bootup makes me think its not. I had a Debian mirror on this drive
prior to this, and it never gave me errors, and if I boot without LVM and
enable it after boot by hand, I don't get these errors. I'm suspecting its
some interaction with devfs, which is why I came here. 

> > followed by two
> > 
> > modprobe: Can't locate module /dev/vg01
> > I get a series of "Can't locate module /dev/vg01/<logical volume> errors.
> 
> Maybe you need the following lines in your /etc/modules.conf:
> 
> alias block-major-58 lvm-mod
> alias char-major-109 lvm-mod

I compiled it into the kernel rather than modular. But I added these to
modules.conf anyway. No change.

-- 
--Brad
============================================================================
Bradley M. Alexander, CISSP              |   Co-Chairman,
Beowulf System Admin/Security Specialist |    NoVALUG/DCLUG Security SIG
Debian/GNU Linux Developer		 |   storm@debian.org
                                         |   storm@tux.org
============================================================================
Always try to keep the number of landings you make equal to the
number of take offs you've made.
					--Rules of the Air, #14
