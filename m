From: Ed Tomlinson <tomlins@CAM.ORG>
Date: Sat, 29 Sep 2001 07:37:27 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20010929113728.02CC8AD2A@oscar.casa.dyndns.org>
Subject: [linux-lvm] [BUG] vgscan and removeable scsi disks
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
To: linux-lvm@sistina.com

Hi,

I just had an lvm problem that triggered softdog to reboot my box.  I have a
digital camera and a smartmeadia reader.  Both the camera and the reader can
appear as sbd and/or sda.  Running a vgscan after I have inserted/mounted, 
unmounted/removed these devices can cause vgscan to loop, or worst yet, to
stall the system (and trigger the watchdog code...).

1. Its obvious that vgscan needs better error checking/handling - once it gets
an error it should stop trying the device.

2. It would be a good idea to be able to supply vgscan with a backlist.  ie. 
under no circumstances should it look at sda or sdb on my box.  Think of a box
with a defective drive you cannot replace just yet...

This is with 1.01-rc2 on 2.4.10

Comments?
Ed Tomlinson
