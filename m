Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jATITSV17605
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 13:29:28 -0500
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jATITRcc012215
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 13:29:28 -0500
Received: from [10.1.2.206] (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id C516B25762
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 11:29:17 -0700 (MST)
Date: Tue, 29 Nov 2005 11:29:19 -0700
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] Enterprise Backup Software with good support for LVM
Message-ID: <5493D77C6E101BAEDC2747FF@dhcp-2-206.wgops.com>
In-Reply-To: <dmi544$ckg$1@sea.gmane.org>
References: <dmi544$ckg$1@sea.gmane.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



--On November 29, 2005 12:03:39 PM -0600 Mark F <mfaine@knology.net> wrote:

> Could someone suggest an Enterprise Backup package that has good support
> for LVM (LVM2 in this case) on Linux (Specifically Suse Linux Enterprise
> 9) Most products I've seen say they support block level backups but don't
> specifically say they support LVM.

LVM provides a block level device.  However you don't want to back up there 
anyway, you'll just end up with corrupt garbage.  You need to back up at 
the filesystem level unless you're using your LVM LVs for Oracle or 
something similar in which case the backup software needs to support that 
by putting Oracle or the related application into the correct hot backup 
mode before attempting to directly read the LVM data, as well as backing up 
the transaction/redo logs.
