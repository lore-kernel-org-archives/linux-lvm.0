Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2RCZMlb018608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 27 Mar 2015 08:35:23 -0400
Received: from mx3.lixium.fr (mx2.lixium.fr [79.98.96.12])
	by mx1.redhat.com (Postfix) with ESMTP id 0FD2A350064
	for <linux-lvm@redhat.com>; Fri, 27 Mar 2015 12:35:18 +0000 (UTC)
Received: from [192.168.1.21] (nsg93-h01-31-34-69-35.dsl.sta.abo.bbox.fr
	[31.34.69.35]) (Authenticated sender:
	europeanservers-c.baegert-maildrop@mx3.lixium.fr)
	by mx3.lixium.fr (Postfix) with ESMTPSA id C5BCF14FA
	for <linux-lvm@redhat.com>; Fri, 27 Mar 2015 13:35:16 +0100 (CET)
Message-ID: <55154ECD.1070707@lixium.fr>
Date: Fri, 27 Mar 2015 13:36:29 +0100
From: Christophe <c.baegert-listes@lixium.fr>
MIME-Version: 1.0
References: <55153867.80501@lixium.fr>
	<zarafa.551542c1.3c12.285b727e66d54380@zarafa.deriva.de>
In-Reply-To: <zarafa.551542c1.3c12.285b727e66d54380@zarafa.deriva.de>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM crashed,
 no superblock on dozens of LVs even after vgcfgrestore
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Christian,

Le 27/03/2015 12:45, Christian Schr�der a �crit :
> Hi,
> None of your DRBD devices seems to be in primary mode, so you probably cannot access them at all. (You could try reading the first block of one of your DRBD devices, e.g. "dd if=/dev/raidssd/drbd0 bs=512 count=1", which should also fail.)
> You should be able to promote the ressources using "drbdadm primary xxx" with "xxx" being the name of the ressource. (I think you have to promote them one by one.) See http://drbd.linbit.com/users-guide-8.4/s-switch-resource-roles.html  for an explanation.
> Normally, devices should be promoted when DRBD is started. Check if "become-primary-on" is set in your ressource configuration (e.g. /etc/drbd.d/foo.res). If you use some cluster management software, it should handle promotion and demotion of DRBD devices.

You're right, how did I miss that ???

I owe you a beer (or two packs of) the next time you come to Paris ;-)

Thanks a lot !!!

-- 
Christophe
