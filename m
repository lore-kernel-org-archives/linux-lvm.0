Message-ID: <3636.213.191.82.129.1000409919.squirrel@hactar.dnsalias.net>
Date: Thu, 13 Sep 2001 21:38:39 +0200 (CEST)
From: "Julian Glashoff" <helldog@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] changing LE / PE table
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
To: linux-lvm@sistina.com

Hello,

As I already said, my volume group is not accessible because of a crash
while trying to extend a logical volume. 'vgscan' says 'only found 768 of
769 LEs for LV /dev/vg00/lvol1' and does not find my volume group.
I have not been able to restore the backups with _any_ version of LVM.
So now I am wondering if it is possible to change the 'LE' table while the
volume group is offline.
Is there?

--
Julian Glashoff
<helldog@gmx.net>
