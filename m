Return-Path: <juergens@muon.de>
Date: Sat, 17 Mar 2001 18:31:25 +0100
From: Nils Juergens <nils@muon.de>
Message-ID: <20010317183125.A12980@guldukat.muon>
Mime-Version: 1.0
Subject: [linux-lvm] LVM 0.9.1 Beta 6, lockup during pvmove
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Mailing List <linux-lvm@sistina.com>

Hi,

i'm playing around with LVM 0.9.1 Beta 6 on my test box and have
noticed a lockup that i can reproduce quite easily.

I use linux-2.4.2 on a new Debian 2.2r2 installation, but i also
tested linux-2.4.3pre4.

Here is what i do:
create two PV's on two disks
create a VG with these (/dev/hda10, /dev/hdc5).
create a LV that is small enougth to fit on one PV
create ext2 filesystem on the LV and mount it

Now i begin to copy some stuff from a nfs mount to this LV, and while
the copying is done, i do pvmove /dev/hda10, so that the PE's are
transfered to the other PV, /dev/hdc5.

And this is where my system locks up. Well, the processes continue to
run, but they lock up once they try to do stuff on the disk (read,
write).

All disk activity stops the moment pvmove starts to move the first PE.
Using grep and pvmove -d (the lvm code makes this quite easy, nice
work) i found pvmove locks up in tools/lib/pv_move.c, line 522

if ( read ( in, buffer, size) != size) {

Using strace on cp, i find that it locks up during another read (
the last thing strace prints is "read(3,", where 3 was opened readonly
on the NFS mount), so this may be independent of lvm, but i was unable
to lock my box up without lvm.

I would really like to track this down, but my knowledge is rather
limited so any help is appreciated.

thanks,

Nils

-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <
