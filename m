From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] One VG or many?
Message-ID: <20020605221509.B21310@zealot.blacknet.de>
References: <F888C30C3021D411B9DA00B0D0209BE8038F9522@cvo-exchange.cvo.roguewave.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F888C30C3021D411B9DA00B0D0209BE8038F9522@cvo-exchange.cvo.roguewave.com>; from petersp@roguewave.com on Wed, Jun 05, 2002 at 12:33:23PM -0700
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
Date: Wed Jun  5 16:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

On Wed, Jun 05 '02 at 12:33, Poul Petersen wrote:
> 	Let me ask a slightly different question - what is the advantage to
> creating a VG for every logical business/application unit? Or perhaps, why
> would I not want to use a single VG? [ ... ] It would seem that a reasonable
> analogy would be that one VG is like one disk with partitions (LVs) for each
> business unit, whereas multiple VGs would be more like multiple disks. Both
> seem to have sufficient ideological separation?
while I can not decide this for you (I'm just bored waiting for my Mac
to stuff this W2k image it took me 7 hours to create. Why the ... must I
work on a Windows only project with only Macintosh hardware? <rant/>)
I'm running 3 big storage areas (different project ;-)) with 400GB,
300GB and 260GB (big for me at last). All are RAID5 and one PV/VG each. 
If I need to add additional storagge (as it will happen next week) I'll
just get another x00GB RAID5 and make it a new PV for the existing VG.
I than sliche it up using LVs ad needed.
As the RAID5 provides basic failiure savety the real savety comes from
.
.
.
Tape Backup.

So unless I (belie I might) hit a fix PV/VG/LV size area I'd just go for
one VG.
(Well actually all my systems have 2VGs each: one RAID1 for system/os
and another RAID5 for data. okok, some are small and have only one VG on
RAID1 or no RAID at all (my "real" workstation), or are a PowerBook G4
:-( )

Cu,
    Goetz.
