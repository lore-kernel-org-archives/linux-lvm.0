Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m61LBFYh015866
	for <linux-lvm@redhat.com>; Tue, 1 Jul 2008 17:11:15 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.245])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m61LAw9K008831
	for <linux-lvm@redhat.com>; Tue, 1 Jul 2008 17:10:58 -0400
Received: by an-out-0708.google.com with SMTP id d31so15517and.124
	for <linux-lvm@redhat.com>; Tue, 01 Jul 2008 14:10:58 -0700 (PDT)
Message-ID: <a9e5040807011410q485a3a4bkebe7c684301b865d@mail.gmail.com>
Date: Tue, 1 Jul 2008 17:10:57 -0400
From: "Rob West" <robertfwest@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_13526_10068341.1214946657705"
Subject: [linux-lvm] Is it possible to invalidate snapshots other than by
	overfilling?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_13526_10068341.1214946657705
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Does anyone know of ways that snapshots can become invalid other than by
writing more to the origin than the COW device can hold?

The reason I ask is that we're having cases where a snapshot is becoming
invalid, but we are very skeptical that it is due to overfilling. The size
of the origin is 83G, and the size of the snapshot is 8G.

Here's what little we can tell from the logs:
1. Backup script creates a snapshot and starts copying data from it.
2. Before backup is finished (and thus, snapshot removed), the user reboots.
3. On reboot, we get the following message which seems to be normal for this
kernel:
    kernel: device-mapper: table: 253:2: snapshot-origin: unknown target
type
4. About 23 hours later, the backup script tries to create the snapshot
again but fails b/c it's still there.
5. The backup script tries to clean up by removing the snapshot, but
lvremove causes a kernel oops because the snapshot is invalid. (We have
identified a potential patch for this, but are trying to figure out why the
snapshot was invalid in the first place.)

The kernel we're using is based off of Fedora 6 (2.6.18-1.2849).

Not sure whether it matters, but device-mapper is version 1.02.07 release
4.0.RHEL4 and lvm2 is version 2.02.06 release 6.0.RHEL4.


Thanks for any help,
Rob

------=_Part_13526_10068341.1214946657705
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Does anyone know of ways that snapshots can become invalid other than by writing more to the origin than the COW device can hold?<br><br>The reason I ask is that we&#39;re having cases where a snapshot is becoming invalid, but we are very skeptical that it is due to overfilling. The size of the origin is 83G, and the size of the snapshot is 8G.<br>
<br>Here&#39;s what little we can tell from the logs:<br>1. Backup script creates a snapshot and starts copying data from it.<br>2. Before backup is finished (and thus, snapshot removed), the user reboots.<br>3. On reboot, we get the following message which seems to be normal for this kernel:<br>
&nbsp;&nbsp;&nbsp; kernel: device-mapper: table: 253:2: snapshot-origin: unknown target type<br>4. About 23 hours later, the backup script tries to create the snapshot again but fails b/c it&#39;s still there.<br>5. The backup script tries to clean up by removing the snapshot, but lvremove causes a kernel oops because the snapshot is invalid. (We have identified a potential patch for this, but are trying to figure out why the snapshot was invalid in the first place.)<br>
<br>The kernel we&#39;re using is based off of Fedora 6 (2.6.18-1.2849).<br><br>Not sure whether it matters, but device-mapper is version 1.02.07 release 4.0.RHEL4 and lvm2 is version 2.02.06 release 6.0.RHEL4.<br><br><br>
Thanks for any help,<br>Rob<br>

------=_Part_13526_10068341.1214946657705--
