Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jATIjhV23126
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 13:45:43 -0500
Received: from ramoth.dragonhold.org (ramoth.dragonhold.org [80.229.192.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jATIjbRn006077
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 13:45:37 -0500
Received: from gwood by ramoth.dragonhold.org with local (Exim 4.50)
	id 1EhATs-0000ZF-1u
	for linux-lvm@redhat.com; Tue, 29 Nov 2005 18:45:32 +0000
Date: Tue, 29 Nov 2005 18:45:32 +0000
From: Graham Wood <clvm@spam.dragonhold.org>
Subject: Re: [linux-lvm] Re: Enterprise Backup Software with good support for
	LVM
Message-ID: <20051129184532.GD29763@dragonhold.org>
References: <dmi544$ckg$1@sea.gmane.org>
	<5493D77C6E101BAEDC2747FF@dhcp-2-206.wgops.com>
	<438CA082.8050004@knology.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <438CA082.8050004@knology.net>
Sender: <gwood@dragonhold.org>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Nov 29, 2005 at 12:40:02PM -0600, Mark F wrote:
> Michael Loftis wrote:
> Is anyone using it?  Or does anyone have any reason to believe it 
> will/won't work?
Netbackup does a file level backup, rather than block level.  This means 
that the filesystem used is not relevant, and the underlying structure
even more so.

E.g. it works at the directory/file level - so it backs up the files
that it finds and doesn't care what sort of block device is under that.

(That's assuming you're doing file backups, and not raw devices for DBs)
