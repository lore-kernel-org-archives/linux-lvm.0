Message-ID: <3D1A7FC0.2090006@birddog.com>
From: "Kirby C. Bohling" <kbohling@birddog.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] why do striping and mirroring in LVM?
References: <OF3B31F066.8A4165E6-ON48256BE5.000AAA65@legend.com.cn>
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
Date: Wed Jun 26 22:06:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1254"
To: linux-lvm@sistina.com

Try mucking about with a mirror that has LVM on top of it, and you don't
have enough disk space to do the shuffle.  You can't re-configure any of
the sizes of the mirror when you can't get all the data off the mirror.
 You can't reconfigure the striping without getting all of the data off.
 If the LVM and RAID know about each other, then you can reconfigure
stripes and mirrors without removing all of the devices off of LVM.  You
can do all that, and never take anything offline even.  It's my
understanding that with the HP/UX LVM software you can reconfigure all
of that, and it will work, and it should be consistant across
crashes/reboots and just work.  Having the two know about each other
means you can reconfigure both of them efficently.  Plus it gets rid of
the of the FAQ, why doesn't LVM do mirroring.  I find it very ironic
that now somebody asks why bother supporting mirroring inside of LVM.

	Kirby


lilha@legend.com.cn wrote:
>=20
> i know that lvm support striping now and LVM2 will support mirroring
> directly later this year.
> but i'm puzzled that why lvm do that?
>=20
> i think the main Goals of LVM are
>      1.Implement a very flexible virtual disk subsystem to handle disk
> storage.
>      2.Online allocation and relocation of storage.
>      3.Online extension and reduction of storage.
> And disk redundancy is the goals of  hardware. or software.RAID.
>=20
> i think software.RAID+LVM is good idea,and that's enough.
> why LVM focus on the striping and mirroring?
> i don't think it's a good idea to do a big and full software.
>=20
> there are any reasons and advantages to use striping or mirroring LVM t=
han
> software.RAID+LVM ?
>=20
> i think the reason is LVM it does not matter where the disks are at all.
> We can do the same with two big external storage towers, not just with =
two
> disks.
>=20
> but i think this reason is not enough, can anyone give me some support?
> and how many people use striping or mirroring LVM=A3=ACnot software.RAI=
D+LVM=A3=BF
>=20
>=20
> TIA for your help and sorry for my poor English.
>=20
> Echo=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=
=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=
=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=81=7F=E5=8A{=
=B1=FE[=E6=99=A8=A5=8Ax%=8A=CBe=8A{=B1=FE[=E6=FE=C8=AC=81=7F)=DA=FD=81=7F=
&=86=DBi=81=7F=81=7F=E5=8A=CBl=FE=C8=AC=B6)=DA=FD=81=7F&?=A2=96f?X=AC=B6)=
=DF=A3=F9b=9E=EC=81=7F=96=F9=ABy=A7m=85=E2=81=7F=81=7F=1Bm=81=7F=81=7F=81=
=7F=81=7F=0C=81=7F=81=7F+-=8Av=81=7Fr=89=BF=96=F9=81=7F=3D=81=7F=1E=B3=F8=
h=C2=DA=81=7F=86=D9=81=7F
