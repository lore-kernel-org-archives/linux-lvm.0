From: Magnus Sandberg <magnus@switchbeat.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1035675002.11490.15.camel@sleep>
Mime-Version: 1.0
Subject: [linux-lvm] lvscan and df result differs
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
Date: Sat Oct 26 18:31:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have just installed lvm on my debian testing server.

I have finally managed to create a PV on a maxtor 
120G disk, the 'pvcreate' command complained about 
a partitiontable being present even if there is no 
table there.
--8<--
server:~# pvcreate --version
pvcreate: Logical Volume Manager 1.0.4
Heinz Mauelshagen, Sistina Software  02/05/2002 (IOP 10)
--8<--
I managed to get around that by using a v2 lvm command.
Is there a bug in 1.0.x's pvcreate?

I have also managed to create a VG a and a LV and that
seems to work. I have formatted the LV with ext3 and now
the strange thing is that lvscan reports:
--8<--
server:~# lvscan 
lvscan -- ACTIVE            "/dev/vg/lg" [114.49 GB]
lvscan -- 1 logical volumes with 114.49 GB total in 1 volume group
lvscan -- 1 active logical volumes
--8<--
But when using the filesystem df reports:
--8<--
Filesystem             Size   Used  Avail Use% Mounted on
/dev/hde1             123GB  121GB  2.4GB  99% /store
/dev/vg/lg            122GB  121GB      0 100% /store2
--8<--

/dev/hde1 is also a 120G disk but with resierfs, ext3
takeing up more size is probably normal. But the actual
size on the lvm is 122G and as you can see I can fit 
121G on the disk, so why is lvscan reporting ~115G? 
Can i safetly use my lvm setup without running the risk
of losing data?


Thanks,

/Magnus
