Message-ID: <B51F0C636E578A4E832D3958690CD73E0130BFEF@es04snlnt>
From: "Diehl, Jeffrey" <jdiehl@sandia.gov>
Date: Tue, 28 Aug 2001 10:40:36 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Newly extended VG reporting errors.
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hi all,

I just extended one of my VG's by adding 3 new PV's.  Now, when I do a
vgscan, I get errors.  I would rather not have to reboot this machine if
there is something else I can do.

The error message is:

vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "Database2" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
"/etc/lvmtab" and "/etc/lvmtab.d"

What do these messages mean?  And how do I make them go away so I can resize
my filesystem?

Thanx,
Mike Diehl,
Network Monitoring Tool Devl.
Sandia National Laboratories.
(505) 284-3137
jdiehl@sandia.gov
