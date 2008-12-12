Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBCAfaIt030584
	for <linux-lvm@redhat.com>; Fri, 12 Dec 2008 05:41:36 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id mBCAfaLK018202
	for <linux-lvm@redhat.com>; Fri, 12 Dec 2008 05:41:36 -0500
Message-ID: <49423F81.9010008@redhat.com>
Date: Fri, 12 Dec 2008 10:40:01 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] DM-MPIO - Boot from SAN
References: <BAY107-W39509E3F8F980D0E35961D8FF90@phx.gbl>
In-Reply-To: <BAY107-W39509E3F8F980D0E35961D8FF90@phx.gbl>
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

Mark Reardon wrote:
> Hello All,
> 
> Would anybody have a document/procedure for how to setup DM-MPIO to boot from SAN?
> 

It's can be quite involved, depending on whether or not your 
distribution has integrated support for multipath boot or not. RHEL and 
Fedora support this via the standard mkinitrd script, but only if you 
set the multipathing up at install time (start installer with "linux 
mpath").

For other distros, ymmv, but you'll need to get the multipath commands 
included in the initramfs image and add script to activate all the maps 
that are needed for the root file system.

Regards,
Bryn.
