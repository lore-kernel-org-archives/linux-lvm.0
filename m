Message-ID: <3E5B382B.2090908@conterra.de>
From: Dieter Stueken <stueken@conterra.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] pv_move failed
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
Date: Tue Feb 25 03:33:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@sistina.com

I just got my new 240GB disk and want to move my VG to it.
Unfortunately I get an unexpected error:

lv: /dev/backup/mirror[2]  old_dev: 22:00  new_dev: 03:02
old_pe_sector: 117703032  new_pe_sector: 357564792
pvmove -- opening output physical volume "/dev/hda2"
pvmove -- llseeking input physical volume "/dev/hdc"
pvmove -- llseeking output physical volume "/dev/hda2"
pvmove -- /dev/hdc [PE 897 [mirror [LE 2727]] -> /dev/hda2 [PE 2727] [1/247]
pvmove -- locking physical extent 897 of "/dev/hdc" in kernel
pvmove -- about to read input physical volume "/dev/hdc" and to write
output physical volume "/dev/hda2"
pvmove -- ERROR writing output physical volume "/dev/hda2" (still
12648448 bytes to write)
pvmove -- ERROR "pv_move_pe(): writing output PE" moving physical extents

this time I can not identify any reason an no messages on syslog.
Any idea? What informations should I dump/post in addition?

I'm using SuSE8.1 with kernel 2.4.20, the LVM-version is 1.0.5.

... and, sorry for my ill formed subject line from last week.

Dieter
-- 
Dieter St�ken, con terra GmbH, M�nster
     stueken@conterra.de
     http://www.conterra.de/
     (0)251-7474-501
