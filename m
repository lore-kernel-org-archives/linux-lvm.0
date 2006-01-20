Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0KFMY125046
	for <linux-lvm@redhat.com>; Fri, 20 Jan 2006 10:22:34 -0500
Received: from smtp2.rz.tu-harburg.de (smtp2.rz.tu-harburg.de [134.28.205.13])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0KFMUNN031114
	for <linux-lvm@redhat.com>; Fri, 20 Jan 2006 10:22:31 -0500
Received: from mail2.rz.tu-harburg.de (mail2.rz.tu-harburg.de [134.28.202.179])
	by smtp2.rz.tu-harburg.de (8.13.1/8.13.1) with ESMTP id k0KFMS5g030564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-lvm@redhat.com>; Fri, 20 Jan 2006 16:22:28 +0100
Received: from [134.28.41.43] (copenhagen.ti1.tu-harburg.de [134.28.41.43])
	(user=ti1fw mech=PLAIN bits=0)
	by mail2.rz.tu-harburg.de (8.13.1/8.13.1) with ESMTP id k0KFMQED031115
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 20 Jan 2006 16:22:26 +0100
Message-ID: <43D10036.7050404@gmx.net>
Date: Fri, 20 Jan 2006 16:22:30 +0100
From: Fabian Wenzel <f.wenzel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM on Raid-5 woes...
References: <43D0C66C.3040609@gmx.net>
	<53D60533C1E27D68FBAF212F@dhcp-2-206.wgops.com>
In-Reply-To: <53D60533C1E27D68FBAF212F@dhcp-2-206.wgops.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

> Oh also, do the drives work fine by themselves?  IE remove MD RAID fromt
> eh picture completely temporarily, can you pvcreate directly on the
> devices?

Will try tomorrow if the solution below is wrong. The raid is running
fine, all devices are up.

Meanwhile, I googled over and over again and found an two important bug
reports related to the same issue (Debian bug report #247896 and, more
important, #267157 - can be found on bugs.debian.org)

I think the problem is that I have to rebuild lvm2 using
"--disable-o_direct". I don't know why there is some trouble on an ARM,
and (of course) it would be good if "o_direct" can eventually be used
(whatever it is), but I'm positive that this will do the trick.

Otherwise, I will send another message to this thread.

Thanks anyway,

       Fabian





-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFD0QA2bJzYO4mghQIRAjrzAJ0YYElKKVpjiXJ/d0/5ZZah+pbYMQCfTDOY
QJNta7QiLT+HIaph9kk3s00=
=aXQE
-----END PGP SIGNATURE-----
