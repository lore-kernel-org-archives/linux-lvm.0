From: Jim King <jrk@mipl.jpl.nasa.gov>
Content-Transfer-Encoding: 7bit
Message-Id: <1036105045.10397.68.camel@theory.jpl.nasa.gov>
Mime-Version: 1.0
Subject: [linux-lvm] e2fsadm and snapshots?
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
Date: Thu Oct 31 16:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I'm trying to set up snapshots on my LVM volumes sort of like the way
Network Appliance does it... with hourly rotating snapshots. The obvious
problem is that the snapshots do not dynamically size. This is a real
issue, because snapshots no longer protect us from someone (for example)
deleting a huge directory accidently.

To solve that I'm trying to figure a way to have them dynamically size
-- with a script that checks how full they are and grows them
automatically if they start to fill up.

Problem:
--------
If I do e2fsadm on a normal LVM volume it works, but if I do e2fsadm on
a snapshot I get something like:

  /sbin/e2fsck: Permission denied while trying to open
     /dev/data1/.mer_dev.hourly.3
  You must have r/w access to the filesystem or be root

Now I'm logged in as root, and the filesystem is unmounted. Ideas? I'm
suspecting it's because the snapshot is ro, but is there a way to work
around this?



In the long run it would be better to have them just dynamically size
without intervention, but obviously that's not a feature yet.


-- 
------------------------------------------------------
Jim King
Multimission Image Processing Lab  (MIPL) Engineering Group
Science Data Processing Systems Section,  Jet Propulsion Lab
James.King@jpl.nasa.gov  
------------------------------------------------------
