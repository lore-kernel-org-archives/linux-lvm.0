Return-Path: <jan.w@lzer.net>
Date: Wed, 2 May 2001 10:25:51 +0200
From: Jan Walzer <jan.w@lzer.net>
Message-ID: <14345253444.20010502102551@lzer.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] processes remain in D-state,, using lvm, reiserfs and VIA-Board kernel 2.4.2+
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
To: reiserfs-list@namesys.com, linux-lvm@sistina.com, linux-kernel@vger.kernel.og

Hello people,

<short story>
using LVM and reiserfs on an disk connected on an VIA-Promise
controler, leaves different processes in D-state when accessing some
directories on this disk.
This is since kernel 2.4.2 until now on kernel 2.4.4-ac1
The disk then is 'busy' and can't be umounted, so there is no clean
way to reboot the system. sometimes even SysReq-S,SysReq-U won't
umount, stopping on the LVM-Device.
</short story>

<long story>
I don't know where to start.
My company gave me the job to care for the server in our new office. I
was told only to look for it a bit. They already had it configured.

It's an Athlon1,2GHz on an ASUS board with VIA and an Promise-IDE
controller. Filesystem was on an IBM 30GB-SCSI disk, connected to an
Adaptec. 1024MB-ram

The "best"-thing: One BIG '/'-partition, where nearly all the data is
stored on ... yeah these guys were good.
As they already made it ready, they rsynced the data of their server
in the old office with this one. so there are 'bout 20GB data on the
disk, meaning only having 6GB left.

No Problems so far, except for power failures, when it needs to fsck
the whole disk.

3weeks ago I got an 40MB-Maxtor-IDE for moving parts of the data on
it. I connected it to the Promise that is onboard. I decided, to do
it better than them, and create an LVM. I ended in having 2 LVs on
the disk, using Reiser. All seems to work well, except, for the told
problem.

</long story>

Is there a probleme like this known?
What further informations do you need ? - I'll try to support as much
information, as I can.

  

-- 

 ,',    Jan Walzer      \V/  http://wa.lzer.net     ,',
',','   student of      >|<  mailto:jan.w@lzer.net ',','
  '   ComputerScience   /A\  +49-177-7403863         '
