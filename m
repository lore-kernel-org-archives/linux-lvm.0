From: Toby Dickenson <tdickenson@geminidataloggers.com>
Subject: Re: [linux-lvm] raid1+lvm without initrd
References: <BDEMIPDEGABMNEFIHCPDGENPDPAA.bill+f.9sfuw6uo@tao-group.com>
In-Reply-To: <BDEMIPDEGABMNEFIHCPDGENPDPAA.bill+f.9sfuw6uo@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200209231117.46026.tdickenson@geminidataloggers.com>
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
Date: Mon Sep 23 05:17:44 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, William Blunn <bill+f.9sfuw6uo@tao-group.com>

On Monday 23 Sep 2002 10:49 am, William Blunn wrote:
> > A few of the regulars on this list seem to have a setup like this
> > working.
> >
> > I have 2 disks mirrored with linux software raid-1. on top of this I =
have
> > created 3 lv's: root, var, and swap. So far I have not been able to
> > figure out the boot=3D,root=3D parameters that'll coax lilo into boot=
ing
> > this.
> >
> > A few of the regulars on this list seem to have something like this
> > working. Would someone post a working lilo configuration for a raid1+=
lvm
> > noninitrd setup?
> >
> > references to setups like this working:
> > http://lists.sistina.com/pipermail/linux-lvm/2002-September/012245.ht=
ml
> > http://lists.sistina.com/pipermail/lvm-devel/2001-October/000686.html
>
> People often ask me questions to which my answer begins "One or more of
> the premises on which your question is based is false, therefore your
> question does not make any sense. Peeling back a layer and looking at
> what you are really trying to achieve, you might find that your best
> solution would be this: ... ".
>
> Don't put your root filesystem in an LVM.
>
> The small benefit of having it resizable is far outweighed by the setup
> cost and the maintenance difficulties you will get when things go wrong=
=2E
>
> Anything which is big and which might cause you to want to have a bigge=
r
> root filesystem shouldn't be in there, and should be in one of your
> other filesystems instead.
>
> If you don't have a suitable filesystem for the new big thing, you can
> just create one --- you have an LVM!

Those are all good reason for always having one root filesystem that is n=
ot in=20
LVM. If you have more than one root filesystem then I dont see a problem =
with=20
putting it in LVM. Im not sure if this applies to the orginal poster, but=
 I=20
do think his question is still valid.
