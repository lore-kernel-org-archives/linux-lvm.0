Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i29GoG807031
	for <linux-lvm@redhat.com>; Tue, 9 Mar 2004 11:50:16 -0500
Received: from mwinf0101.wanadoo.fr (smtp1.wanadoo.fr [193.252.22.30])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i29GoEST002586
	for <linux-lvm@redhat.com>; Tue, 9 Mar 2004 11:50:15 -0500
Received: from wwinf0101 (wwinf0101 [172.22.132.28])
	by mwinf0101.wanadoo.fr (SMTP Server) with ESMTP id 9CE3FC000082
	for <linux-lvm@redhat.com>; Tue,  9 Mar 2004 17:50:09 +0100 (CET)
Message-ID: <12573806.1078851009631.JavaMail.www@wwinf0101>
From: "dld.pascal.garcia" <dld.pascal.garcia@wanadoo.fr>
Subject: Re: Re: [linux-lvm] Help : vg not accessible (with pvdata result)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Mar  9 11:48:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Thank you anyway.=20
=20
I have tried to modify the data by myself but I don't understand everything=
.=20
But pvdata gives more coherent inofrmtation.=20
=20
I continue some tests because my data is very important.=20
=20
First question :=20
Is there any document that discribes the structure of the data ?=20
=20
I order to reinstall the portable pc, I made a backup of the 3 partitions, =

and also backup of the =EF=BF=BDrtition table of the disk. So after dd of t=
he=20
partitions I have 3 normal files. =20
=20
I tried a =20
=20
pvimport -f oldvg hda6 hda5 hda1=20
=20
The result is: cannot stat hda6.=20
=20
Question 2 :=20
Is there any  way to import the vg directly from these files ?=20
=20
Thanks a lot=20
=20
Pascal Garcia
