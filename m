Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l93FGMj3023685
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 11:16:22 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l93FGL3C001648
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 11:16:21 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l93FGFDj018082
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 11:16:15 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l93FGFKT028543
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 11:16:15 -0400
Date: Wed, 3 Oct 2007 11:16:15 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Backuping "special" snapshots
In-Reply-To: <47037B9A.3040209@es.clara.net>
Message-ID: <Pine.LNX.4.44.0710031115400.28515-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 3 Oct 2007, Marc Patino G=EF=BF=BDmez wrote:

> I try kpartx and it's so cool, but I can't make snapshots of=20
> /dev/vg00/lv00p1 ... so I can't solve the problem of making backup=20
> without stopping the Virtual Machine.

> Any advice?

Run kpartx on your snapshot.

--=20
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
