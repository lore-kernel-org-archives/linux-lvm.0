Return-Path: <dlt@dataventures.com>
Message-ID: <3AB59501.FF6ED9F3@dataventures.com>
Date: Sun, 18 Mar 2001 22:11:29 -0700
From: Donald Thompson <dlt@dataventures.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Apparent performance degradation for each PV with striping
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
To: linux-lvm@sistina.com

I started playing with iostat tonight and saw a few things I didn't
really expect to see.

I've got a volume group consisting of 4 82 gig drives. All 4 are IDE
drives.
Reading directly from the raw device, a PV in this case, with something
like

dd if=/dev/ide/host0/bus0/target0/lun0/disc of=/dev/null

gave me around 5500 blocks read per second.
Reading from a unstriped LV on a single PV gives me around
4500 blocks read per second, which I felt was reasonable. When I create
a LV striped across all four, my blocks read per second drops to around
1100
per hard drive, giving me a total of about 4400 reads per second for
that LV.
2200 reads per second if I striped it across 2 PV's. Timing how long it
took
to finish a dd for the different types of LV's I made pretty much
confirmed what
iostat was saying. It always took me 45 seconds, give or take a second,
to
read a 100 megabyte LV. So it appears striping is useless for me,
atleast with this
hardware setup.

I notice during the dd operation that my system CPU state is 90% or
more.
So I think I just answered my own question, I'm CPU bound. Moving on,
is there any known ways to improve my performance off each PV with this
type of
hardware setup? I usually create an LV with...

lvcreate -i4 -I4 -L somesize vgname -n lvname

Should I expect that I won't see the performance drop on individual PV's
with striping
on SCSI drives? I originally setup this system with no intentions of it
being a high performance
file server, until a few people I work with decided they wanted to use
it for a database machine.
So I'm not afraid to spend a couple grand to get some faster disks in it
if thats the only thing
thats gonna help me.

My system:

Linux 2.4.2
Libc 2.1.3
Debian Potato
LVM 0.9.1_beta6 utilities and patch.
ATA 100 IDE interfaces on MB
idebus set to 66 in /etc/lilo.conf
CPU is Athlon 1000mhz thunderbird
256 megs of RAM

-Don
