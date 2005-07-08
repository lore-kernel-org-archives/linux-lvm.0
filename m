Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j68EAVV01840
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2005 10:10:31 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.188])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j68EAO1J012917
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2005 10:10:24 -0400
Message-ID: <42CE894F.1010702@gmx.net>
Date: Fri, 08 Jul 2005 16:10:23 +0200
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how to fsck?
References: <20050708100005.GA7178@localhost>
In-Reply-To: <20050708100005.GA7178@localhost>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Leopold Gouverneur schrieb:
>  How can I fsck filesystems managed by LVM?=20
>  I googled for it without success
Just do the fsck on the devices of the lv's as you do it on simple=20
partitions ;-). Remeber that the lv's must be activeted via 'vgscan |=20
vgchange -a y' (all distros shall do that nowadays).

Ciao
Klaus
--=20
Mit freundlichen Gr=EF=BF=BDssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
/ \
