Message-ID: <3EBBF411.6060405@inode.at>
From: Manfred Gschweidl <m.gschweidl@inode.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] mount root filesystem on lvm
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
Date: Fri May  9 13:31:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

hello again,

now i solved the problems with "/dev/mapper/control".

it seems, that the kernel now finds all volumegroups, but now i get a 
kernel panic, that the kernel cannot mount my root filesystem within the 
lvm volumes. the message says, that i should append the correct "root=" 
boot option on startup??

with kernel 2.4.12 and lvm 1.x it was "/dev/progs/root".
now i use kernel 2.4.20 with device-mapper and lvm2.
as with kernel 2.4.12 i use a inital ramdisk.

how can i find out, what now is the correct option for "root="??


thanks for any help again.


manfred
