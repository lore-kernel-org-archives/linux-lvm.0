From: Daniel Zeiss <daniel@kellnerweg.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] undocumented strange LVM behaviour
References: <E18GYnN-0005nz-00@mail.kellnerweg.de> <E18H7Ca-0006IL-00@mail.kellnerweg.de> <20021127230241.A3406@sistina.com>
In-Reply-To: <E18GYnN-0005nz-00@mail.kellnerweg.de>
Content-Transfer-Encoding: 7bit
Message-Id: <E18HHhm-0004FO-00@mail.kellnerweg.de>
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
Date: Wed Nov 27 23:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hello,

thank you Heinz for responing.

I booted my machine and tried

cat /proc/partitions

and it shows:

major minor  #blocks  name

   34     0   78177792 ide/host2/bus1/target0/lun0/disc
   34     1    1536160 ide/host2/bus1/target0/lun0/part1
   34     2   76641264 ide/host2/bus1/target0/lun0/part2
   33     0   78177792 ide/host2/bus0/target0/lun0/disc
   33     1      51376 ide/host2/bus0/target0/lun0/part1
   33     2    1536192 ide/host2/bus0/target0/lun0/part2
   33     3    9216144 ide/host2/bus0/target0/lun0/part3
   33     4   67373712 ide/host2/bus0/target0/lun0/part4
    3    64     197858 hdb

In my opionion the strange thing is, that after only a reboot everything 
stoped working, right?

bye

Daniel

Heinz J . Mauelshagen wrote:

> On Wed, Nov 27, 2002 at 07:43:46PM +0100, Daniel Zeiss wrote:
>
> >vgcfgrestore be an option to restore my lvm?
>
>
> No, this looks like a strange /proc/partitions problem (LVM tries to 
> retrieve
> device pathes from there and obviously fails on that).
>
> Does "cat /proc/partitions" show any strangenesses ?
>
> Regards,
> Heinz    -- The LVM Guy --
>
>
> >
> >Daniel Zeiss wrote:
> >
> > > Hello,
> > >
> > > my lvm (2 partitions on 2 discs /dev/hde4 /devhdg2) on a Debian Woody
> > > Linux (2.4.18-686) shows some strange behaviour:
> > >
> > > After rebooting my computer, vgscan found an inactive "vg01" to be my
> > > volume group but vgchange -a y said:
> > >
> > > vgchange -- ERROR: can't get name(s) of physical volumes
> > > vgchange -- Please check, if /proc is mounted
> > >
> > > my /proc is mounted and in /proc/lvm /global is says:
> > >
> > > Total:  0 VGs   0 PVs   0 LVs  (LVs open)
> > > Global: 152 bytes malloced  IOP version 10   0:05:06 active
> > >
> > > I do _not_ use devfs, /dev is complete and working.
> > >
> > > My lvm are just my home dirs, so uncomming them in /etc/fstabs and
> > > rebooting brings my system up with kde now problem and root can log in
> > > and work (which it shouldnt do with kde, just testing).
> > >
> > > My / is on /dev/hde3, so it isnt a disc failure.
> > >
> > > the output of
> > >
> > > vgchange -a y -d
> > >
> > > is attached.
> > >
> > > What can I do to get my LVM up running _without_ dataloss?
