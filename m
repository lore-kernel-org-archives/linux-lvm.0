Message-ID: <3F678DA8.9010203@gbrmpa.gov.au>
From: Glen Harris <glen@gbrmpa.gov.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Single snapshots do weird things?
References: <3F663873.6070008@gbrmpa.gov.au> <20030915233257.E2155@uk.sistina.com> <3F66474F.9070106@gbrmpa.gov.au> <20030916131154.G2155@uk.sistina.com>
In-Reply-To: <20030916131154.G2155@uk.sistina.com>
Content-Transfer-Encoding: 7bit
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
Date: Tue Sep 16 17:26:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Alasdair G Kergon wrote:
 > On Tue, Sep 16, 2003 at 09:12:15AM +1000, Glen Harris wrote:
 >
 >>Is it mandatory to sync the filesystem before taking a snapshot?
 >
 >
 > If you want the snapshot to be consistent: that's what the VFS lock patch
 > attempts to do automatically whenever you take a snapshot: presumably you
 > haven't applied that patch?
 >
 > Alasdair

Yes, I applied linux-2.4.21-VFS-lock.patch as well as the devmapper patch.
The behaviour is reproducable, I just did it again:

lvm:~# mount /dev/vg0/lv0 fs
[Several files/dirs exist, but not device-mapper.1.00.05.tgz]

lvm:~# lvcreate -s -L 8m --n snap0 /dev/vg0/lv0
lvm:~# mount /dev/vg0/snap0 snap/0
[Not there yet!]

lvm:~# cp /usr/src/device-mapper.1.00.05.tgz fs
lvm:~# lvcreate -s -L 8m --n snap1 /dev/vg0/lv0
lvm:~# mount /dev/vg0/snap1 snap/1
[Does *not* exist in the mounted snapshot filesystem]

lvm:~# sync
lvm:~# lvcreate -s -L 8m --n snap2 /dev/vg0/lv0
lvm:~# mount /dev/vg0/snap2 snap/2
[Ahhh! Now it exists in *this* mounted snapshot filesystem!]

Oh, and after the file appears in the final snapshot, it doesn't magically
appear in the previous one.

glen.

-- 
| Nine megs for the secretaries fair,      | One disk to rule them all,     |
| Seven megs for the hackers scarce,       | One disk to bind them,         |
| Five megs for the grads in smoky lairs,  | One disk to hold the files     |
| Three megs for system source;            | And in the darkness grind 'em. |
-----------------------------------------------------------------------------
| Glen Harris | glen@gbrmpa.gov.au | 07 47500893 | http://www.gbrmpa.gov.au |
-----------------------------------------------------------------------------

=============================================================================
If you have received this transmission in error please notify us immediately
by return email and delete all copies. Any unauthorised use, disclosure or
distribution of this email is prohibited.
=============================================================================
