Return-Path: <jfrank@lxco.com>
Message-ID: <3A6447E4.7386B8BA@lxco.com>
Date: Tue, 16 Jan 2001 14:08:53 +0100
From: =?iso-8859-1?Q?J=FCrgen?= Frank <jfrank@lxco.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how can I init LVM on software RAID  ?
References: <3A5EE491.5E4FB886@lxco.com> <3A5F1C1A.5D9C8CE4@symbionsys.com> <3A5F1E6C.CD1D1A3E@lxco.com> <3A5F27F0.1090002@liberate.com> <3A63F53F.BA790549@lxco.com> <20010116092247.G717@66bassett.freeserve.co.uk>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Joe Thornber <joe@66bassett.freeserve.co.uk>, LVM <linux-lvm@sistina.com>

Yes, the init script is running before the LVM should start. The
Raid-System startup, too, but not correctly. (one of the mirror disk
failed)

> Joe Thornber wrote:
> =

> Hi,
> =

> Are the software raid init scripts being called before the LVM ones ?
> =

> - Joe
> =

> On Tue, Jan 16, 2001 at 08:16:15AM +0100, J=FCrgen Frank wrote:
> > Hi everyone, Hi Chris
> >
> > ok, I think I have a little solution for my problem with the LVM over=

> > SoftwareRaid. It's seems to
> > work with the new beta version (sorry I don't try the patch for the
> > 0.9).
> > So we have only one little problem, if we boot our system the raid1
> > (mirror)-system don't start correctly.
> > (on off the mirror disk isn't running). In that case the lvm don't st=
art
> > too !?
> >
> > But I think that's more a problem of the SoftwareRaid , possible it's=
 a
> > hardware failure of the disk or the disk have a very high startup tim=
e.
> > But I don't understand why lvm don't startup, normally this is a
> > transparenc fault , or ?
> >
> > byebye Juergen
> >
> >
> > >Chris Worley wrote:
> > >
> > > J=FCrgen,
> > >
> > > You are correct.  That is a very good question (and valid for this
> > > newsgroup).  I don't have an answer.  I've seen the documentation t=
hat
> > > says you can make raid 10 & 50 (etc...) by mixing MD's under PV's, =
as
> > > well as making VG's out of LVM's (but why?).  I've also seen errors=
 if
> > > I haven't set my PV's partition to 8e... and there's no way to fdis=
k
> > > an MD (to set the partition type).  I would worry about the
> > > performance of two layers of software overhead below the file syste=
m.
> > >
> > > I had barely crawled out of bed when I saw your post and thought "I=

> > > can help a newbie".  This is not a trivial question, I was wrong ;)=

> > >
> > > Chris
> > >
> > > J=FCrgen Frank wrote:
> > >
> > > > Chris Worley wrote:
> > > >
> > > >> J=FCrgen,
> > > >>
> > > >> "md" and "lvm" are two different ways of making a software raid.=

> > > >>
> > > >> lvm only does raid0.  The main purpose of LVM is to allow you to=
 manage
> > > >> disks underneath the file system... adding and removing disks
> > > >> dynamically.
> > > >>
> > > >
> > > >
> > > > Jep, that's the point why I want to use this two systems. So I wa=
nt to
> > > > create a RAID 1 / 5 system and on the top I put the LVM. With thi=
s
> > > > method I have a good system with snapshot and enlargment feature =
!!!
> > > > And if I read all the docu (the howto, the pdf from sistina) lvm =
works
> > > > fine with the md - drives. But, that is the point which I can't f=
ollow
> > > > in the moment. Because I can't make partitions on a md drive and =
LVM
> > > > need this partitions ...
> > > >
> > > >
> > > >
> > > >
> > > >> There should be HOWTO's for md in your /usr/doc area.  The LVM n=
ewsgroup
> > > >> is not a good place to ask MD related questions.  There are a fe=
w
> > > >> "howto's" for LVM:
> > > >>
> > > >> http://www.sistina.com/lvm/Pages/howto.html
> > > >>
> > > >> I like:
> > > >>
> > > >> http://www.ds9a.nl/lvm-howto/HOWTO//cvs/lvm-howto/lvm-howto.html=

> > > >>
> > > >> Chris
> > > >>
> > > >
> > > >
> > > > I read all this docu, but I can't find any help for a system LVM =
over
> > > > MD-Drives (Software RAID) !!!
> > > >
> > > >
> > > > Juergen
> > > >
> > > >
> > > >> J=FCrgen Frank wrote:
> > > >>
> > > >>> Hi !!
> > > >>>
> > > >>> I want to create the following system :
> > > >>>
> > > >>> I use the new kernel (2.4) and I want to use the software raid =
and the
> > > >>> lvm,
> > > >>> but my problem is... how ?
> > > >>>
> > > >>> I can't find a step by step documentation and all what I try do=
n't work.
> > > >>>
> > > >>> So what did I done :
> > > >>>
> > > >>> * create a mirror system with software raid (last version), aft=
er this
> > > >>>   step I have a good raid system with the drive /dev/md0
> > > >>>
> > > >>> * normally now I need to create a partition on the drive , but =
I read in
> > > >>> the raid docu that the md-drives don't support partitions !!!
> > > >>>
> > > >>> But, without a partiton of the type 0x8e I can't run vgscan and=

> > > >>> pvcreate...
> > > >>>
> > > >>> So, can anyone help me ?!
> > > >>>
> > > >>> Juergen
> > > >>>
> > > >>> (sorry for the bad english)
> > > >>> _______________________________________________
> > > >>> linux-lvm mailing list
> > > >>> linux-lvm@sistina.com
> > > >>> http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > >>
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> >
