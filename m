From: Rich Turner <rich@storix.com>
Message-Id: <1071881237.1464.14.camel@rich>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] determing lvm support
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
Date: Fri Dec 19 18:49:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

is there any fool proof way of knowing whether or not a system has lvm
support?

right now i determine it this way:

lvm1:
look for "vgcreate" command and
look for "lvm" in /proc/devices or
look for "lvm-mod" in /lib/modules/[release]/kernel/drivers/md/*

lvm2:
look for "vgcreate" command and
look for "device-mapper" in /proc/devices or
look for "dm-mod" in /lib/modules/[release]/kernel/drivers/md/*

i think i am fairly certain with lvm1, but with lvm2 i am not sure if i
have device mapper support and a lvm command that is enough.

any ideas?

rich turner
