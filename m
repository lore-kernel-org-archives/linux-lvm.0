From: "Howard Clifford" <howardclifford@cablespeed.com>
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAnz/RyKJqskKn5C9pg0fEMsKAAAAQAAAA/K4H7eGabka4k3giSELtYgEAAAAA@cablespeed.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] (no subject)
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
Date: Sun Jun 29 11:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I built a 7 disk vg and put 1 lv on it.  I do not want to mount a file
system.
I just want to write directly to the disk device, /dev/vg1/vol1.

My write performance has an odd behavior.
If after booting I write to the volume I get roughly 175MB/sec.
If after booting I do a mke2fs on the volume, mount it, umount it, then
write to the volume I get roughly 230 MB/sec.

Any ideas?  How can I get top speed without first mounting then
umounting the volume?
By the way, I tried binding a raw device to the lv and got very bad
performance; around 80 MB/sec.  Would that be expected?

(I'm using redhat 9.0 -> lvm-1.0.3-12)

Thanks...
