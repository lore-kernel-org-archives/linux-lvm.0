Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7Q9jTNC020726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 05:45:29 -0400
Received: from mtaextp1.scidom.de (mtaextp1.scidom.de [146.107.103.20])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 908B37F7A4
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 09:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id 4D18C140EDE
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 11:39:44 +0200 (CEST)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 20Sp6ntO3hHJ for <linux-lvm@redhat.com>;
	Fri, 26 Aug 2016 11:39:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id F0015140ED8
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 11:39:42 +0200 (CEST)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1L10Z1sMdgzh for <linux-lvm@redhat.com>;
	Fri, 26 Aug 2016 11:39:42 +0200 (CEST)
Received: from mtaintp1.scidom.de (mtaintp1.scidom.de [146.107.8.104])
	by mtaextp1.scidom.de (Postfix) with ESMTPS id BDAEB140EDF
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 11:39:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id B41201015FE
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 11:39:42 +0200 (CEST)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id iaknCqy9208m for <linux-lvm@redhat.com>;
	Fri, 26 Aug 2016 11:39:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 22685101633
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 11:39:42 +0200 (CEST)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4E_n8IOwIOt3 for <linux-lvm@redhat.com>;
	Fri, 26 Aug 2016 11:39:42 +0200 (CEST)
Received: from mbxp1.scidom.de (mbxp1.scidom.de [146.107.8.101])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 04FA71015FE
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 11:39:41 +0200 (CEST)
Date: Fri, 26 Aug 2016 11:39:42 +0200 (CEST)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Message-ID: <1780261995.4192897.1472204382498.JavaMail.zimbra@helmholtz-muenchen.de>
In-Reply-To: <CAN2gjWSe+V9nEDWuR0nVtzUZEt2d5yYjy5cQxrPPjHNO9NSMwA@mail.gmail.com>
References: <CAN2gjWSe+V9nEDWuR0nVtzUZEt2d5yYjy5cQxrPPjHNO9NSMwA@mail.gmail.com>
MIME-Version: 1.0
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
To: LVM Mailingliste <linux-lvm@redhat.com>



----- On Aug 25, 2016, at 10:49 AM, su liu liusu8788@gmail.com wrote:

> hi digimer , Thanks your replay explanation.

> My use case is:

> One admin node and some compute nodes, All the nodes shares a storage (eg.
> FCSAN).
> I create a vg on the shared storage=EF=BC=8C and the vg can be seen on al=
l the nodes.
> The admin node's responsibility is to manage the logical volume it create=
d, and
> the other compute node can attach these lvs to VM directly, not through a=
dmin
> node.
> Under the scene of LVM driver of OpenStack Cinder project, The lvm volume=
s are
> attached to VMs through Cinder node via ISCSI. So I want to make sure whe=
ther I
> can attach lvm volumes to VMs directly.

> To achieve this goal, Should I use the method you mentiond before?

> Thanks very much!

Please keep in mind that cLVM just cares about informing all nodes of chang=
es of the
lvm metadata. It is not responsable for managing concurrent access to the l=
v's.
For that you need e.g. a cluster FS.


Bernd
=20

Helmholtz Zentrum Muenchen
Deutsches Forschungszentrum fuer Gesundheit und Umwelt (GmbH)
Ingolstaedter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Aufsichtsratsvorsitzende: MinDir'in Baerbel Brumme-Bothe
Geschaeftsfuehrer: Prof. Dr. Guenther Wess, Dr. Alfons Enhsen
Registergericht: Amtsgericht Muenchen HRB 6466
USt-IdNr: DE 129521671
