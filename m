From: Skliarouk Arie <arie@tkos.co.il>
Message-ID: <Pine.LNX.4.33.0212251120380.23863-100000@steam.tkos.co.il>
MIME-Version: 1.0
Subject: [linux-lvm] LVM disk problem
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
Date: Wed Dec 25 03:22:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello All,

An computer has LVM installed.

The physical volume where an LV is residing developed several bad sectors.

reiserfsck does not (yet) have flag of checking,detecting and marking bad
sectors on disk as such.

Is there a way to tell to LVM to scan the physical volume and mark stripes
(mine are 8MB each) that have bad blocks as unusable ones and move the
stripes to other areas of the disk?

---
Bye,  | Fax: (972)-2-6796453
Arieh | Phone: (972)-6795364
