Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB1E60Pf010211
	for <linux-lvm@redhat.com>; Mon, 1 Dec 2008 09:06:00 -0500
Received: from smtp003.apm-internet.net (smtp003.apm-internet.net
	[85.119.248.52])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id mB1E5loC020908
	for <linux-lvm@redhat.com>; Mon, 1 Dec 2008 09:05:47 -0500
Received: from bernoulli.globalphasing.com (bernoulli.globalphasing.com
	[192.168.131.101])
	by mailserv1.globalphasing.com (Postfix) with ESMTP id 0E7AE1BE0E
	for <linux-lvm@redhat.com>; Mon,  1 Dec 2008 14:05:46 +0000 (GMT)
Date: Mon, 1 Dec 2008 14:05:45 +0000 (GMT)
From: Peter Keller <pkeller@globalphasing.com>
Subject: Re: [linux-lvm] RE: linux-lvm Digest, Vol 57, Issue 15
In-Reply-To: <OFCB98EA29.40467623-ONC1257512.002DA46F-C1257512.002E7540@lippi.fr>
Message-ID: <alpine.LNX.1.10.0812011319450.26105@bernoulli.globalphasing.com>
References: <20081128154001.D430661AEE8@hormel.redhat.com>
	<OFCB98EA29.40467623-ONC1257512.002DA46F-C1257512.002E7540@lippi.fr>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="===============1018104867=="
Content-ID: <alpine.LNX.1.10.0812011353320.26105@bernoulli.globalphasing.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--===============1018104867==
Content-Type: TEXT/PLAIN; charset="iso-8859-15"; format="flowed"
Content-Transfer-Encoding: quoted-printable
Content-ID: <alpine.LNX.1.10.0812011326521.26105@bernoulli.globalphasing.com>

Dear Antony,

On Mon, 1 Dec 2008, Antony MARTINEAU wrote:

> Hello Lars,
> =EF=BF=BDAndreas was whith us the last week =EF=BF=BD;-)
>=20
> So I think to that xfs_freeze is no needed during a snapshot LVM2
> My backup Script do :
> FLUSH TABLES WITH READ LOCK;
> system lvcreate --snapshot -n $snapname -L$snapsize /dev/$vg/$lv;
> UNLOCK TABLES;
> So i think it is the best way to backup
>=20
> The last message about peter Keller worring me... You think to that XFS
> is not a filesystem that correspond whit database transactions???
> I think XFS is actually the best FS on all domains... can i use XFS for
> mysql database??

There is no reason to be worried about the compatability of MySQL and XFS=20
filesystems. The word "correspond" is a bit of a "faux ami": it can mean=20
very different things in French and English even though it is written the=20
same way in both languages, which I think is the source of your confusion=20
here.

I used it in the (English) sense of "is equivalent to". I did not mean it i=
n=20
the sense of: "is compatible with". I was also using the word "transaction"=
=20
in its narrow technical sense of a set of operations that take effect=20
completely or not at all. If you read discussions about the XFS filesystem =

(or indeed any journaling filesystem), you will find that its operation is =

discussed using traditional database terminology (transactions, commits,=20
etc.).

The point that I was making is that some people seem to be misled by this=20
into assuming that a a single transaction in a database is implemented usin=
g=20
a single transaction on each of the underlying filesystems where data are=20
being changed. If they implement a backup strategy that is based on this=20
assumption, they will probably get backups that are less reliable than if=20
they use the "FLUSH TABLES WITH READ LOCK" strategy.

Regards,
Peter.

--
Peter Keller                                     Tel.: +44 (0)1223 353033
Global Phasing Ltd.,                             Fax.: +44 (0)1223 366889
Sheraton House,
Castle Park,
Cambridge CB3 0AX
United Kingdom
--===============1018104867==--
