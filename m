Message-Id: <02c801c1b73b$342862e0$0100a8c0@adhoc.ee>
From: "Liivo" <liivo@nnm.ee>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] migrating LVM from non-RAID to RAID-1
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
Date: Sat Feb 16 16:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

I've Linux with following setup:

/dev/hde - 40G
/dev/hdg - 40G
...and both are identical at HW level.
hde[1-3] are in mirror with hdg[1-3]
hdx1=md0    -    /boot
hdx2=md1    -    swap
hdx3=md2    -    /

hde4 and hdg4 are Linux extended.

hde[5-12] are LVM PVs making up one VG "vg" and includes about 7 LVs

hdg5 is single LVM partition (~38G).

Goal is to have current LVs and VG residing on PV /dev/md3, which consists
of /dev/hde5 and /dev/hdg5 (raid-1).

So, how to do that, any advices? I can't find out how, because: I have to
create /dev/md3 using the same sized partitions, but I have hdg5 38G and
hde5 about 4G, hde6 about 8G etc. sum of hde[5-12] is 38G. How can I merge
these LVM's PV partitions without losing data in VG?

If the previous one is to be done somehow, then the tricky part is how to
tell LVM that "ok, right now I'm using hde[5-12] as PVs, but after reboot
use md3 as PVs for the same VG"?

Thanks in advance,
Liivo.
