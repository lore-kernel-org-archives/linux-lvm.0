Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1FBb8bq005687
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 06:37:08 -0500
Received: from ulx.hu (ulx.tvnet.hu [195.38.96.124])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1FBahwF017180
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 06:36:46 -0500
Received: from lucy.ulx.hu (lucy [172.16.0.2])
	by ulx.hu (Postfix) with ESMTP id 5B3856AC37
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 12:36:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lucy.ulx.hu (Postfix) with ESMTP id 2AB9C6405D
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 12:36:37 +0100 (CET)
Received: from lucy.ulx.hu ([127.0.0.1])
	by localhost (lucy.ulx.hu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yM5wduWcTcR1 for <linux-lvm@redhat.com>;
	Fri, 15 Feb 2008 12:36:31 +0100 (CET)
Received: from [172.16.1.240] (unknown [172.16.1.240])
	by lucy.ulx.hu (Postfix) with ESMTP id 25D406405C
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 12:36:31 +0100 (CET)
Message-Id: <76EAFFE5-C713-42D4-B6DC-9F63F56C071C@ulx.hu>
From: =?ISO-8859-1?Q?Lajk=F3_Attila?= <Lajko.Attila@ulx.hu>
Mime-Version: 1.0 (Apple Message framework v919.2)
Date: Fri, 15 Feb 2008 12:36:30 +0100
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] mirrored LV + cmirror problem
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"; delsp="yes"
To: linux-lvm@redhat.com

Hello,


I have a problem with clvmd an cmirror:

We have a two nodes cluster (RHEL4.6). I created a mirrored LV on a =20
clustered volume group on 2 iscsi LUNS (VTrak M200i).
When i disconnect one of the LUNs - simulating a storage problem -  =20
the mirrored LV doesn't go to linear mode, the LVM commands (lvs, =20
lvconvert, etc.) get stuck and the GFS file system is not accessible =20
(on both nodes).

What is see in /var/log/messages:

Feb 15 12:29:26 el42 kernel: dm-cmirror: server_complete_resync_work - =20
Setting recovery_halted =3D 1
Feb 15 12:29:26 el42 kernel: dm-cmirror: Log flush failure: -5 -EIO
Feb 15 12:29:26 el42 last message repeated 4 times
Feb 15 12:29:26 el42 kernel: dm-cmirror: Log flush failure: -5 -EIO
Feb 15 12:29:26 el42 kernel: dm-cmirror: Recovery halted due to error =20
on ItlWCmkP
Feb 15 12:29:26 el42 lvm[4929]: WARNING: dev_open(/dev/mapper/mirrp3) =20
called while suspended
Feb 15 12:29:26 el42 kernel: dm-cmirror: LOG INFO:
Feb 15 12:29:26 el42 kernel: dm-cmirror:   uuid: LVM-=20
zEHPYfjtLCL7yqQhsG2kcPzthyLbyBPd7xlok1gd7NHgXR3l2XaVQWEVItlWCmkP
Feb 15 12:29:26 el42 kernel: dm-cmirror:   uuid_ref    : 1
Feb 15 12:29:26 el42 kernel: dm-cmirror:   log type    : disk
Feb 15 12:29:26 el42 kernel: dm-cmirror:  ?region_count: 320
Feb 15 12:29:26 el42 kernel: dm-cmirror:  ?sync_count  : 320
Feb 15 12:29:26 el42 kernel: dm-cmirror:  ?sync_search : 320
Feb 15 12:29:26 el42 kernel: dm-cmirror:   in_sync     : YES
Feb 15 12:29:26 el42 kernel: dm-cmirror:   suspended   : NO
Feb 15 12:29:26 el42 kernel: dm-cmirror:   recovery_halted : YES
Feb 15 12:29:26 el42 kernel: dm-cmirror:   server_id   : 2
Feb 15 12:29:26 el42 kernel: dm-cmirror:   server_valid: YES
Feb 15 12:29:26 el42 kernel: dm-cmirror: cluster_presuspend: recovery =20
halted on ItlWCmkP(1)
Feb 15 12:29:26 el42 kernel: dm-cmirror: cluster_postsuspend
Feb 15 12:29:26 el42 kernel: dm-cmirror: Telling everyone I'm =20
suspending (ItlWCmkP)
Feb 15 12:29:26 el42 kernel: dm-cmirror: LRT_MASTER_LEAVING(13): =20
(ItlWCmkP)
Feb 15 12:29:26 el42 kernel: dm-cmirror:   starter     : 2
Feb 15 12:29:26 el42 kernel: dm-cmirror:   co-ordinator: 0
Feb 15 12:29:26 el42 kernel: dm-cmirror:   node_count  : 0
Feb 15 12:29:26 el42 kernel: dm-cmirror: LRT_MASTER_LEAVING(13): =20
(ItlWCmkP)
Feb 15 12:29:26 el42 kernel: dm-cmirror:   starter     : 2
Feb 15 12:29:26 el42 kernel: dm-cmirror:   co-ordinator: 0
Feb 15 12:29:26 el42 kernel: dm-cmirror:   node_count  : 2
Feb 15 12:29:26 el42 kernel: dm-cmirror: LRT_ELECTION(10): (ItlWCmkP)
Feb 15 12:29:26 el42 kernel: dm-cmirror:   starter     : 2
Feb 15 12:29:26 el42 kernel: dm-cmirror:   co-ordinator: 57005
Feb 15 12:29:26 el42 kernel: dm-cmirror:   node_count  : 0
Feb 15 12:29:26 el42 kernel: dm-cmirror: LRT_ELECTION(10): (ItlWCmkP)
Feb 15 12:29:26 el42 kernel: dm-cmirror:   starter     : 2
Feb 15 12:29:26 el42 lvm[4929]: WARNING: dev_open(/etc/lvm/lvm.conf) =20
called while suspended
Feb 15 12:29:26 el42 kernel: dm-cmirror:   co-ordinator: 1
Feb 15 12:29:26 el42 kernel: dm-cmirror:   node_count  : 2
Feb 15 12:29:26 el42 kernel: dm-cmirror: LRT_SELECTION(11): (ItlWCmkP)
Feb 15 12:29:26 el42 kernel: dm-cmirror:   starter     : 2
Feb 15 12:29:27 el42 kernel: dm-cmirror:   co-ordinator: 1
Feb 15 12:29:27 el42 kernel: dm-cmirror:   node_count  : 2
Feb 15 12:29:27 el42 kernel: dm-cmirror: LRT_MASTER_ASSIGN(12): =20
(ItlWCmkP)
Feb 15 12:29:27 el42 kernel: dm-cmirror:   starter     : 2
Feb 15 12:29:27 el42 kernel: dm-cmirror:   co-ordinator: 1
Feb 15 12:29:27 el42 lvm[4929]: Failed to remove faulty devices in =20
vgtest-lvtest
Feb 15 12:29:27 el42 kernel: dm-cmirror:   node_count  : 1
Feb 15 12:29:27 el42 kernel: dm-cmirror: Suspending now (ItlWCmkP)
Feb 15 12:29:28 el42 lvm[4929]: No longer monitoring mirror device =20
vgtest-lvtest for events

Regards,
Attila Lajk=EF=BF=BD
