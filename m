From: "Erick Calder" <e@arix.com>
Subject: RE: [linux-lvm] read_intr errors
Message-ID: <011101c15ded$a59767c0$0300000a@pacbell.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011024101331.A2271@tykepenguin.com>
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
Date: Fri Oct 26 02:13:04 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Patrick,

looking over the man page on lvreduce it states:

> lvreduce allows you to reduce the size of a  logical  volume.
> Be  careful  when reducing a logical volume's size,
> because data in the reduced part is lost!!!

the above warning is not conclusive as to whether data loss occurs only when
the LV is full i.e. it has no choice but to lose data, of if data loss may
occur regardless i.e. there's no smarts in lvreduce to move data around...

can you clarify this point and perhaps reword the above for a next release
of that man page?

anyhow, I understand what you're suggesting... however it's not clear to me
what "a little" means... would 1K do? 1M?

here's what I've got:

# lvdisplay /dev/LVM/mp3z
--- Logical volume ---
LV Name                /dev/LVM/mp3z
VG Name                LVM
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                28.62 GB
Current LE             7327
Allocated LE           7327
Allocation             next free
Read ahead sectors     120
Block device           58:0

# pvdisplay /dev/hdc
--- Physical volume ---
PV Name               /dev/hdc
VG Name               LVM
PV Size               28.63 GB / NOT usable 6.69 MB [LVM: 152.00 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              7327
Free PE               0
Allocated PE          7327
PV UUID               vY9apM-RXf6-DtiS-m4LI-u7qT-iNjm-9SYnMz

with the above, would I do:

# lvreduce -l -1 /dev/LVM/mp3z

to test this theory?

1k thx - e

-----Original Message-----
From:	linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] On
Behalf Of Patrick Caulfield
Sent:	Wednesday, October 24, 2001 2:14 AM
To:	linux-lvm@sistina.com
Subject:	Re: [linux-lvm] read_intr errors

On Tue, Oct 23, 2001 at 09:18:44PM -0700, Erick Calder wrote:
> Patrick,
>
> sorry for the delay, it takes 12 hours to back up this guy and another 12
to
> verify... and I had problems so I had to do it several times.
>
> so if I get you correctly, I should be able to do badblock check (instead
of
> a mke2fs with -c option as has been suggested) and get an evaluation for
> whether this drive has problems equally well, no?
>
> here's what I did:
>
> # df -k
> Filesystem           1k-blocks      Used Available Use% Mounted on
> /dev/hda1             38456308   2670876  33831932   8% /
> /dev/LVM/mp3z         29540436  13308716  14731152  48% /var/mp3z
>
> # umount /dev/LVM/mp3z
> # vgchange -a n
> vgchange -- volume group "LVM" successfully deactivated
>
> root@beowulf:/root # badblocks -s /dev/hdc 29540436
> Checking for bad blocks (read-only test): done

Well that looks OK

> as you can see, no errors.  Now, having said that, I've come to realise
that
> the errors I get happen when accessing my tape drive (which is scsi) - at
> least I think that's what's happening... weird.  do you then think this is
> related to the problems others have had? and if so, was there a fix?

The thread about SCSI errors just stopped so I don't know what happened
there.
There was some thought that maybe LVM was trying to access beyond the end of
the
disk so you could check to see if the LV is using all the space on /dev/hdc
and
back it off a little so see if that helps. It may also be worth upgrading to
LVM 1.0.1rc4.

If it is the SCSI tape drive interfering then that's really odd because SCSI
shouldnot interfere with IDE unles you have some interrupt clashes or
perhaps
bad cabling causing signal noise.

Not very conclusive I'm afraid, but I did say I wasn't an IDE expert!

patrick


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
