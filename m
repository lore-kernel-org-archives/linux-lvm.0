Return-Path: <jdiehl@sandia.gov>
Message-ID: <B51F0C636E578A4E832D3958690CD73E0130BF4D@es04snlnt>
From: "Diehl, Jeffrey" <jdiehl@sandia.gov>
Date: Tue, 26 Jun 2001 15:47:49 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Help removing a PV to find stability problem.
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hi all,

I'm having sever filesystem instability problems and am trying to figure out
what is causing it.  I'm running kernel 2.2.18.smp with LVM 0.91.b7 and the
ReiserFS 3.5.31.

If anyone knows a reason why this combination won't play well together,
please let me know.  Otherwise....

I have resized my filesystem and shortened it by about 60G.  Now I need to
figure out how to remove a physical volume from the volume group.  

My intent is to then put an ext2 fs on it and beat on the drive. If the
machine is still stable, my RAID driver is ok.  Then I will put a reiserfs
on it and beat on it again.  If it is still ok, then the the reiserfs is
ok....

I just need to know how to remove a selected PV from a VG.

Thanx in advance,
Mike Diehl,
Network Monitoring Tool Devl.
Sandia National Laboratories.
(505) 284-3137
jdiehl@sandia.gov
