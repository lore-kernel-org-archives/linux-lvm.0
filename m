Message-ID: <3DB264D3.A994B237@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Fwd: LVM on ATA-Raid Working - but Poorly
References: <1034915787.3daf8fcb66a42@mail.dornquast.com>
		<3DAFB7D4.B88B6737@silicide.dk>
		<ufaelanvnav.fsf@epithumia.math.uh.edu>
		<3DB02DD6.B8B4B48E@silicide.dk>
		<ufa65vzviuo.fsf@epithumia.math.uh.edu>
		<3DB0348D.42FFC0A4@silicide.dk> <ufawuoftw8h.fsf@epithumia.math.uh.edu>
Content-Transfer-Encoding: 7bit
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
Date: Sun Oct 20 03:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Jason L Tibbitts III wrote:
> 
> >>>>> "JB" == Jon Bendtsen <jon+lvm@silicide.dk> writes:
> 
> JB> True true, but then your boot device is software raid ??
> 
> Yes, but not on LVM.  /boot and / were mirrored (all eight ways, which
> I know is overkill).
> 
> JB> And lilo ??
> 
> It didn't have any problem; it wrote identical boot blocks to all
> eight disks, and would boot with the first disk in the system
> disconnected.  This was the first such server I built and I did it
> some time ago so I haven't tried with anything more modern like Grub.

Well, grub doesnt matter i use lilo myself.
How did you get lilo to write it to all 8 bootblocks ?



JonB
