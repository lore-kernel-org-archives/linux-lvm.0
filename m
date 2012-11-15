Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qAF99fJn028301
	for <linux-lvm@redhat.com>; Thu, 15 Nov 2012 04:09:41 -0500
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qAF99dkd022456
	for <linux-lvm@redhat.com>; Thu, 15 Nov 2012 04:09:40 -0500
Received: by mail-ee0-f46.google.com with SMTP id b15so944614eek.33
	for <linux-lvm@redhat.com>; Thu, 15 Nov 2012 01:09:39 -0800 (PST)
Message-ID: <50A4B14F.5050700@gmail.com>
Date: Thu, 15 Nov 2012 10:09:35 +0100
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <20121114151612.GD14396@jajo.eggsoft>
In-Reply-To: <20121114151612.GD14396@jajo.eggsoft>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Why do lvcreate with clvmd insist on VG being
 available on all nodes?
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Jacek Konieczny <jajcus@jajcus.net>

Dne 14.11.2012 16:16, Jacek Konieczny napsal(a):
> Hello,
>
> I am building a system where I use clustered LVM on a DRBD to provide
> shared block devices in a cluster. And I don't quite like and quite not
> understand some behaviour.
>
> Currently I have two nodes in the cluster, running: Corosync, DLM,
> clvmd, DRBD, Pacemaker and my service.
>
> Everything works fine when both nodes are up. When I put one to standby
> with 'crm node node1 standby' (which, among others, stops the DRBD) the
> other note is not fully functional.
>
> If I leave DLM and CLVMD running on the inactive node, then:
>
> lvchange -aey shared_vg/vol_name
> lvchange -aen shared_vg/vol_name
>
> work properly, as I would expect (make the volume available/unavailable
> on the node). But an attempt to create a new volume:
>
> lvcreate -n new_volume -L 1M shared_vg
>
> fails with:
>
> Error locking on node 1: Volume group for uuid not found: Hlk5NeaVF0qhDF2=
0RBq61EZaIj5yyUJgGyMo5AQcLfZpJS0DZUcgj7QMd3QPWICL
>


Haven't really tried to understand what are you trying to achieve,
but if you want to have node being activated only on one cluster node,
you may easily use    lvcreate -aey  option.

If you are using default clustered operation - it's not surprising,
the operation is refused if other nodes are not responding.


> Indeed, the VG is not available at the standby node at that moment. But,
> as it is not available there, I see no point in locking it there.

Well - you would need to write your own type of locking with support
of 'standby'  currently clvmd doesn't work with such state (and it's not
quite clear to me how it actually should even work).
So far either node is in cluster or is fenced.

>
> Is there some real, important reason to block lvcreate in such case?

As long as you would use exclusive activation for lvcreate it should work.
(or maybe 'local' - just test - but since you are trying to use unsupported
operational mode - you need to take responsibility for the results)


>
> When clvmd is stopped on the inactive node and 'clvmd -S' has been run
> on the active node, then both 'lvchange' and 'lvcreate' work as
> expected, but that doesn't look like a graceful switch-over. And another
> 'clvmd -S' stopped clvmd all together (this seems like a bug to me)
>
> And one more thing bothers me=E2=80=A6 my system would be very scalable t=
o many
> nodes, where only two share active storage (when using DRBD). But this
> won't work if LVM would refuse some operations when any VG is not
> available on all nodes.

Obviously using clustered VG in non-clustered environment isn't smart plan.
What you could do - is to   disable clustering support on VG

vgchange -cn <vg> --config 'global {locking_type =3D 0}'


Note - you may always go around any locking problem with the above config=20
option - just do not report then problems with broken disk content and badly
activated volumes on cluster nodes.

Zdenek
