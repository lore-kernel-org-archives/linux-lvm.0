Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8EKKeV29987
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2005 16:20:40 -0400
Received: from server6.hostpoint.ch (server6.hostpoint.ch [217.26.52.16])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8EKKVeR030321
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2005 16:20:32 -0400
Received: from 217-119-145-4.sefanet.ch ([217.119.145.4] helo=[192.168.15.41])
	by server6.hostpoint.ch with esmtpa (Exim 4.43) id 1EFdkA-0003Ue-2O
	for linux-lvm@redhat.com; Wed, 14 Sep 2005 22:20:34 +0200
Message-ID: <43288600.7080501@markus.org>
Date: Wed, 14 Sep 2005 22:20:16 +0200
From: Markus Baertschi <markus@markus.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] VGDA Question
References: <20050907144600.42410.qmail@web52915.mail.yahoo.com>
In-Reply-To: <20050907144600.42410.qmail@web52915.mail.yahoo.com>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Rik Herrin wrote:

>Hi,
> According to the LVM man page, the VGDA (Volume Group
>Descriptor Area) holds the metadata responsible for
>keeping information about the LVs.  However, it is
>contained in the PVs.  Why does the VGDA contain both
>LV descriptors and PE descriptors?
>
Because there are LV's with PE's and both types of information must be=20
stores somewhere.

>  Shouldn't it just
>have PE descriptors and leave the LV descriptors to
>the volume group ?
>
The VGDA is where the volume group information is stored. The LV info is=20
therefore exactly where it belongs.

>  Also, when booting, what makes the
>kernel know that there are VGs and LVs?
>
The vgscan command is run during boot (from a rc file) and it detects=20
the volumegroups and makes them available.

>  Does it look
>at the type of the partition and if it detects that
>it's a PV, extract the VGDA to help it build this
>information?
>
Yes

>  If this is so, how does it deal with
>entire harddisks.  For example, if I run the command:
>pvcreate /dev/sdd
>how would the kernel know that this is a PV?.=20
> =20
>
If you use the enire harddisk, then there is no traditional partition=20
table. In this case the vgscan command looks if the entire disk is a PV.

>Finally, where exactly is the VGDA information held?.
>
At the beginning of the disk/partition you created with pvcreate.

Markus

--=20
  Markus Baertschi             Phone: ++41 (21) 807 1677
  Bas du Ross=EF=BF=BD 14b             Fax  : ++41 (21) 807 1678
  CH-1163, Etoy                Email: markus@markus.org
  Switzerland                  Homepage: www.markus.org
