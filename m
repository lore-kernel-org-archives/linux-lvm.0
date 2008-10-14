Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9E8D6eP018172
	for <linux-lvm@redhat.com>; Tue, 14 Oct 2008 04:13:06 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.152])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9E8Ct6G022237
	for <linux-lvm@redhat.com>; Tue, 14 Oct 2008 04:12:55 -0400
Received: by fg-out-1718.google.com with SMTP id e21so1614185fga.7
	for <linux-lvm@redhat.com>; Tue, 14 Oct 2008 01:12:54 -0700 (PDT)
Message-ID: <a01fe36d0810140112q282e12e4xb4e86fb21e361086@mail.gmail.com>
Date: Tue, 14 Oct 2008 10:12:54 +0200
From: "Federico Simoncelli" <federico.simoncelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Clustered snapshots
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
To: Linux LVM2 <linux-lvm@redhat.com>

Hi all,
  I'm trying to use the snapshot feature in a cluster environment but
I keep getting this error:

# lvcreate --size 100M --snapshot --name snap /dev/vg00/lvol1
  Clustered snapshots are not yet supported.

Reading the documentation:

 http://www.redhat.com/docs/manuals/enterprise/RHEL-5-manual/Cluster_Logical_Volume_Manager/snapshot_command.html

"LVM snapshots are not cluster-aware, so they require exclusive access
to a volume. For information on activating logical volumes on
individual nodes in a cluster, see Section 4.8, Activating Logical
Volumes on Individual Nodes in a Cluster."

"To activate logical volumes exclusively on one node, use the lvchange
-aey command."

I followed the instructions above but I get the same result:

# lvchange -aey /dev/vg00/lvol1
# lvcreate --size 100M --snapshot --name snap /dev/vg00/lvol1
  Clustered snapshots are not yet supported.

Looking at the LVM2 code (LVM2.2.02.40, tools/lvcreate.c:640):

/* FIXME Allow exclusive activation. */
if (vg_is_clustered(vg)) {
        log_error("Clustered snapshots are not yet supported.");
        return 0;
}

looks like there is no way to activate a snapshot in a clustered
volume group. Is the documentation wrong?
Is there anyone actively working on the "exclusive activation" FIXME
that is mentioned in the comment?

As a matter of fact I've been able to create a snapshot removing the
cluster flag from the volume group:

# vgchange -cn VolGroup01
  Volume group "VolGroup01" successfully changed
# lvcreate --size 100M --snapshot --name snap /dev/vg00/lvol1
  Logical volume "snap" created

What problem can arise meanwhile the cluster flag is disabled?
Should I just avoid any change to the volume group (lvcreate,
lvextend, etc...) or it might lead to really bad behaviours in any
way?

Thanks in advance,
-- 
Federico.
