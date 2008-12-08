Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB8Ng552020256
	for <linux-lvm@redhat.com>; Mon, 8 Dec 2008 18:42:05 -0500
Received: from d01.online-netz.de (d01.online-netz.de [213.160.90.171])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id mB8NfmT3024246
	for <linux-lvm@redhat.com>; Mon, 8 Dec 2008 18:41:49 -0500
Received: from news.conactive.com (fandango.conactive.com [212.202.99.226])
	by d01.online-netz.de (Postfix) with ESMTP id 1ADF6F9229
	for <linux-lvm@redhat.com>; Tue,  9 Dec 2008 00:41:41 +0100 (CET)
Date: Tue, 09 Dec 2008 00:41:38 +0100
Message-Id: <VA.000034ec.0056c987@news.conactive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Kai Schaetzl <maillists@conactive.com>
Subject: [linux-lvm] shift PV from disk to raid device?
Reply-To: maillists@conactive.com,
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
To: linux-lvm@redhat.com

To make a long story short I accidentally put an LVM PV on top of /dev/sda =

instead of /dev/md2 (a Linux RAID 1 partition with the mirror missing) and =

noticed only after I was done with creating logical volumes and filling=20
them with content. After adding the second RAID device and syncing I now=20
get the duplicate PV uuid warning. The reason is obvious, I have the same=20
PV on both drives. Apart from that warning "everything" works, but I would =

like to fix it.

If possible I would like to avoid wiping the complete PV, recreating all=20
of it and copying all the content of the logical volumes back to it.
Is there a way to "shift" the PV from /dev/sda to /dev/md2 and leave=20
everything else intact? Maybe after breaking the array?

Kai

--=20
Kai Sch=EF=BF=BDtzl, Berlin, Germany
Get your web at Conactive Internet Services: http://www.conactive.com
