Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2MJWsUl019065
	for <linux-lvm@redhat.com>; Wed, 22 Mar 2006 14:32:54 -0500
Received: from tungsten.msp.technicality.org (tungsten.msp.technicality.org
	[216.250.164.46])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2MJWrSS021498
	for <linux-lvm@redhat.com>; Wed, 22 Mar 2006 14:32:53 -0500
Received: from tungsten.msp.technicality.org (tungsten.msp.technicality.org
	[216.250.164.46])
	by tungsten.msp.technicality.org (8.13.4/8.13.4/Debian-3) with ESMTP id
	k2MJWiEU016473
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 22 Mar 2006 13:32:44 -0600
Date: Wed, 22 Mar 2006 13:32:44 -0600 (CST)
From: Nate Carlson <natecars@natecarlson.com>
Subject: Re: [linux-lvm] Problem creating snapshot with 2.6.15, lvm2
In-Reply-To: <1141852514.11075.12.camel@loon.fatav.hu>
Message-ID: <Pine.LNX.4.63.0603221330390.8625@tungsten.msp.technicality.org>
References: <Pine.LNX.4.63.0603081020340.848@tungsten.msp.technicality.org>
	<1141852514.11075.12.camel@loon.fatav.hu>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 8 Mar 2006, Szabo Akos wrote:
> I've this error too, and I update to lvm2-2.02.01-1.2.1 /Fedora version, 
> it's meaning 2.02.01/ and usually it's working now for me. I don't dare 
> to use it with a productive environment.

[sorry; been going like crazy lately, and hadn't had time to get back to 
this.]

I tried upgrading to a 2.6.16 kernel, and LVM tools version (debian 
package) 2.02.02-1.. still get the exact same error:

fs:~# lvcreate -L1G -s -n Documents-backup /dev/HomeVG/Documents
   LV HomeVG/Documents-backup in use: not deactivating
   Couldn't deactivate new snapshot.
fs:~# lvscan | grep Documents
   ACTIVE            '/dev/HomeVG/Documents' [10.00 GB] inherit
   ACTIVE            '/dev/HomeVG/Documents-backup' [1.00 GB] inherit

Any other ideas?

Thanks!

------------------------------------------------------------------------
| nate carlson | natecars@natecarlson.com | http://www.natecarlson.com |
|       depriving some poor village of its idiot since 1981            |
------------------------------------------------------------------------
