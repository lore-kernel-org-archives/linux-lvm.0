From: Benjamin Scott <bscott@ntisys.com>
Subject: Re: [linux-lvm] LVM performance
In-Reply-To: <3BFDEE1A.1161DD24@dpma.de>
Message-ID: <Pine.LNX.4.33.0111230914020.6061-100000@dragon.inside.ntisys.com>
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
Date: Fri Nov 23 08:11:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 23 Nov 2001, Volker Jahns wrote:
> Also, why don't you use a "cheap" raid controller which will do the
> homework for you in hardware _not_ software?

  Most "cheap" IDE "RAID controllers" implement RAID in the device driver.
The card itself is just a regular IDE controller with a special BIOS.  The
CPU still does all the work, and you still have to deal with IDE bus
contention problems.

  For IDE hardware RAID, we have had good luck with 3Ware's Escalade series.
We have never tried anything beyond RAID-1 mirroring, though.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |
