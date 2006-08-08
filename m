In-Reply-To: <200608080050.42004.peregrine@openbrainstem.net>
Subject: Re: [linux-lvm] Running LVM on shared LUNs
Message-ID: <OF9274163B.2C1F5920-ONC12571C4.002C5A44-C12571C4.002D27E5@schering.de>
From: Christian.Rohrmeier@SCHERING.DE
Date: Tue, 8 Aug 2006 10:13:10 +0200
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux-lvm-bounces@redhat.com


Hi,

One way to take care of this would be to use clustering software such as
HP's MC Service Guard. I'm assuming you want to make an HA cluster of some
sort because you specified that both servers do not need to access the same
FS simultaneously (in which case you'd want to use VXFS or GFS).

Using Service Guard, the FS in question is part of a cluster package, and
it is mounted by the cluster package, and is thus not specified in the
fstab.The mounting or unmounting of the FS is taken care of when the
package switches from one server to another, thus bringing its FSes with
it. The SAN LUNs are seen on both sides ofcourse, and the LVM config is
copied to both sides as well, its just only active and mounted on one side
at a time. This works very well.

-Christian


linux-lvm-bounces@redhat.com wrote on 08.08.2006 08:50:36:

> On Monday 07 August 2006 03:59pm, Joshua Aune wrote:
> > I have two systems that are connected to a SAN.  The SAN is exporting
> > the same 4 luns to each system (/dev/sd[b,c,d,e]).  Under normal
> > operation system1 will combine sdb with sdc into a vg and system2 will
> > combine sdd with sde into a vg with both vgs consisting of one large lv
> > and one small lv.  After the system is configured there will be no
> > modifications made to the LVM configuration.  LVM is configured on one
> > node and then copied over to the second node.
> >
> > The million dollar question is, can system1 and system2 simultaneously
> > have both of the VGs active without hosing any data?
>
> As I understand it, only if you are using a filesystem that
supportsclustered
> operations, like GFS.
>
> > I am not trying to have the same filesystem mounted simultaneously,
just
> > have the LVs available simultaneously for failover needs
>
> In that case, as long as you have some heartbeat or something that lets
you
> know when the one system needs to take over the other's PVs.  The trick
here
> is that if you lose your network connection, but the box is still
accessing
> data on the LUNs, that could become problematic.  Maybe a tiny little
shared
> GFS thing would allow your boxes a place to write some status info (a
> custom "heartbeat", if you will) so that a network disconnect or other
issue
> won't cause false alarms.
>
> Probably best to just use GFS.
>
> > I know that this sort of config can be done with the GFS pool volume
> > manger but I have been told that many other VMs don't support this
> > behavior....
>
> /me shrugs
>
> Not sure about that as I don't have any SAN to play with :( .  Nevertried
it.
> --
> Lamont R. Peterson <peregrine@OpenBrainstem.net>
> Founder [ http://blog.OpenBrainstem.net/peregrine/ ]
> GPG Key fingerprint: 0E35 93C5 4249 49F0 EC7B  4DDD BE46 4732 6460 CCB5
>   ___                   ____            _           _
>  / _ \ _ __   ___ _ __ | __ ) _ __ __ _(_)_ __  ___| |_ ___ _ __ ___
> | | | | '_ \ / _ \ '_ \|  _ \| '__/ _` | | '_ \/ __| __/ _ \ '_ ` _ \
> | |_| | |_) |  __/ | | | |_) | | | (_| | | | | \__ \ ||  __/ | | | | |
>  \___/| .__/ \___|_| |_|____/|_|  \__,_|_|_| |_|___/\__\___|_| |_| |_|
>       |_|               Intelligent Open Source Software Engineering
>                               [ http://www.OpenBrainstem.net/ ]
> [attachment "att8h21q.dat" deleted by Christian
> Rohrmeier/BE/USR/SHG] _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
