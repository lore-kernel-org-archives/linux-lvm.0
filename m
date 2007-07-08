Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l684k9Vb014811
	for <linux-lvm@redhat.com>; Sun, 8 Jul 2007 00:46:09 -0400
Received: from mail.futurelabusa.com (c-67-165-227-32.hsd1.co.comcast.net
	[67.165.227.32])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l684k7NK013651
	for <linux-lvm@redhat.com>; Sun, 8 Jul 2007 00:46:07 -0400
Received: from i0.futurelabusa.com (i0.fu-lab.com [192.168.0.101])
	by mail.futurelabusa.com (Postfix) with ESMTP id EA24477714
	for <linux-lvm@redhat.com>; Sat,  7 Jul 2007 22:46:05 -0600 (MDT)
Date: Sat, 07 Jul 2007 22:46:11 -0600
From: Jim Schatzman <james.schatzman@futurelabusa.com>
Subject: Re: [linux-lvm] Restore LVM after drive error
In-Reply-To: <20070707221535.17470@gmx.net>
References: <20070707134753.181690@gmx.net>
	<20070707191211.6FD8D77702@mail.futurelabusa.com>
	<20070707221535.17470@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Message-Id: <20070708044605.EA24477714@mail.futurelabusa.com>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

Mr F:

By no means am I an expert. My info is strictly empirical. However, I think=
 that putting in a new drive will not directly help. Pvmove wants to contin=
ue moving to the previous new drive.=20

Again, you said in one of your posts that LVM reported "Couldn't read all l=
ogical volumes for volume group system".  It seems to me that I have seen t=
his message when LVM cannot access one physical drive of the VG. I would ad=
vise you to figure out why this is happening. I believe that this means tha=
t one of your disks is not accessible. That is bad. Either you took the dri=
ve out or it has failed.=20

Assuming that this is the new/bad drive, then do the vgcfgbackup/vgcfgresto=
re thing while replacing the bad drive with a good one and adding the new d=
rive to the VG. Reboot. Then execute "pvmove". With luck, pvmove will resum=
e the move. However, I have doubts that it will work. Pvmove seems to be pr=
etty unforgiving.

If that doesn't work, then I think that you are reduced to using one of the=
 recovery methods.

Good luck.

Jim







At 04:15 PM 7/7/2007, you wrote:
>Hello
>
>thanks for your replay. I have noticed that in your case the "old" disk ha=
s faild, but in my case the new disk faild. That means that the disks of th=
e old LVM are all woring ! No bad Blocks or so. But SMART told me that one =
device will fail in future. So i put that bad disk in (i testet it befor - =
it showed no error).
>My first atempt to get everything back working was to remove the device, t=
hrow it out of my hw-array config and boot. Well,i think pvmode tries to ac=
cess this device , but it is no longer availible !
>I have another disk that is bigger than the drive that faild. Does pvmove =
worke again if i put that drive in its place and start pvmove again ? Perha=
ps i have to mark the partition on the disk as lvm bevore, but is there a c=
hance that pvmove just continues ? By the way how do i tell pvmove to conti=
nue ?
>
>F F=EF=BF=BDrster =20
>
>-------- Original-Nachricht --------
>Datum: Sat, 07 Jul 2007 13:12:16 -0600
>Von: Jim Schatzman <james.schatzman@futurelabusa.com>
>An: LVM general discussion and development <linux-lvm@redhat.com>
>Betreff: Re: [linux-lvm] Restore LVM after drive error
>
>> Another note:
>>=20
>> Re: Using dd to image a failing hard drive. Ryan Nelson in an earlier
>> posting explained how to get your VG back online:
>>=20
>> "vgcfgbackup, edit the backup, edit the ids in the logical_volumes
>> sections, check your work carefully, and vgcfgrestore?"
>>=20
>> This will allow you to substitute the new id for the old and LVM should
>> then be good to go. Presumably, you will have lost some data, so I would
>> recommend mounting the FS readonly and copying files elsewhere. If you d=
on't
>> care what may happen, you could mount RW, run fsck and repair the filesy=
stem.
>>=20
>> Jim
>>=20
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>--=20
>GMX FreeMail: 1 GB Postfach, 5 E-Mail-Adressen, 10 Free SMS.
>Alle Infos und kostenlose Anmeldung: http://www.gmx.net/de/go/freemail
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
