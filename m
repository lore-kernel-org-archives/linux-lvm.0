From: Andre Bonhote <andre@bonhote.com>
Message-ID: <20030110073438.GA31870@coffee.noc.ch.colt.net>
References: <EHEDIKGDCNFCNANFPGCDAENOCAAA.andre@bonhote.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <EHEDIKGDCNFCNANFPGCDAENOCAAA.andre@bonhote.com>
Subject: [linux-lvm] Re: LVM Recovery - mostly solved
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
Date: Fri Jan 10 01:35:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-LVM@Sistina.com
Cc: mauelshagen@Sistina.com, beat@rubis.ch

Good morning!

Well, this is quite embarassing to me. Bear with me please.

On Wed, Jan 08, 2003 at 03:35:35PM +0100, Andre Bonhote wrote:
=20
...
>  - 1 IDE drive, 80 GB

...=20
> /dev/hdc
>  fdisk -l shows no output. There's no partitioning. I did pvcreate /dev/h=
dc.

Here we go! That's the point. fdisk -l shows no output because there's
no disk. Between the (doubtless incredibly dumb, but harmless) changes
and the reboot, I have tried to find a place for a spare harddrive in my
chassis. Doing that, the one and only IDE cable loosened. Result:
/dev/hdc was gone.

My focus at that time was of course elsewhere. I always have disabled
IDE scanning in the BIOS, otherwise I would have noticed it immediately
- the system hangs in the BIOS. Linux just says: There's no IDE drive.
And Linux is right.

>  mount: error 2 mounting ext3
>  pivotroot: pivot_root(/sysroot,/sysroot/initrd) failed: 2
>  umount /initrd/proc failed: 2

This comes clear to me now, too. I have to change Grub and/or the
initrd, I guess. I will take a closer look at this this WE.
=20
> no (which?) config files have been updated. Could this be a bug?=20

Of course NOT!

> ...
> reading data of volume group "CaradhrasVG" from physical volume(s)
> ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume
> group "CaradhrasVG" from physical volumes
> ...

It was trying to read /dev/hdc, but it didn't succeed. How should it?

Well, anyway. I managed to pull down the important data.

List readers/posters: A double sorry to you for wasting your precious
bandwith and for holding you up. I am going to read ALL the docs I can
find on sistina.com about backing up metadata, I promise. And I will
think more than twice next time before posting to this list, and have a
loooong nap before, too.

Thanks to all & a really nice day!

Andr=EF=BF=BD
=20
--=20
Real programmers do "cp /dev/audio a.out" and whistle into the mike.
                                                (Randal L. Schwartz)
