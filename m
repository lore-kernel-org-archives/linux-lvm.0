Return-Path: <mike@marxmeier.com>
Message-Id: <200012141314.OAA23601@e35.marxmeier.com>
Subject: Re: [linux-lvm] LVM and inactive snapshots.
Date: Thu, 14 Dec 2000 14:14:57 MEZ
In-Reply-To: <Pine.OSF.4.21.0012132236390.7029-100000@lazy.accessus.net>; from "Jay Weber" at Dec 13, 100 10:46 pm
From: Michael Marxmeier <mike@marxmeier.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> Given the above I'm curious as to how others view this behaviour.  I'm
> thinking along the lines of:  If the snapshot goes inactive and it's
> portrayal of the filesystem is no longer valid it should go away. Go away
> meaning, if an inactive snapshot volume is currently mounted possibly we
> should forcefully unmount it as well as cleaning up it's device node
> entries and removing it as a block device.
> 
> Does that seem proper?

No. The kernel should not unmount because this may cause
confusion and possibly corruption of user mode information
(eg. /etc/mtab).

If a snapshot is dead the kernel could simply return an error
(EIO?) for any access to the snapshot (which no longer exists).
So the bahaviour would be well defined.


Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
