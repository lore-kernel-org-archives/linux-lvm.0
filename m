From: Dirk Heinrichs <heinrichs@qis-systemhaus.de>
Subject: Re: [linux-lvm] Red Hat upgrade over existing LVM
In-Reply-To: <3CAE9F23.3C58CB1E@vtc.edu.hk>
Message-Id: <Pine.LNX.4.44.0204080856110.21508-100000@momo.office.qis>
MIME-Version: 1.0
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
Date: Mon Apr  8 02:07:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM <linux-lvm@sistina.com>

On Sat, 6 Apr 2002, Nick Urbanik wrote:

> Dear team,
>
> We have a number of servers with /usr and /var on LVM.  The difficulty
> arises when upgrading from one version of Red Hat to another; the
> installation disks do not recognise the logical volumes.
>
> Do any of you have any reasonable approach to solving this?  Do I need
> to create a new network installation boot disk with a small kernel with
> support for LVM and scripts to turn on LVM groups?
Why do all people think they need to reboot the maschine to upgrade
software? This is not NT :-)

Switch to runlevel 1 (may be optional), mount the CD and use rpm -F (or
-U).

Bye...

	Dirk
-- 
Dirk Heinrichs          | Tel:  +49 (0)241 413 260
Configuration Manager   | Fax:  +49 (0)241 413 2640
QIS Systemhaus GmbH     | Mail: dheinrichs@qis-systemhaus.de
Juelicher Str. 338      | Web:  http://www.qis-systemhaus.de
D-52070 Aachen          | ICQ#: 110037733
