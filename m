From: "Bjorn" <programmer@spk.cc>
Subject: SV: SV: [linux-lvm] Getting 200GB ATA133 and Promise Ultra133 to work
Message-ID: <000f01c2c00b$bb546a00$4201a8c0@eagle>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <17119627843.20030119220632@tnonline.net>
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
Date: Sun Jan 19 16:39:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: 'Anders Widman' <andewid@tnonline.net>
Cc: linux-lvm@sistina.com

> 
> No, LVM 1 support big drives. I am using 160GB Maxtor without problems
> with LVM 1 and Promis U133 cards and kernels 2.4.19+.
> 
Did you do any patches (I did those for device mapper found at
www.sistina.com)?
Do I need to flash Promise Ultra ATA/133? There is an update at
www.promise.com, but I wonder if it is necessary for this.

Could it be that the only necessary update is to get LBA48 support in
kernel?

I'll redo my discs tomorrow and depending what is necessary I plan
accordingly.

Thanks for info,
//Bjorn
