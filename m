Message-Id: <3298.213.89.4.172.1016322904.squirrel@192.168.0.253>
From: "Jens Berlips" <jens@berlips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvextend problem
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
Date: Sat Mar 16 17:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello

I have two partitions on a 80gb harddrive.

/dev/hdb1
/dev/hdb2

I have created a VG called store_vg.
$vgcreate store_vg /dev/hdb2
then
$lvcreate -lXXX -nstore_lv store_vg
creating an LV using all space left on hdb2

What I wanted to do next was adding the hdb1
without loosing the data on hdb2.

So I did.
vgextend store_vg /dev/hdb1
then
lvextend -lXXX /dev/store_vg/store_lv /dev/hdb1

But I noticed that this didnt work and when doing a
$ df. I got the same results as before. I guess this has
to do with hdb1 not being formatted (using mkfs.xfs) correctly. When
reformatting the entire LV (extended with hdb1) I got everything to work.
But all data lost.

This was more of a test, so I didn't loose any critical data. But how
should this proceedure be done correctly?

Thanks in advance
Jens Berlips
