Message-Id: <200201201741.g0KHfEX13025@in-cadcae4.ing.temic.de>
From: Emanuel Quass <emanuel.quass@temic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Subject: [linux-lvm] ERROR "parameter error" setting up snapshot copy on write
 exception table
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
Date: Sun Jan 20 11:41:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi

I had a very strange error on our Linux-server! Maybe someone can help me because it's our production server.
I rebooted the Server and afterwards  I had an error like:

vgchange -- ERROR "parameter error" setting up snapshot copy on write exception table for "/dev/datenvg/mailsnap"

I use a 2.4.17 kernel with lvm-1.0.1 I just upgraded from 2.4.9 with "LVM version 1.0.1-rc2(30/08/2001)" (thats whats written inside the module)

There are 2 logical columes inside "/dev/datenvg" 1. daten 2. mail and of the second lv I made a snapshot.
After the reboot ..... (see above) 

Is there a chance of getting the data back?

Thanks in advance

	Emanuel Quass
