From: Olof Aldin <so@barbanet.com>
Message-ID: <20021230024410.GA32395@barbabok.barbanet.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Disc crash, want to recover some data... PLEASE HELP!
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
Date: Sun Dec 29 20:44:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I have 3 hard drives in a few PVs in one VG, and one of the hard drives
(IBM 75 GXP, 46GB) crashed today... It can't be read at all or even detected
by my BIOS. When I connect it to the IDE bus no discs on that interface are
found at all...

The broken disc contains about half of one LV. It's OK for me to loose the
data on this LV, but I would VERY much like to have the data on the other
LV's located on other hard drives.

Problem is that I can't remove the LV and PV from my VG if the VG is not
active and I can't activate the VG if not all discs with PV's in it are
online.

How do I remove the LV (I know that only one LV is on the broken disc) and 
then remove the PV from my VG without activating the VG?

Or, how do I activate the VG without all discs online?

I saw something about

vgchange -a y -q n /dev/vg

but that does not work with my 1.0.4 version vgchange, and not with the
1.0.6 that I downloaded and installed either...

I'm using GNU/Linux Debian Woody with 2.4.20-rc2 kernel and lvm 1.0.4.

I would be VERY happy if anyone gave me some advice! Hopefully as soon as
possible!

-- 
--------------------------------------
Olof Aldin <so@barbanet.com>
