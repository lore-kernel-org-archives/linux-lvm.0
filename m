Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j24GJZK08217
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2005 11:19:35 -0500
Received: from smtp1.netcologne.de (smtp1.netcologne.de [194.8.194.112])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j24GJUxG012859
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2005 11:19:30 -0500
Received: from [192.168.2.141] (xdsl-81-173-252-146.netcologne.de
	[81.173.252.146])
	by smtp1.netcologne.de (Postfix) with ESMTP id 5D9ED38EA9
	for <linux-lvm@redhat.com>; Fri,  4 Mar 2005 17:19:22 +0100 (MET)
Message-ID: <42288A81.6070901@JDCassidy.net>
Date: Fri, 04 Mar 2005 17:19:13 +0100
From: John Cassidy <Sean@JDCassidy.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Some general questions ..
References: <49849.129.33.49.251.1076733336.squirrel@www.fusion-hosting.net>
	<42283E6D.9060208@bgc-jena.mpg.de>
In-Reply-To: <42283E6D.9060208@bgc-jena.mpg.de>
Content-Transfer-Encoding: quoted-printable
Reply-To: Sean@JDCassidy.net,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

z/VM

Dr.Peer-Joachim Koch wrote:
> Hi,
>=20
> we're currently planing to update our old HPUX (5 years old)file server.
> In the moment one machine is handling all 10TB of file systems.
> The storage is attached using a san (2 Brocades + 2 EMC Clarrion4700)
> Backupserver and the tape library are also within the san.
>=20
> We are only using nfs and samba in the moment.
>=20
> I'm currently thinking about a setup where 3 linux machines
> are handling all lv. First breaking everything into three vg, each one
> attached to one node, but visible on all nodes.
>=20
> So would it be possible to import some dedicated devices
> (all luns from the vg), while other luns are localy active
> and others are active on the third node ?
>=20
> If just a pvscan is execute what is happening to "normaly"
> working vg's  ?
>=20
> Is it planed to mirroring of lv onto other devices within
> th vg ?
>=20
> Who has a good concept for BIG file servers ?   ;)
> (Maybe we have to extend it to 50->100TB for a new linux cluster...)
>=20
> Thanks for your help !
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=20
Regards / Cordialement / Groetjes / Gruesse / Saludos

Cassidy IT Services

John Cassidy Dipl.-Ing (Informatique)

S390 & zSeries Systems Engineering

Schleswigstr. 7

D-51065 Cologne

EU

Tel: +49  (0) 221 61 60 777 =EF=BF=BD GSM: +49  (0) 177 799 58 56
E-Mail: Sean@JDCassidy.net
HTTP  : www.jdcassidy.net
