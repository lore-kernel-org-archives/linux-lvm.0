From: "Erick Calder" <e@arix.com>
Message-ID: <00a601c3b619$479bdb20$c900a8c0@mithrandir>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: 
Subject: [linux-lvm] block-major-43
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
Date: Fri Nov 28 19:49:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I've installed 1.0.8 on a RH9 box.  the INSTALL says to either add:

      alias block-major-58      lvm-mod
      alias char-major-109      lvm-mod

to the modules.conf, however after I added those lines to the file, without
rebooting I do a vgscan and get in /var/log/messages:

Nov 28 17:44:17 beowulf kernel: lvm -- Module successfully deactivated
Nov 28 17:44:32 beowulf kernel: LVM version 1.0.5+(22/07/2002) module loaded
Nov 28 17:44:32 beowulf modprobe: modprobe: Can't locate module
block-major-43

vgscan then dumps core.

wtf?

- e
