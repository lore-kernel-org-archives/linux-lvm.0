Subject: Re: [linux-lvm] Fwd: LVM on ATA-Raid Working - but Poorly
References: <1034915787.3daf8fcb66a42@mail.dornquast.com>
	<3DAFB7D4.B88B6737@silicide.dk>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
In-Reply-To: Jon Bendtsen's message of "Fri, 18 Oct 2002 09:27:16 +0200"
Message-ID: <ufaelanvnav.fsf@epithumia.math.uh.edu>
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
Date: Fri Oct 18 09:23:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "JB" == Jon Bendtsen <jon+lvm@silicide.dk> writes:

JB> Unfortunately i forgot to test it with lvm ontop :/

It works fine:

Total:  1 VG  1 PV  18 LVs (18 LVs open 18 times)
 
Global: 1088155 bytes malloced   IOP version: 10   178 days 23:22:40 active
 
VG:  nas  [1 PV, 18 LV/18 open]  PE Size: 16384 KB
  Usage [KB/PE]: 1101643776 /67239 total  1101643776 /67239 used  0 /0 free
  PV:  [AA] sda9                  1101643776 /67239   1101643776 /67239          0 /0

This is a 1TB array on a 3w7850 (now called a 7500-8) card with 8
Maxtor 160GB disks.  I've made volumes up over 500GB on these, have
resized volumes and filesystems, deleted volumes, etc. all with the
machines live and have experienced absolutely no problems.  This
machine is running (approximately) one of the Red Hat 7.3 beta
releases.

I also have LVM on top of software RAID5 on top of an old 3w6800 card
running in JBOD mode with 8 75GB IBM deathstars.  It works fine when
the disks are actually working (which is rarely).

 - J<
