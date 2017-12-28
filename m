From: Eric Ren <zren@suse.com>
Message-ID: <f1be22d0-6bf3-e282-9692-92452f67122d@suse.com>
Date: Thu, 28 Dec 2017 18:42:07 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: [linux-lvm] lvmlockd: about the limitation on lvresizing the LV
 active on multiple nodes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi David,

I see there is a limitation on lvesizing the LV active on multiple node. 
From `man lvmlockd`:

"""
limitations of lockd VGs
...
* resizing an LV that is active in the shared mode on multiple hosts
"""

It seems a big limitation to use lvmlockd in cluster:

"""
c1-n1:~ # lvresize -L-1G vg1/lv1
   WARNING: Reducing active logical volume to 1.00 GiB.
   THIS MAY DESTROY YOUR DATA (filesystem etc.)
Do you really want to reduce vg1/lv1? [y/n]: y
   LV is already locked with incompatible mode: vg1/lv1
"""

Node "c1-n1" is the last node having vg1/lv1 active on it.
Can we change the lock mode from "shared" to "exclusive" to
lvresize without having to deactivate the LV on the last node?

It will reduce the availability if we have to deactivate LV on all
nodes to resize. Is there plan to eliminate this limitation in the
near future?

Regards,
Eric
