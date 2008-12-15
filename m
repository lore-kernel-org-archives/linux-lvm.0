Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBF964Kt004076
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2008 04:06:05 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id mBF964TL021809
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2008 04:06:04 -0500
Message-ID: <49461DA2.4090708@redhat.com>
Date: Mon, 15 Dec 2008 09:04:34 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] FC8: "no Volumegroups found" after Mainboard-Change, 
	Rescueboot:OK
References: <49461A1C.8050006@tum.de>
In-Reply-To: <49461A1C.8050006@tum.de>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Reinald Gfuellner wrote:
> After changing the mainboard, booting of several preexistent
> FC8-Installations fails: "No volume groups found".
> (kernel can not mount root-filesystem.)
> 
> DVD-Rescue-Boot however is OK, volumegroups are found and
> root-filesystem is accessible.
> 
> I've been searching quite a while for a solution.
> 

Have you tried to rebuild your initrd from the rescue environment? It's 
possible that the new motherboard requires a different set of kernel 
modules to boot than the old one.

Regards,
Bryn.
