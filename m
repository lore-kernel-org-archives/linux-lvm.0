Date: Thu, 20 Sep 2001 23:58:01 -0400
Message-Id: <200109202358.AA1744437478@netcentricnj.com>
Mime-Version: 1.0
From: "tim" <tdwebste@netcentricnj.com>
Subject: [linux-lvm] Volume group not found????
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

It seems I have a similar problem to poor Alexander Bruns.
This whole this is giving me big head heack.

Luckily I only have /usr and /var as logical volumes. So I am still able to boot.

I created logical volume partitions /dev/sda4 /dev/sdb5
Then created stripped lvm's lv_usr and lv_var

Reboot several times and everything worked well.

I see /dev/system/lv_usr, /dev/system/lv_var, /etc/lvmconf/sytem.conf

However vgchange fails
vgchange -a y
vgchange -- no volume groups found


/proc/lvm/VGs/
no logical volumes

How can I recover?


-tim. 
