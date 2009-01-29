Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0TFYoDh018525
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 10:34:50 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n0TFYm5o022159
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 10:34:48 -0500
Message-ID: <4981CC92.5090703@redhat.com>
Date: Thu, 29 Jan 2009 15:34:42 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Local + iSCSI disks
References: <20090129153047.GA10306@esri.com>
In-Reply-To: <20090129153047.GA10306@esri.com>
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

Ray Van Dolson wrote:
> Looking for thoughts on a VolGroup and LV made up of both local and
> remote, iSCSI attached disks.  Obviously it will work, but are there
> any settings or "gotchas" I should be aware of with this configuration?
> Obviously a speed penalty...

The period between the local devices becoming available and the iSCSI 
volumes appearing will be potentially confusing for the LVM tools and 
might need some special handling depending on how your distribution 
manages LVM activation.

In future as LVM moves to having udev detect devices and call LVM to 
have them activated this should get easier.

> I know I could also aggregate with the md driver and set things up to
> do writes/reads to a specific disk depending on whether or not its
> local, etc.  Anything like that in the LVM world?

There's the replicator target being worked on:

http://people.redhat.com/heinzm/sw/dm/dm-repl/

Regards,
Bryn.
