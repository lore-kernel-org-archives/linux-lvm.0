Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB7ImIr06287
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2004 13:48:18 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.195])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iB7Im8tx002437
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2004 13:48:13 -0500
Received: by rproxy.gmail.com with SMTP id c16so422688rne
	for <linux-lvm@redhat.com>; Tue, 07 Dec 2004 10:48:03 -0800 (PST)
Message-ID: <b9a453c204120710477fb9fcf7@mail.gmail.com>
Date: Tue, 7 Dec 2004 19:47:57 +0100
From: =?ISO-8859-1?Q?=D2scar_=C1lvarez_Vilaplana?= <grimborg@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] recovering a lvm volume group after one partition's
	deletion
Reply-To: =?ISO-8859-1?Q?=D2scar_=C1lvarez_Vilaplana?= <grimborg@gmail.com>,
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

Hi,

I've just found out that the reason I couldn't get my lvm volume group
to work was because I had accidentally formatted one of the partitions
that were used in that group, instead of the partition I actually
wanted to format. (I really should have rebooted when fdisk told me
to:( )

I've been trying to recover the information that was stored on the
volume group. Since the partition was only 1.88Gb big in a volume
group of 50Gb I thought maybe all was not lost.

What I've tried is running pvcreate on the formatted partition, but
vgdisplay complains that that it can't find the partition with the
uuid of the lost partition. I then tried hexedit'ing the partition and
changing its uuid, but this didn't fool lvm either: i got the same
error.

Is there any way to bring back, not all, of course, but some of the
data in the volume group?

Thanks!!

=EF=BF=BDscar
