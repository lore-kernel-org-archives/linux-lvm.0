Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pASClD41013079
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2011 07:47:13 -0500
Received: from smarty.dreamhost.com (smarty.dreamhost.com [208.113.175.8])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pASCl3VL016645
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2011 07:47:03 -0500
Date: Mon, 28 Nov 2011 04:46:32 -0800
From: lvm@qasmos.net
Message-ID: <20111128124632.GA17443@hulk.dreamhost.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Recovering a volume after lost disk
Reply-To: lvm@qasmos.net,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

I have a file system that spanned two physical disks on my Linux machine bu=
t one disk was lost and had to be pulled out due to excessive errors.  Are =
there instructions anywhere for being able to truncate the file system to t=
he size of the good disk and mount it that way?  The disk that is left is g=
ood so data in it should be intact.  It is just that volume manager command=
s don=E2=80=99t see the volume in it, only the disk group itself.
