From: will@firesites.com
Subject: re[2]: [linux-lvm] Max storage size per system
In-Reply-To: <20030307174127.SHWE2682.imf13bis.bellsouth.net@tiger2>
Message-ID: <Pine.LNX.4.44.0303071259040.22986-100000@mail.firesites.com>
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
Date: Fri Mar  7 12:09:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM Mailing list <linux-lvm@sistina.com>

Hello,

I'm not too familiar with the XPs.  I work mostly with HP's Virtual Array 
storage units (VA7400 and VA7410).  Those arrays have double parity for 
"raid5".  I quote raid5 because it's actually HP's proprietary AUTO-RAID 
which is a combination of raid1+0 and raid5.  For the data that actually 
sits in raid5 space, there is double parity.  Sort of like parity 
redundancy if I understand correctly.  This may be similar to what EMC 
does with parity RAID.  The disks are also hot swappable.  The way the 
VAs are suppose to work is that it keeps heavily hit data in a raid1+0 
space and not-so-hot data in the raid5 space.  It attempts to balance 
performance and redundancy.  As far as raid5 rebuild times on one of 
these units, I don't know.  Haven't had to do one yet.  But I expect it 
can't be too long (long meaning week or more) because not all the data is 
in raid5.

Best regards,
Will


On Fri, 7 Mar 2003, Greg Freemyer wrote:

> 
> >>  I prefer RAID 1 (or RAID 10), too, but sometimes one has to use RAID 5.
> >>  A common strategy is to put a higher number of hot spare drives in one
> >>  system. Another (somewhat newer) strategy is to use two rotating parity
> >>  drives per RAID set.
> 
> Can the XPs do that?
> 
> It would be really nice because one of the short comings of RAID 5 is the window of vulnerability during the rebuild time.
> 
> I have heard it can take as long as a week rebuild a large RAID 5 with heavy ongoing disk access.
> 
> (That might just be EMC propaganda, I have never seen it take that long).
> 
> EMC has what they call Parity Raid.  I don't understand it, but they claim it is faster and more robust than RAID 5.
> 
> Greg
> 
