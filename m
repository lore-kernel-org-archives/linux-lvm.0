Message-ID: <3DB0348D.42FFC0A4@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Fwd: LVM on ATA-Raid Working - but Poorly
References: <1034915787.3daf8fcb66a42@mail.dornquast.com>
		<3DAFB7D4.B88B6737@silicide.dk>
		<ufaelanvnav.fsf@epithumia.math.uh.edu>
		<3DB02DD6.B8B4B48E@silicide.dk> <ufa65vzviuo.fsf@epithumia.math.uh.edu>
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
Date: Fri Oct 18 11:20:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Jason L Tibbitts III wrote:
> 
> >>>>> "JB" == Jon Bendtsen <jon+lvm@silicide.dk> writes:
> 
> JB> JBOD ?
> 
> Just a Bunch of Disks.  I.e. no hardware RAID arrays; the OS sees
> eight independent disks.  Software RAID5 is significantly faster on a
> 6xxx-series 3ware card since the it was only designed to stripe and
> mirror.

True true, but then your boot device is software raid ??
And lilo ??



JonB
