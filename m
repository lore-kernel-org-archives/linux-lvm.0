Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8LDUjr12158
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 09:30:45 -0400
Received: from perkamentus (perkamentus.chem.tue.nl [131.155.82.136])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8LDUdgm020755
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 09:30:44 -0400
Received: from esmeets by perkamentus with local (Exim 3.36 #1 (Debian))
	id 1C9kiv-0000ws-00
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 15:30:25 +0200
Date: Tue, 21 Sep 2004 15:30:25 +0200
From: lvm@perkamentus.com
Subject: Re: [linux-lvm] Disk partition required for LVM?
Message-ID: <20040921133025.GA3505@perkamentus>
References: <20040921123206.GA1467@perkamentus>
	<20040921130925.GB2625@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040921130925.GB2625@tykepenguin.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Sep 21, 2004 at 02:09:26PM +0100, Patrick Caulfield wrote:
> Check that you don't have a symlink from /dev/hdb to /dev/cdrom. The debian
> lvm.conf file excludes /dev/cdrom from LVM searches.

It was indeed the symlink, although not from hdb to cdrom, but from
cdrom to hdb. Removing this symlink (or commenting out the filter
option in lvm.conf) solved the problem.

CDRom has only been present for installation, and afterwards swapped
for extra disk. Symlink however isn't updated.

Another remark: although cdrom are filtered (and thus not allowed for
LVM), no warning/error messages appear. Wouldn't it be useful if LVM
checks this and shows warning/error messages or even exits during
creation?
