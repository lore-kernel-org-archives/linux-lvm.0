Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j24AsjK07566
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2005 05:54:45 -0500
Received: from lama.bgc-jena.mpg.de (lama.bgc-jena.mpg.de [195.37.229.21])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j24Ashfm007115
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2005 05:54:43 -0500
Received: from riva.bgc-jena.mpg.de (riva.bgc-jena.mpg.de [141.5.16.47])
	by lama.bgc-jena.mpg.de (GATE -B- / MPI BGC Mail System) with ESMTP id
	8A7E8152B6
	for <linux-lvm@redhat.com>; Fri,  4 Mar 2005 11:54:42 +0100 (CET)
Received: from riva (localhost [127.0.0.1])
	by sophos.bgc-jena.mpg.de (Postfix) with ESMTP id 654A39C0C5
	for <linux-lvm@redhat.com>; Fri,  4 Mar 2005 11:54:42 +0100 (CET)
Received: from [141.5.16.151] (sequoia.bgc-jena.mpg.de [141.5.16.151])
	by riva.bgc-jena.mpg.de (Postfix) with ESMTP id D77EFEA173
	for <linux-lvm@redhat.com>; Fri,  4 Mar 2005 11:54:37 +0100 (CET)
Message-ID: <42283E6D.9060208@bgc-jena.mpg.de>
Date: Fri, 04 Mar 2005 11:54:37 +0100
From: "Dr.Peer-Joachim Koch" <pkoch@bgc-jena.mpg.de>
MIME-Version: 1.0
References: <49849.129.33.49.251.1076733336.squirrel@www.fusion-hosting.net>
In-Reply-To: <49849.129.33.49.251.1076733336.squirrel@www.fusion-hosting.net>
Content-Type: multipart/mixed; boundary="------------070509050903070301000402"
Subject: [linux-lvm] Some general questions ..
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------070509050903070301000402
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Hi,

we're currently planing to update our old HPUX (5 years old)file server.
In the moment one machine is handling all 10TB of file systems.
The storage is attached using a san (2 Brocades + 2 EMC Clarrion4700)
Backupserver and the tape library are also within the san.

We are only using nfs and samba in the moment.

I'm currently thinking about a setup where 3 linux machines
are handling all lv. First breaking everything into three vg, each one
attached to one node, but visible on all nodes.

So would it be possible to import some dedicated devices
(all luns from the vg), while other luns are localy active
and others are active on the third node ?

If just a pvscan is execute what is happening to "normaly"
working vg's  ?

Is it planed to mirroring of lv onto other devices within
th vg ?

Who has a good concept for BIG file servers ?   ;)
(Maybe we have to extend it to 50->100TB for a new linux cluster...)

Thanks for your help !
--=20
Bye,
     Peer
_________________________________________________________
Max-Planck-Institut fuer Biogeochemie
Dr. Peer-Joachim Koch
Hans-Kn=EF=BF=BDll Str.10            Telefon: ++49 3641 57-6705
D-07745 Jena                 Telefax: ++49 3641 57-7705

--------------070509050903070301000402
Content-Type: text/x-vcard; charset=utf-8;
 name="pkoch.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="pkoch.vcf"

begin:vcard
fn:Peer-Joachim Koch
n:Koch;Peer-Joachim
org;quoted-printable:MPI f=C3=BCr Biogeochemie;DVA
adr:;;Hans-Knoell-Str. 10;Jena;;07745;Germany
email;internet:pkoch@bgc-jena.mpg.de
title:Dr. 
tel;work:+49 3641 576705
tel;fax:+49 3641 577705
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------070509050903070301000402--
