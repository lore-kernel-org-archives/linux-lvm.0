Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8M31Zr05415
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 23:01:35 -0400
Received: from host1.appws.com ([216.136.72.3])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i8M31TSZ023116
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 23:01:29 -0400
Received: from grandmother.littlebald.com (localhost.localdomain [127.0.0.1])
	by grandmother.littlebald.com (8.12.8/8.12.8) with ESMTP id
	i8M31L85021245
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 23:01:21 -0400
Received: (from david@localhost)
	by grandmother.littlebald.com (8.12.8/8.12.8/Submit) id i8M31Kl0021243
	for linux-lvm@redhat.com; Tue, 21 Sep 2004 23:01:20 -0400
Subject: Re: [linux-lvm] Disk partition required for LVM?
From: David Johnston <david@littlebald.com>
In-Reply-To: <20040921133025.GA3505@perkamentus>
References: <20040921123206.GA1467@perkamentus>
	<20040921130925.GB2625@tykepenguin.com>
	<20040921133025.GA3505@perkamentus>
Content-Transfer-Encoding: 7bit
Message-Id: <1095822080.21107.5.camel@grandmother.littlebald.com>
Mime-Version: 1.0
Date: Tue, 21 Sep 2004 23:01:20 -0400
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2004-09-21 at 09:30, lvm@perkamentus.com wrote:
> On Tue, Sep 21, 2004 at 02:09:26PM +0100, Patrick Caulfield wrote:
> > Check that you don't have a symlink from /dev/hdb to /dev/cdrom. The debian
> > lvm.conf file excludes /dev/cdrom from LVM searches.
> 
> It was indeed the symlink, although not from hdb to cdrom, but from
> cdrom to hdb. Removing this symlink (or commenting out the filter
> option in lvm.conf) solved the problem.
> 
> CDRom has only been present for installation, and afterwards swapped
> for extra disk. Symlink however isn't updated.
> 
> Another remark: although cdrom are filtered (and thus not allowed for
> LVM), no warning/error messages appear. Wouldn't it be useful if LVM
> checks this and shows warning/error messages or even exits during
> creation?

Not really.  Consider users who use multipath; they have to filter or
they'll see the same PV over and over and over again.  A reference in
the docs *would* help, as would a debug message in syslog (debug so it
only shows if we're looking for problems).
-- 
David Johnston <david@littlebald.com>
Little Bald Consulting, LLC
