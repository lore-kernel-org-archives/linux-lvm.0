From: Benjamin Scott <bscott@ntisys.com>
Subject: Re: [linux-lvm] LVM performance
In-Reply-To: <20011123002611.N5393@sonsofthunder.yi.org>
Message-ID: <Pine.LNX.4.33.0111230911340.6061-100000@dragon.inside.ntisys.com>
MIME-Version: 1.0
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
Date: Fri Nov 23 08:08:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 23 Nov 2001, Bradley M Alexander wrote:
> the CD write actually happens from hdc -> hdd.

  This might be *a* problem.  As others have said, IDE handles bus
contention either very poorly or not at all.  Since you have all your I/O on
one bus, you may be seeing a problem there.

  For IDE, I generally favor putting HDs on one bus, and CDs/tapes on the
other.  Actually, I favor putting a single device on each bus.  Actually, I
favor SCSI.  :-)

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |
