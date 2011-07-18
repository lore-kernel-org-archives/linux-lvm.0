Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p6I2ck01009704
	for <linux-lvm@redhat.com>; Sun, 17 Jul 2011 22:38:46 -0400
Received: from Ishtar.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6I2cjnb023807
	for <linux-lvm@redhat.com>; Sun, 17 Jul 2011 22:38:45 -0400
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p6I2cZJe006495
	for <linux-lvm@redhat.com>; Sun, 17 Jul 2011 19:38:37 -0700
Message-ID: <4E239CA9.40702@tlinx.org>
Date: Sun, 17 Jul 2011 19:38:33 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4E1A526F.9090700@tlinx.org>	<20110711025811.GF7857@agk-dp.fab.redhat.com>
	<4E1D77A7.4030801@tlinx.org>
In-Reply-To: <4E1D77A7.4030801@tlinx.org>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Inconsistent naming needs to be fixed (was Re:
	Inconsistent naming...?)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Linda A. Walsh wrote:

 > Alasdair G Kergon wrote:
 >> On Sun, Jul 10, 2011 at 06:31:27PM -0700, Linda A. Walsh wrote:
 >>> Notice the device name.   notice how the single dashes are now
 >>> displayed as two dashes?!?! 
 >> Roughly: a dash is the separator we chose, and we double it to escape a
 >> real dash.  But we still need to extend our escaping mechanism to handle
 >> characters that udev states it doesn't support in primary device names
 >> but which the old /dev did used to support (and so we still do).
 >
 >    Roughly, if I give a script the mount point of a logical device, how
 >    can I find out the name of the LV it is on?

   Ok, I think I bass-ackwards way of hacking around this -- but my
   solution is unique to my usage and conventions.

   In my 'application' (meaning 'usage'), I start with a mount-point
of a volume I want to take a snapshot of. I want to map that mount
point back to the original dev.  It's not straightforward when the
device in /proc/mounts, isn't the real device NOR is it the name I
used!   I.e. real dev = /dev/dm-[0-x], name i used /dev/VG/LV.
What /proc/mounts shows:  /mapper/dev/<mangled VG>-<mangled LV>.

   So who's responsible for that mess of code so we can get /proc to
either, show the value I used (when I mount by LABEL I see the 'real'
devices in mounts -- not /dev/disk-by-label/<label>.   It isn't consistent
but it's worse, as it choose a name that's gone through some
'translation'...


   Am I being more clear about why this create problems (besides
being confusing and just looking bad (because my computer has
to come up with it's own name for a dev -- neither the one
I used nor the real name? 

   Now, I can kludge around this, by knowing some different pieces
of information unique to my app/situation, but in the general case,
it would be unpredictable, and that's bad, as I'd like to release these
scripts if I can get them working to my satisfaction.

    Can the situation with /proc/mounts be fixed?
