Message-ID: <F888C30C3021D411B9DA00B0D0209BE804C59CC2@cvo-exchange.cvo.roguewave.com>
From: John Celoria <celoria@roguewave.com>
MIME-Version: 1.0
Subject: [linux-lvm] /dev/mapper/control: open failed: No such device
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
Date: Fri Jan  9 15:58:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hello, 

I am upgrading from 2.4.23/LVM1 to 2.6.0 and have run into a bit of an
issue.
I built the device-mapper support into the kernel statically... 

I converted the volumes:	vgconvert <vol>
I ran vgscan and got the following:
  Reading all physical volumes.  This may take a while...
  Found volume group "vol1" using metadata type lvm2
  Found volume group "vol0" using metadata type lvm2

I am not using devfs of course so I ran ./devmap_mknod.sh
device-mapper kernel module not loaded: can't create /dev/mapper/control.

I compiled device-mapper support in statically but the entries in /proc do
not exist?

What did I do wrong? more importantly... is it recoverable?

I thank anyone who can possibly shed some light on this for me.

______________________________________
John Celoria <celoria@roguewave.com>  
Unix Administrator; Rogue Wave/Quovadx 
