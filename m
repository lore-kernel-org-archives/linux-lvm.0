Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1S2TE825995
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2004 21:29:14 -0500
Received: from ciistr2.ist.utl.pt (ciistr2.ist.utl.pt [193.136.128.2])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1S2TDb07310
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2004 21:29:13 -0500
Received: from mail.ist.utl.pt (mail.ist.utl.pt [193.136.128.8])
	by ciistr2.ist.utl.pt (Postfix) with ESMTP id 381564BBF0
	for <linux-lvm@redhat.com>; Sat, 28 Feb 2004 02:29:12 +0000 (WET)
Message-ID: <403FFCAE.7020300@ist.utl.pt>
From: "=?ISO-8859-1?Q?Miguel_Cabe=E7a?=" <cabeca@ist.utl.pt>
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
Date: Fri Feb 27 21:27:25 2004
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
