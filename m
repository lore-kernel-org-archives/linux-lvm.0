From: Sander <boeraa@wanadoo.nl>
Message-ID: <741040257.20020608190642@wanadoo.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvextend: Different structure size (while using e2fsadm)
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
Date: Sat Jun  8 12:07:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM <linux-lvm@sistina.com>

Hi,

While trying to enlarge an ext2 filesystem on a logical volume with
e2fsadm, lvextend complains about a different structure size.
If I just extend the volume it doesn't complain.

Anyone ever seen this before?

Using kernel 2.4.18 (LVM support compiled in), LVM 1.0.4

-- 

Sander
