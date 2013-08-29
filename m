Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r7TGLjEa030995
	for <linux-lvm@redhat.com>; Thu, 29 Aug 2013 12:21:45 -0400
Received: from mail.gathman.org (wsip-70-169-160-205.dc.dc.cox.net
	[70.169.160.205])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r7TGLiaO030126
	for <linux-lvm@redhat.com>; Thu, 29 Aug 2013 12:21:44 -0400
Received: from sdgathman-1-pt.tunnel.tserv13.ash1.ipv6.he.net
	(sdgathman-1-pt.tunnel.tserv13.ash1.ipv6.he.net
	[IPv6:2001:470:7:809::2] (may be forged)) (authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id r7TGLxYF023751
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 29 Aug 2013 12:21:59 -0400
Date: Thu, 29 Aug 2013 12:21:43 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <521BAF57.5050709@gathman.org>
Message-ID: <alpine.LRH.2.03.1308291220430.16835@gathman.org>
References: <trinity-3825ffd4-bc3f-4b3d-b3b8-b0feb9436f1f-1377430137079@3capp-webde-bs10>
	<521BAF57.5050709@gathman.org>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463811830-467005937-1377793304=:16835"
Subject: Re: [linux-lvm] Duplicate physical volumes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811830-467005937-1377793304=:16835
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On 08/25/2013 07:28 AM, oliver_block2@web.de wrote:
>       Dear LVM list,
> =EF=BF=BD
> this is my first posting to this list and actually I am making my
> first experiences with LVM. The following is my situation:
> =EF=BF=BD
> I had a RAID 1 consisting of /dev/sdb1 and /dev/sdc1 making /dev/md2
> and used this device as a physical volume for LVM. I used this inside
> the volume group vg_data.

Your problem is not with LVM, but with mdadm.=EF=BF=BD Look at the contents=
 of
/proc/mdstat, and verify which md device is which.=EF=BF=BD Yes, after spli=
tting the
mirror, you should have done a pvremove of the inactive leg.=EF=BF=BD You c=
an still
do so, but verify the md names.=EF=BF=BD They may have been renumbered afte=
r your
reconfiguration!
---1463811830-467005937-1377793304=:16835--
