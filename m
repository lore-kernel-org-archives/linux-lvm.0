Message-ID: <3BD849C6.7060308@gmx.de>
From: Jens Tkotz <jens.tkotz@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvm und promise fasttrack
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
Date: Thu Oct 25 12:19:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Linux-LVM@Sistina.com

Hallo Heinz,

ich hab schon wieder ein "Problem".

Auf meinem Mainboard ist ein Promise Fasttrack 100 Controller.
Die Festplatten kann ich �ber /dev/hd[e-h] ansprechen.

Es gibt aber auch die M�glichkeit das Hardware Raid anzuspechen �ber
/dev/ataraid/d[0-2]px , mit x als Partitionsnummer.

Beim Aufruf von vgcreate passiert folgendes :
vgcreate gl_lvm /dev/ataraid/d0p1
vgcreate -- physical volume name "/dev/ataraid/d0p1" is invalid

Gr��e,

Jens
