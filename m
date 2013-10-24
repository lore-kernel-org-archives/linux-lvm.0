Message-ID: <5268C074.5060007@redhat.com>
Date: Thu, 24 Oct 2013 08:38:44 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <CAH5g025Z+f2C_t1vvqbsCU43VzTY-NvCRg9A+GYF8cLh2+46gw@mail.gmail.com>
In-Reply-To: <CAH5g025Z+f2C_t1vvqbsCU43VzTY-NvCRg9A+GYF8cLh2+46gw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Destroyed partition on one PV (followup)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 10/05/2013 06:06 AM, Ken Bass wrote:
> I did a little more investigating that might somewhat change the solution.
>
> What caused the corruption was a fedora installation that was supposed to
> be on a different drive, but the dynamic labelling of devs screwed me.
>
> What I had to begin with was an lv of 3 devs: sdb1, sdc1, and sdd1. The
> installer re-partitioned sdb into 5 separate partitions (a boot, swap, and
> 3 ext4), and then began to format them. I stopped the format before it got
> to far along. The other devs are untouched.
>
> I can run the pvcreate command (I tried with the -t flag) to restore the pv
> on 2 of the ext4 partitions, as well as on the swap partition (pvcreate
> asks to wipe the swap signature). So, if I did, how would I recombine those
> separate partitions back to one?

You do not want new PVs. You need to to restore the one with original 
UUID (which is unique identifier and is used to group disks in a VG.)

So first you need to create single large partition on the affected disk 
(fdisk/parted/...), then restore PV.

>
> I know that a lot of the data is still there and somewhat intact - I did a
> hexdump of each.
>
> Any ideas?

You should use pvcreate with --uuid and --restorefile if you are able to 
get to recent metadata backup. Is not this a partition where your /etc sits?

In the worst case I would try to dd the few X kBs from sane partition to 
the one affected and hex-edit the start to match PV's UUID.
But there may be better ways (like booting from LiveCD, activating VG 
and dumping metadata.)

I also opened a bug for Anaconda:

   https://bugzilla.redhat.com/show_bug.cgi?id=1022811

Hopefully that will not repeat.

And remember: when you experiment always experiment with backups at your 
pockets.

-- Marian

>
> As always, TIA.
>
> ken
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
