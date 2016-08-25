Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7P7kpVA007717
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2016 03:46:52 -0400
Received: from vm04-mail01.alteeve.ca (mail.alteeve.ca [65.39.153.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9CFD17F7A4
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2016 07:46:50 +0000 (UTC)
Received: from pulsar.alteeve.ca (dhcp-108-168-17-164.cable.user.start.ca
	[108.168.17.164])
	by vm04-mail01.alteeve.ca (Postfix) with ESMTPSA id 7B449E04BF
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2016 03:37:07 -0400 (EDT)
References: <CAN2gjWSEzL+M45UGFEkEA_i5bgNpKLXTQ+DAMPJjJJvBBvaTKQ@mail.gmail.com>
From: Digimer <lists@alteeve.ca>
Message-ID: <a0c7bedf-23d1-26c5-3853-0bd36f528185@alteeve.ca>
Date: Thu, 25 Aug 2016 03:37:08 -0400
MIME-Version: 1.0
In-Reply-To: <CAN2gjWSEzL+M45UGFEkEA_i5bgNpKLXTQ+DAMPJjJJvBBvaTKQ@mail.gmail.com>
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

On 24/08/16 09:50 PM, su liu wrote:
> I have a question about lvm2 cluster, The scene is that I try to imitate
> FCSAN by mapping a rbd volume to two compute node, Then I using the rbd
> volume to  create a PV and VG.I stoped the lvmetad daemon on the compute
> nodes. Then I find that when I operating the VG on one compute node, the
> changes can also be aware on another compute nodes.
>=20
> But this docment(http://www.tldp.org/HOWTO/LVM-HOWTO
> /sharinglvm1.html=EF=BC=89 says that "*LVM is not cluster aware".*
>=20
> My question is that can I use the method to achieve the case that I
> create or delete lv on one node whlie other compute node can using the lv=
s?
>=20
> Can anybody explain this?=20
>=20
> thx very much!

You can use DLM (distributed lock manager) to provide cluster locking to
LVM (locking_type =3D 3 via clvmd). This requires a cluster though, which
you can get with corosync + pacemaker (and use stonith!).

Further details/advice requires more understanding of your environment
and use-case. Feel free to pop over to Clusterlabs[1], as many of us do
this setup regularly. I use clustered LVM in all our HA setups and have
done so successfully for years.

digimer

1. http://clusterlabs.org/mailman/listinfo/users - freenode #clusterlabs

--=20
Digimer
Papers and Projects: https://alteeve.ca/w/
What if the cure for cancer is trapped in the mind of a person without
access to education?
