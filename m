Message-ID: <34774.213.39.188.204.1063753077.squirrel@www.somesite.de>
From: "Florian Hinzmann" <f.hinzmann@hamburg.de>
MIME-Version: 1.0
Subject: [linux-lvm] Using VG with one disk missing
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
Date: Tue Sep 16 17:58:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello!

Kind of FAQ possibly, but I read several mails from the
list archives, but did not make it yet.


Situation:
- machine with four harddisks, running "Debian testing"
- conventional root partition - all other partitions LVs
- one VG, several LVs inside  (/usr, /var, /home, ...)
- PVs, VGs and LVs have been created, changed, expanded
  and used with LVM v1.0.x
- machine running with kernel 2.4.21 (LVM compiled in)
  normally

Some days ago one harddisk died, afterwards I did
the following:
- installed Linux onto empty harddisk (lets call it "rescue hd"
  ("Debian unstable" including LVM 2.0)
- Removed broken harddisk from machine, installed
  rescue harddisk with newly installed Linux instead to
  boot from it.
- LVM2 finds volume group and reports one disk missing.


I do have an backup, but I'd like to save some recent
files like my mail inbox.

Therefore I'd like to activate the volume group with
one disk missing. Manual pages and mailing list seem
to say this should be possible.
I will have an replacement disk tomorrow or the day
after. If that is the only way I'll have to wait. But
I would like to start without it.

I tried just activating with "vgchange -P -ay", but I
get some working and some missing LVs after that
(that is: only some device files get created
within /dev/<vgname>/).
dmsetup prints information for the corresponding mappings.
Device files for all LVs get created in /dev/mapper/, but
dmsetup prints information only for the working LVs,
not for the missing ones.

Reading the manual page for lvm about -P option
I've learned I should use dmsetup to initialize
/dev/ioerror.

Some answers would help me making my next guesses and
tries more aimed:

- Do I have to setup /dev/ioerror manually before
  using LVM commands like "vgchange -P -ay"?
- If yes: How do I do it?
  "dmsetup create /dev/ioerror <tablefile>" complained
  about device does not exist or something like this.
- Is there a way to find out which LV used the broken
  disk and how much PEs one LV had on the broken disk?
- Is there a way to activate the VG (read only is enough)
  before inserting a new harddisk?


    Thanks
       Florian
