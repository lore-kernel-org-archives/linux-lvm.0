Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7Q58Fll015939
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 01:08:15 -0400
Received: from vm04-mail01.alteeve.ca (mail.alteeve.ca [65.39.153.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3AD43C04D2B5
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 05:08:14 +0000 (UTC)
Received: from lepton.alteeve.ca (unknown [12.12.165.225])
	by vm04-mail01.alteeve.ca (Postfix) with ESMTPSA id 8A746E04BF
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 01:08:11 -0400 (EDT)
References: <CAN2gjWSe+V9nEDWuR0nVtzUZEt2d5yYjy5cQxrPPjHNO9NSMwA@mail.gmail.com>
From: Digimer <lists@alteeve.ca>
Message-ID: <415584cb-2e8f-ce85-260f-9b75aea51d6c@alteeve.ca>
Date: Fri, 26 Aug 2016 01:08:11 -0400
MIME-Version: 1.0
In-Reply-To: <CAN2gjWSe+V9nEDWuR0nVtzUZEt2d5yYjy5cQxrPPjHNO9NSMwA@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvm2 cluster aware
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
Content-Type: text/plain; charset="windows-1252"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 25/08/16 04:49 AM, su liu wrote:
> hi digimer , Thanks your replay explanation.
>=20
> My use case is:
>=20
> One admin node and some compute nodes, All the nodes shares a storage
> (eg. FCSAN).
> I create a vg on the shared storage=EF=BC=8C and the vg can be seen on al=
l the
> nodes.
> The admin node's  responsibility is to manage the logical volume it
> created, and the other compute node can attach these lvs to VM directly,
> not through admin node.
> Under the scene of LVM driver of OpenStack Cinder project, The lvm
> volumes are attached to VMs through Cinder node via ISCSI. So I want to
> make sure whether I can attach lvm volumes to VMs directly.
>=20
> To achieve this goal, Should I use the method you mentiond before?=20
>=20
> Thanks very much!

I can't speak to the cinder project, but as for "do something in LVM on
one node, see that everywhere", then yes, clvmd will do just that. Our
project uses clvmd backed LVs to provide raw storage to KVM VMs with
cluster-aware tools to manage the VMs, handle live migration, etc.

In short; look at the pacemaker project. Be sure to use fencing (always
needed, but extra important with shared storage). If you want to go into
more detail, we'll drift fairly far from LVM stuff, so I would recommend
joining the Clusterlabs users list and start by introducing yourself,
explain your goals and tell us what OS/version you are planning to run.
From there, we can help you work on a POC.

--=20
Digimer
Papers and Projects: https://alteeve.ca/w/
What if the cure for cancer is trapped in the mind of a person without
access to education?
