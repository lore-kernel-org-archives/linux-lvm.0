Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1S1vn819844
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2004 20:57:49 -0500
Received: from smtp.netcabo.pt (smtp.netcabo.pt [212.113.174.9])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1S1vlb32711
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2004 20:57:49 -0500
Message-ID: <403FF546.20102@netcabo.pt>
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
Date: Mon Mar  1 14:14:32 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

Hi,

Can LILO with Saout's device mapper patch boot from an LVM2 /boot over soft=
ware RAID1 ?

I get the following error when runing lilo:
Fatal: Sorry, don't know how to handle device 0xfe01

Does this mean that LILO can only boot from a RAID1 *OR* device-mapper devi=
ce, not both? (LVM2 on top of RAID1)

Thanks in advance.

Miguel Cabe=EF=BF=BDa

CIIST - IST - Lisboa - Portugal
