From: Bradley M Alexander <storm@tux.org>
Subject: Re: [linux-lvm] LVM fails at bootup
Message-ID: <20011116001859.D13162@sonsofthunder.yi.org>
References: <20011112141948.P715@sonsofthunder.yi.org> <20011112123227.U1778@lynx.no> <3BF323F5.5E90F63B@divsol.com> <20011115081208.B363@btconnect.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011115081208.B363@btconnect.com>
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
Date: Thu Nov 15 23:17:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 15, 2001 at 08:12:08AM +0000, Joe Thornber wrote:
> On Wed, Nov 14, 2001 at 07:09:57PM -0700, Jim Cromie wrote:
> > Andreas Dilger wrote:
> > 
> > > On Nov 12, 2001  14:19 -0500, Bradley M Alexander wrote:
> > > > I added the vgscan and the vgchange commands to the end of the checkroot.sh
> > > > script (which in Debian is different from the mountfs.sh script). When the
> > > > vgscan runs, it generates about two pages of drive errors:
> > > >
> > > > hdb: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
> > > > hdb: read_intr: error=0x04 { DriveStatusError }
> 
> I've also seen this error when the kernel mistakenly thought there was
> a partition on an IDE disk that I was using as a PV.  The vgscan command
> then trys to look at this bogus partition and causes all these errors.

Hmmm...The thing is that the only thing _on_ this hard drive is a PV. I
gave the entire disk to LVM, by creating a PV on it:

pvcreate /dev/hdb

But now that I think about it, since the lvcreate required the absolute
path through devfs (/dev/ide/host0/bus0/target1/lun0/disc), perhaps the
pvcreate should have been done this way as well...But why would it work
manually and not at boot? 

Let me try recreating it and try it again...

Thanks Joe,
-- 
--Brad
============================================================================
Bradley M. Alexander, CISSP              |   Co-Chairman,
Beowulf System Admin/Security Specialist |    NoVALUG/DCLUG Security SIG
Debian/GNU Linux Developer		 |   storm@debian.org
                                         |   storm@tux.org
============================================================================
Stay out of clouds. The silver lining everyone keeps talking
about might be another airplane going in the opposite direction.
Reliable sources also report that mountains have been known to hide
out in clouds.
					--Rules of the Air, #13
