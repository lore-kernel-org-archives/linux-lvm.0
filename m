From: arjen@t-rex.pinguins.dyndns.org
Message-Id: <200303290049.h2T0nh6m009903@t-rex.pinguins.dyndns.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vg_read_with_pv_and_lv problem
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
Date: Fri Mar 28 18:51:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all,

I upgraded from RH 7.3 to 8.0 and now one of my two lvm vg's is
missing ... :-(

I've seen simular problems on this mailing list but didn't encounter
an answer. The upgrade was from kernel 2.4.18 to 2.4.18-14
using lvm version 1.0.1rc4 to 1.0.3.

The error is:

vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data
of volume group "vg2" from physical volume(s).

pvscan results in:

pvscan -- inactive PV "/dev/hdc14" is associated to unknown VG "vg2" (run vgscan)
for all partitions involved.

What is curious is that in the function: pv_read_all_pv_of_vg.c
it seems to find vg2, but finds to uuids in the available list
(whatever that may mean) which effectively puts two NULL values
in the pv_this.  One of those is cleaned up in a loop which seems
to be intended for cleaning them all (but I am not sure as the code
effectively only cleans up the first NULL value), but the np count
later-on results in only one found pv.  This probably fails
as the pv_cur has a much higher value later on.  Making the loop
clean up all the NULL values still leaves me 2 pv's short as
the number is now 9 and the pv_cur is 11. So it seems that
no match should have been found in the uuid list.

Any ideas, help, miracles are most welcome.

Cheers

    Arjen (arjen@pinguins.dyndns.org)
