Message-ID: <3B9F4B72.9050801@st-peter.stw.uni-erlangen.de>
Date: Wed, 12 Sep 2001 13:48:02 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM
References: <NBBBJHKIOKPKOGOEPEDPKEDNDNAA.stuart@bh90210.net>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

i should tell you about that
that was the problem that i had when i tried with /boot behind the first=20
1024cyl of the first disk
some people tells that the new lilo can handle this (it comes with MDK-8)
some people tells that probably a BIOS update should solve the problem
it didn't work for me

you can try to update lilo to the latest beta version and to update the BIOS
but with GRUB it works
the problem is that LILO can not read from /boot
my partitions
/dev/hda1 470Mb win-boot
extended
/dev/hda5   32Mb /boot
......

can you boot with a floppy and install grub?  it must work
IT3 Stuart B. Tener, USNR-R wrote:

>Svetjo:
>
>	/dev/hda1	w2k/pro
>	/dev/hda2	/boot
>	/dev/hda3	/
>
>	Something like the above?
>
>	Okay, I did that, and now I get "LI" when I booted up! What does "LI" in =
lilo mean? What part of my boot up sequence is broken?
>
>	Someone told me it meant my second stage boot loader was failing. What do=
es that mean? What are the stages of booting? Can anyone hook me up here?
>
>	As far as I know, I have ReiserFS compiled into the kernel along with LVM=
 support in the kernel.
>
>	I must admit ReiserFS has worked quite well for me, and is very bug-free.=
 I am using the version that comes with the 2.4.8-12mdk (mandrake) kernel, =
so perhaps u tried an older version.
>
>
>Very Respectfully,=20
>
>Stuart Blake Tener, IT3, USNR-R, N3GWG=20
>Beverly Hills, California
>VTU 1904G (Volunteer Training Unit)=20
>stuart@bh90210.net=20
>west coast: (310)-358-0202 P.O. Box 16043, Beverly Hills, CA 90209-2043=20
>east coast: (215)-338-6005 P.O. Box 45859, Philadelphia, PA 19149-5859=20
>
>Telecopier: (419)-715-6073 fax to email gateway via www.efax.com (it's fre=
e!)=20
>
>JOIN THE US NAVY RESERVE, SERVE YOUR COUNTRY, AND BENEFIT FROM IT ALL.=20
>
>Wednesday, September 12, 2001 3:43 AM
>
>-----Original Message-----
>From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On B=
ehalf Of svetljo
>Sent: Wednesday, September 12, 2001 2:59 AM
>To: linux-lvm@sistina.com
>Subject: Re: [linux-lvm] LVM
>
>Hi
>you need a normal partition vor /boot not on LV and it would be good to
>have also a normal partition as swap,
>but in case you don't use swap you don't need to,
>the thing is that the swap is much faster when it is on partition not file
>you can try to do it without formating the second disk
>you can shrink ReiserFS, then with diskdrake shrink the partition
> and make a new one for boot and for the VG , make an LV on the VG ,
>create filesystems on the LV and /boot, mount the LV /mnt/new-root ,
>mkdir /mnt/new-root/boot and mount here the /boot partition
>trasnfer your installation to /mnt/new-root:
>cd /
> find . -xdev | cpio -pm /mnt/new-root
>
>edit /mnt/new-root/etc/fstab to match the LV as / and ad an entry for /boot
>
>reboot
>and pass to lilo root=3D/dev/[your VG]/[your / LV]
>it should be working
>
>edit lilo.conf and reinstall lilo or grub ( i'm not shure that lilo can
>boot from the end of 32Gb drive)
>
>reboot once more if everything is OK
>you can make a PV from your old / and ad it to the VG
>that should be it
>
>about the FS's
>
>smth important ( may be) as far i know only Reiserfs could be shrinked ,
>you can only grow XFS and JFS you can not make them smaller
>
>i really like XFS,and not that much the others
>i had some crashes and with reiserfs i have some file entries which are
>reported to exist ,but they can not be stated when i try to delete them
>or to see them
>i have not much expiriance with JFS , but i'm hearing that it was not
>that stable as of 1.0.3
>and with XFS i found all lost files in " lost and find " and it was
>pretty easy to bring them back
>i mention only the journal ones becouse you are speaking about 32Gb
>
>
>
>
>
>
>
>IT3 Stuart B. Tener, USNR-R wrote:
>
>>LVM List members:
>>
>>      I have been doing some playing around and am not getting very far! =
Perhaps you can answer some questions and guide me.
>>
>>I have 2 32GB HDs, which I can have both in use on my laptop simultaneous=
ly. The 2nd HD I can erase to my hearts content. It's a staging drive.
>>
>>      My current configuration is:
>>
>>      /dev/hda1       windows 2000 pro
>>      /dev/hda2       /       (Linux mandrake 8.0)
>>
>>      I do not have a swap partition at the moment (I have 512MB of ram, =
and I use a swap file if I need too), and have everything installed into th=
e root (I know the drawbacks of this, but it made for simplicity at the tim=
e). I also use ReiserFS, and want to implement LVM.
>>
>>      The "How To" speaks of an example inclusive of a /boot partition an=
d a swap partition. I ignored the swap partition, but was curious about the=
 /boot partition in the how-to.
>>
>>a) Do I need to have a separate /boot partition, or can I create an LVM i=
mplementation (for the moment) with everything in the root (/)?
>>b) The example seems to show the /boot being outside the LVM area, is tha=
t correct or does the how-to mean to show the /boot as being within the dom=
ain of the LVM controlled area?
>>c) How will using ReiserFS on my root partition and LVM over the root aff=
ect what I need to do for an initrd and kernel compilation options?
>>
>>Once the LVM implementation is completed with everything in the / partiti=
on, and ReiserFS on the root, and it boots up, then I plan to break apart t=
he / into separate filesystems within the LVM environment. At that point, r=
ecommendations of what filesystems to create will be helpful.
>>
>>
>>Very Respectfully,
>>
>>Stuart Blake Tener, IT3, USNR-R, N3GWG
>>Beverly Hills, California
>>VTU 1904G (Volunteer Training Unit)
>>stuart@bh90210.net
>>west coast: (310)-358-0202 P.O. Box 16043, Beverly Hills, CA 90209-2043
>>east coast: (215)-338-6005 P.O. Box 45859, Philadelphia, PA 19149-5859
>>
>>Telecopier: (419)-715-6073 fax to email gateway via www.efax.com (it's fr=
ee!)
>>
>>JOIN THE US NAVY RESERVE, SERVE YOUR COUNTRY, AND BENEFIT FROM IT ALL.
>>
>>Wednesday, September 12, 2001 2:01 AM
>>
>>
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>=EF=BF=BD
>
