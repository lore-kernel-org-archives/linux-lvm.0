Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4U8hmj9024606
	for <linux-lvm@redhat.com>; Fri, 30 May 2008 04:43:48 -0400
Received: from g1t0028.austin.hp.com (g1t0028.austin.hp.com [15.216.28.35])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4U8hZWu013253
	for <linux-lvm@redhat.com>; Fri, 30 May 2008 04:43:35 -0400
Received: from hppinf00.gbr.hp.com (unknown [16.25.249.33])
	by g1t0028.austin.hp.com (Postfix) with ESMTP id 24A492C01E
	for <linux-lvm@redhat.com>; Fri, 30 May 2008 08:43:28 +0000 (UTC)
Received: from hppine99.gbr.hp.com (hppine99.gbr.hp.com [16.25.249.62])
	by hppinf00.gbr.hp.com (8.11.1 (PHNE_35951)/8.11.1 SMKit7.05) with
	ESMTP id m4U8hRm21625
	for <linux-lvm@redhat.com>; Fri, 30 May 2008 09:43:28 +0100 (BST)
Subject: Re: [linux-lvm] Veritas/Symantec Backup Exec Remote Agent prevents
	removal of LVM snapshot
From: Darren Lavender <dl1@hppine99.gbr.hp.com>
In-Reply-To: <7a65a83a0805290913v51e3f230s1f2f0aa80de9ad30@mail.gmail.com>
References: <7a65a83a0805290913v51e3f230s1f2f0aa80de9ad30@mail.gmail.com>
Date: Fri, 30 May 2008 09:41:26 +0100
Message-Id: <1212136886.17640.83.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

.......
> Well, it turns out that the solution is to stop the Veritas/Symantec
> Backup Exec Remote Agent client with:
> 
> /etc/init.d/VRTSralus.init stop
> 
> Why? I have no idea. Veritas never touches any of the LVM volumes and
> it wasn't even communicating with the backup server. It's basically
> just listening for connections.
> 
> RALUS is version 11.00.7170.
> 
> I have an strace of the failing lvremove call, an lvmdump and an sos
> report. If any of these would be useful, let me know. I didn't want to
> just post them to the list.
> 
> I'll probably file this with Symantec as well.

I worked a case a few months back where there was a problem
de-activating a VG, the root cause was down to processes named
'beremote' keeping device nodes open.  The 'beremote' process appears to
be part of "Symantec Backup Exec Remote Agent for Linux and Unix
Servers".


I had a vmcore of the system to analyse which showed:

o the device open_count for the mapped device was non-zero (ie it was
  open)

o that a look at open files showed 'beremote' tasks with open BLK type
  devices in /tmp, eg:

crash> foreach files | egrep 'PID:|ROOT:|BLK' | more
........

PID: 3876   TASK: ffff81039da01850  CPU: 0   COMMAND: "beremote"
ROOT: /    CWD: /
 FD       FILE            DENTRY           INODE       TYPE PATH
  6 ffff810380f426c0 ffff810358820b10 ffff81033d2ec118 BLK  /tmp/fileKN4NsN
  9 ffff81037d015980 ffff810339b232f0 ffff810338d9d758 BLK  /tmp/filekecLvK
 10 ffff8103a0fbc4c0 ffff81033b25bf20 ffff810335416438 BLK  /tmp/filefHpLoO
 11 ffff81038936dec0 ffff81033a1d7a40 ffff810337ef6758 BLK  /tmp/fileTSfX1S
 12 ffff81036a0e4180 ffff81032ac27a40 ffff81032b0bb438 BLK  /tmp/fileJau26E
 13 ffff8103830e00c0 ffff8101ee4d9cb0 ffff8101ee4dca78 BLK  /tmp/fileMpULoP
PID: 4011   TASK: ffff81039e530810  CPU: 2   COMMAND: "bond"
ROOT: /    CWD: /
PID: 4096   TASK: ffff81039dd8f0c0  CPU: 1   COMMAND: "beremote"
ROOT: /    CWD: /
  6 ffff810380f426c0 ffff810358820b10 ffff81033d2ec118 BLK  /tmp/fileKN4NsN
  9 ffff81037d015980 ffff810339b232f0 ffff810338d9d758 BLK  /tmp/filekecLvK
 10 ffff8103a0fbc4c0 ffff81033b25bf20 ffff810335416438 BLK  /tmp/filefHpLoO
 11 ffff81038936dec0 ffff81033a1d7a40 ffff810337ef6758 BLK  /tmp/fileTSfX1S
 12 ffff81036a0e4180 ffff81032ac27a40 ffff81032b0bb438 BLK  /tmp/fileJau26E
 13 ffff8103830e00c0 ffff8101ee4d9cb0 ffff8101ee4dca78 BLK  /tmp/fileMpULoP
PID: 4097   TASK: ffff8103a1c48100  CPU: 0   COMMAND: "beremote"
ROOT: /    CWD: /
  6 ffff810380f426c0 ffff810358820b10 ffff81033d2ec118 BLK  /tmp/fileKN4NsN
  9 ffff81037d015980 ffff810339b232f0 ffff810338d9d758 BLK  /tmp/filekecLvK
 10 ffff8103a0fbc4c0 ffff81033b25bf20 ffff810335416438 BLK  /tmp/filefHpLoO
 11 ffff81038936dec0 ffff81033a1d7a40 ffff810337ef6758 BLK  /tmp/fileTSfX1S
 12 ffff81036a0e4180 ffff81032ac27a40 ffff81032b0bb438 BLK  /tmp/fileJau26E
 13 ffff8103830e00c0 ffff8101ee4d9cb0 ffff8101ee4dca78 BLK  /tmp/fileMpULoP




You should be able to use lsof to confirm this too. However you'll want
to do something like:

o lsof | grep BLK 

_AND_NOT_

o lsof | grep dev

Simply because the device files are created in /tmp, not under /dev.  As
for what these tasks do in the grand scheme of things, I've no idea, you
would have to ask Symantec!

Good luck!


-- 
Darren Lavender <dl1@hppine99.gbr.hp.com>
