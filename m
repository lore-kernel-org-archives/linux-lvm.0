From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
Message-Id: <1061222453.29493.30.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Is anyone implementing a Linux equivalent of VSS?
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
Date: Mon Aug 18 11:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@lists.sistina.com

I have just been exposed to Microsoft's new VSS for Win2003.  (This was
public info.)

It is effectively a snapshot manager.

Of course MS did a half-a?? job, but from a conceptual perspective, it
is a good idea.  

Is there a OSS project ongoing to do something similar for Linux?

i.e.

call it SM (Snapshot Manager)

1) all SM aware apps register themselves with SM (typically databases,
etc. that need to quiesce themselves prior to a snapshot taking place.)

2) All "freezeable" Filesystems register with SM.

3) all snapshot capable subsystems register themselves with SM (ie. LVM,
evms, hardware raid controllers, etc.)

4) Backup software issues SM a request to queise all apps.

5) Backup software issues SM a request to freeze all file systems

6) Backup software issues SM a request to create the snapshot

7) Backup software issues SM a request to mount snapshot read-only.

Obviously backup software can do the above today, but it has to have
specialized knowledge of various apps, filesystems, snapshot api's, etc.

Having a single snapshot manager to hide these complexities would be a
great thing for taking Linux furture into main stream IT.

Another nice feature would be a "restore from snapshot" capability in
the SM.

Greg
-- 
Greg Freemyer
