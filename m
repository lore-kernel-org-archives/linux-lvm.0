From: John Marquart <jomarqua@vaixcon.net>
Message-ID: <Pine.LNX.4.33.0111080415060.13338-100000@vaixcon.net>
MIME-Version: 1.0
Subject: [linux-lvm] DOH! NT's fixboot killed PV
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
Date: Thu Nov  8 03:21:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,
	Through my own carelessness  - my helper ended up running w2k's
fixboot program on my rootvg's primary PV.  It wrote FAT info of some sort
to the header area of my /dev/hda1 partition.

I am (desperately) hoping that there is some way to recover this header
info. (And that ppl on this list can aide me.)

I thought perhaps the way to go about it was to do a vgcfgrestore ..
however I had no luck - when i ran it w/ the -l / -l -l flags - it would
show me the correct info - but if i ran it w/out the -l flags - then it
would give me the following error:

ERROR "pv_read(): PV identifier invalid" reading physical volumes

I get the same error if I try to do pvscan.

pvdata shows that things are FUBAR - w/ a UUID of something like "0
NAME-     -FAT1-2   - <GARBAGE>" - but I know the proper identifier is in
the cfg backup file - since it can be displayed and is
"Nku12O-iI1H-Ee4v-Lpa0-SxtF-31z)-xZs7sr"


If anyone could provide tips / directions on how to go about fixing this
problem - I would be very greatful - I just finally got the system
built/installed to my satisfaction and would hate to start over.

tia,
-john marquart



ps.  Bill & Ted rule!
