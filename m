Return-Path: <kirth@hole.org>
Date: Tue, 13 Mar 2001 02:08:51 +0000
From: Kirth <kirth@hole.org>
Message-ID: <20010313020851.A16727@prodding>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Hardlock and volume loss ?
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

Hi,
	I've been playing with LVM for a few days, and finally decided to
risk 80gigs of data to it... bit of a mistake with hindsight. Earlier this
evening during an ftp transfer to the machine the box hardlocked. No errors
or anything, just completely dead to the world. On reboot I found i could
not access my LVM. After reading the postings, I had a poke and found that
while pvscan initally said it found the drives but didnt know which VG,
using vgcfgrestore i could fix that. The problem is if I try to make the PV
active, it "looses" this information and says 

milita:/etc/lvmconf# vgchange -ay
vgchange -- ERROR "Invalid argument" activating volume group "media"

	I've posted what I thought was relavent to
	http://black.hole.org/deadlvm.txt

	I'm pretty sure the data is intact, and I hope the lvm can be
put back together (hopefully so I can still resize/add to it)

	Any help would be apprecaited, oh and I'm running todays (12/13th
March 2001) cvs lvm programs.

Thanks in advance

Richard
