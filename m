From: Daniel Zeiss <daniel@kellnerweg.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] undocumented strange LVM behaviour
References: <E18GYnN-0005nz-00@mail.kellnerweg.de>
Content-Transfer-Encoding: 7bit
Message-Id: <E18H7Ca-0006IL-00@mail.kellnerweg.de>
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
Date: Wed Nov 27 12:46:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

vgcfgrestore be an option to restore my lvm?


Daniel Zeiss wrote:

 > Hello,
 >
 > my lvm (2 partitions on 2 discs /dev/hde4 /devhdg2) on a Debian Woody
 > Linux (2.4.18-686) shows some strange behaviour:
 >
 > After rebooting my computer, vgscan found an inactive "vg01" to be my
 > volume group but vgchange -a y said:
 >
 > vgchange -- ERROR: can't get name(s) of physical volumes
 > vgchange -- Please check, if /proc is mounted
 >
 > my /proc is mounted and in /proc/lvm /global is says:
 >
 > Total:  0 VGs   0 PVs   0 LVs  (LVs open)
 > Global: 152 bytes malloced  IOP version 10   0:05:06 active
 >
 > I do _not_ use devfs, /dev is complete and working.
 >
 > My lvm are just my home dirs, so uncomming them in /etc/fstabs and
 > rebooting brings my system up with kde now problem and root can log in
 > and work (which it shouldnt do with kde, just testing).
 >
 > My / is on /dev/hde3, so it isnt a disc failure.
 >
 > the output of
 >
 > vgchange -a y -d
 >
 > is attached.
 >
 > What can I do to get my LVM up running _without_ dataloss?
 >
 > Thank you
 >
 > Daniel
 >
 >
