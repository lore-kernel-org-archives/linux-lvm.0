Message-ID: <64662.64.34.222.41.1003857491.squirrel@webmail.tekmd.com>
From: <gdurand@tekmd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] badiane: problem with LVM
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
Date: Tue Oct 23 12:15:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have compiled kernel 2.4.12 with LVM enabled on Debian.  Upon reboot and
having created a partition hda5 with cfdisk, I ran pvcreate on /dev/hda5 and
received
malloc error in vg_check_active.c [line 76]
pvcreate -- invalid i/o protocol version

Can someone offer any help?

Let me know if there is any additional information needed.

Badiane
