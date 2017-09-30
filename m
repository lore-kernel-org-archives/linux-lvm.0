Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B55DA1866D
	for <linux-lvm@redhat.com>; Sat, 30 Sep 2017 08:11:45 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E1EC37EEF
	for <linux-lvm@redhat.com>; Sat, 30 Sep 2017 08:11:43 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.signet.nl (Postfix) with ESMTP id 7998E636AE
	for <linux-lvm@redhat.com>; Sat, 30 Sep 2017 10:11:43 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 30 Sep 2017 10:11:41 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <CACj3i71bvspO5H_h8s=XBnDzRBvJwdL=Q18_4dvy+C7-ktdirw@mail.gmail.com>
References: <CACj3i71bvspO5H_h8s=XBnDzRBvJwdL=Q18_4dvy+C7-ktdirw@mail.gmail.com>
Message-ID: <1d26a872b9a33da933cefe63b686a1d1@xenhideout.nl>
Subject: Re: [linux-lvm] Difference between Debian and some other
 distributions with thin provisioning
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Jan Tulak schreef op 29-09-2017 18:42:

> Debian:
> # cat /etc/debian_version
> 8.9
> # lvm version
>   LVM version:     2.02.111(2) (2014-09-01)
>   Library version: 1.02.90 (2014-09-01)
>   Driver version:  4.27.0
> 
> Centos:
> # cat /etc/redhat-release
> CentOS Linux release 7.4.1708 (Core)
> # lvm version
>   LVM version:     2.02.171(2)-RHEL7 (2017-05-03)
>   Library version: 1.02.140-RHEL7 (2017-05-03)
>   Driver version:  4.35.0

Versions are not actually very close.

On Debian I do know that I am often confused by thin commands, sometimes 
-T seems to be necessary and sometimes --thin-pool or I am just 
confused, I don't know.

Same with Grub2, it has been in 2.02beta for ages and was only recently 
released as 2.02 but I think years of development went into that.

Although I think I can stay they are quit headstrong as compared to 
LVM2...

But you can see that the versions are 3 years apart anyway...

Regards.
