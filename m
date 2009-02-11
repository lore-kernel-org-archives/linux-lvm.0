Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1BFoECv013225
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 10:50:15 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n1BFoBke018473
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2009 10:50:12 -0500
Message-ID: <4992F3C7.4050403@redhat.com>
Date: Wed, 11 Feb 2009 15:50:31 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] system-config-lvm
References: <4992F340.7040005@cox.net>
In-Reply-To: <4992F340.7040005@cox.net>
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

Clyde E. Kunkel wrote:
> With the ext4 file csystem becoming a default for Fedora and the btrfs 
> becoming experimental in Fedora, when will system-config-lvm be updated 
> to recognize these file systems instead of reporting "no filesystem."

File a bug/bugs in Red Hat BZ against the system-config-lvm package 
(in rawhide or a supported Fedora release that includes the file 
system the bug relates to) requesting support for these file systems.

Regards,
Bryn.
