Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8PFGCV27110
	for <linux-lvm@redhat.com>; Sun, 25 Sep 2005 11:16:12 -0400
Received: from out002.atlarge.net (exchsvc-01.atlarge.net [129.41.63.60] (may
	be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8PFG7rC014037
	for <linux-lvm@redhat.com>; Sun, 25 Sep 2005 11:16:11 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Sun, 25 Sep 2005 10:15:57 -0500
Message-ID: <D3DC8F9206F0D24085E459720ECDF3ED693EFF@mail-18ps.atlarge.net>
From: "Don Shesnicky" <don.shesnicky@liquidcomputing.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM Status?
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
To: linux-lvm@redhat.com


How do you check the status of an LVM set of disks in RHEL3 and 4?
The LVM FAQ mentions that you should have a /proc/lvm but my default
RHEL3 and 4 systems do not have this directory in /proc and doing a
Modprobe for lvm-mod does not create one. On an RHEL4 test system I
do see an lvm tool but it doesn't show the status. 

Is there a page for the redhat archives?

Don


From the LVM FAQ:

"If your kernel was compiled with the /proc file system (most are) then
you
can verify that LVM is present by looking for a /proc/lvm directory. If
this
doesn't exist then you may have to load the module with the command
 # modprobe lvm-mod 

<snip>
