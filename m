Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iATF9Ir05721
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2004 10:09:18 -0500
Received: from cheviot2.ncl.ac.uk (root@cheviot2.ncl.ac.uk [128.240.234.82])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iATF9Apd024664
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2004 10:09:16 -0500
Received: from largo.campus.ncl.ac.uk (largo.ncl.ac.uk [128.240.238.3])
	by cheviot2.ncl.ac.uk (8.12.10/8.12.10) with ESMTP id iATF7ptF020194
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2004 15:08:56 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Mon, 29 Nov 2004 15:08:50 -0000
Message-ID: <37E80E80B681A24B8F768D607373CA80010A5454@largo.campus.ncl.ac.uk>
From: "C R Ritson" <C.R.Ritson@newcastle.ac.uk>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Snapshots (overheads and 2.6 kernel status)
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
To: linux-lvm@redhat.com

Does anybody know how much overhead is involved in keeping a snapshot of
an active volume (for 24 hours)? I am currently running LVM1 (waiting
for snapshots in LVM2/device mapper) and am making a snapshot of my user
volumes overnight. These are left available for 24 hours in the hope
that users who damage a file will be able to get "yesterday's copy" from
the snapshot without us needing to restore from tape. There is obviously
some overhead involved, but does anyone know how much?

I guess that the worst case situation is when a file is updated for the
first time that day (an example might be a recompilation, particularly
if the underlying disk is nearly full, so that the blocks released by
removing the object files are quickly reused). In this case, the
original data blocks must be placed into the snapshot cache and the new
data blocks written to disk. Two writes for the price of one.

Perennial question - having had a look at the dm-devel and the lvm2
archives, I cannot find any comments about the status of snapshots in
the 2.6 kernel. Can anyone enlighten me?

Chris Ritson (Computing Officer and School Safety Officer)

Rm 618, Claremont Bridge,       EMAIL: C.R.Ritson@ncl.ac.uk
School of Computing Science,    PHONE: +44 191 222 8175
University of Newcastle,        FAX  : +44 191 222 8232
Newcastle on Tyne, UK NE1 7RU.  http://www.cs.ncl.ac.uk/
