Message-ID: <3D4E6CE8.94FF79EE@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 2 FAQ questions? but i couldnt find any FAQ :/
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
Date: Mon Aug  5 07:17:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I've got a machine with 4 harddrives. 2*100GB and 2*120GB.
Running hardware raid 1 on a 3ware. That part works.

Until recently the first LVM appeared to be working, or, it does still
work.
How ever, when we added the new raid1, the 2*120GB drives, we didnt get
the full +120GB space. Where is it ??

The other question is:
running pvdisplay on /dev/sda5 says it is available in the PV STATUS
field,
but for /dev/sdb1 it says NOT available. We did run a pvcreate on
/dev/sdb1
and then vgextend. using vgdisplay, it appears to have become 100GB
larger,
but if it is larger, why isnt it available ? We have tried to deactivate
and activate the LVM ?




JonB
