Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1S2FL823336
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2004 21:15:21 -0500
Received: from smtp.netcabo.pt (smtp.netcabo.pt [212.113.174.9])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1S2FKb04180
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2004 21:15:21 -0500
Message-ID: <403FF8E3.3060903@netcabo.pt>
From: =?ISO-8859-1?Q?Miguel_Cabe=E7a?= <cabeca@netcabo.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] LILO (with Saout's patch) + /boot on LVM2 over Software RAID1
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
Date: Mon Mar  1 14:14:25 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

Hi,

Can LILO with Saout's device mapper patch boot from an LVM2 /boot over=20
software RAID1 ?

I get the following error when runing lilo:
Fatal: Sorry, don't know how to handle device 0xfe01

Does this mean that LILO can only boot from a RAID1 *OR* device-mapper=20
device, not both? (LVM2 on top of RAID1)

Thanks in advance.

Miguel Cabe=EF=BF=BDa

CIIST - IST - Lisboa - Portugal
