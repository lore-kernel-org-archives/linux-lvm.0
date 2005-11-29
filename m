Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jATIhOV22138
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 13:43:24 -0500
Received: from facstaff.amherst.edu (mailf2.amherst.edu [148.85.136.79])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jATIhJ9G016986
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 13:43:19 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Enterprise Backup Software with good support for LVM
Date: Tue, 29 Nov 2005 13:43:17 -0500
Message-ID: <0456A130F613AD459887FF012652963F33EB75@mail7.amherst.edu>
From: "Steffen Plotner" <swplotner@amherst.edu>
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

I would like to add that creating backups of LVM snapshots is sensible,
as the data is in a crash-consistent state. Today's operating systems
can definitely handle this type of state. I have developed scripts that
effectively netcat contents from LVM snapshots to a remote machine
(either into another logical volume or simply a file). 

Steffen 

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Michael Loftis
Sent: Tuesday, November 29, 2005 1:29 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Enterprise Backup Software with good support
for LVM



--On November 29, 2005 12:03:39 PM -0600 Mark F <mfaine@knology.net>
wrote:

> Could someone suggest an Enterprise Backup package that has good 
> support for LVM (LVM2 in this case) on Linux (Specifically Suse Linux 
> Enterprise
> 9) Most products I've seen say they support block level backups but 
> don't specifically say they support LVM.

LVM provides a block level device.  However you don't want to back up
there anyway, you'll just end up with corrupt garbage.  You need to back
up at the filesystem level unless you're using your LVM LVs for Oracle
or something similar in which case the backup software needs to support
that by putting Oracle or the related application into the correct hot
backup mode before attempting to directly read the LVM data, as well as
backing up the transaction/redo logs.


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
