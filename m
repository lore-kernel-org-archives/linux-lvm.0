Subject: Re: [linux-lvm] Cannot mount ext3 snapshot
From: David Johnston <david@littlebald.com>
In-Reply-To: <a06020401bc1894cc95ec@[192.168.10.11]>
References: <a06020401bc1894cc95ec@[192.168.10.11]>
Content-Transfer-Encoding: 7bit
Message-Id: <1072991394.19140.41.camel@grandmother.littlebald.com>
Mime-Version: 1.0
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
Date: Thu Jan  1 15:10:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Wed, 2003-12-31 at 19:44, John Seifarth wrote:
> I've serious problem with snapshots here.
*snip*
> ADDITIONAL TESTS
> dmesg shows
> for ext3 file systems
> EXT3-fs: INFO: recovery required on readonly filesystem

Here's your problem.

Unless you patch things, you have to unmount source ext3 filesystems
before you make snapshots.  Here's some of the relevant code from my
backup script:

SNAPNAME=`date +%j`
fuser -km /home
umount -rl /home
mkdir /snaps/$SNAPNAME
lvcreate --snap --name $SNAPNAME -L 500M /dev/vg00/lv_home
mount /home
mount /dev/vg00/$SNAPNAME /snaps/$SNAPNAME

This section takes under a second to run.

There are patches that should let you get around this, but I've never
tried them.
-- 
David Johnston <david@littlebald.com>
Little Bald Consulting, LLC
