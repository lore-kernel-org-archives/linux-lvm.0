Message-ID: <00aa01c15fdb$be77bfc0$0a5c010a@ultra>
From: "Klaus Pedersen" <ultra@mailme.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] After power outtage my vg is gone
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
Date: Sun Oct 28 12:07:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I'm using Debian Linux on 2.4.6 (and whatever version of LVM that comes with
it).
After accidentaly pushing the power switch on my Linux server and starting
it up again, I have problems mounting my vg again.

This is what happens :

Vault:/home/ultra# mount /glftpd/site
mount: /dev/site_vg/lvol1 is not a valid block device
Vault:/home/ultra# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "site_vg"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "site_vg" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
"/etc/lvmtab" and "/etc/lvmtab.d"

Vault:/home/ultra#


I read through the archive of the list because I am absolutely sure I am not
the first who had this problem. I read some stuff about using the uuid_fixer
tool, bit as far as I was able to read, the problem that fixes only shows up
after extending the VG (Which I did a week or so, ago), and only for kernels
up to 2.4.5.
Is this true ?

Vault:~/uuid_fixer# ./uuid_fixer /dev/hda8 /dev/hdb1

UUIDs discovered:
W9tkR7eq026WBMCBrUCdebI32vRyFuLn
u5vBzCHwu5mjAt5yN0lS4Ecrto1jI9NZ

I tried running it anyway, and after that I ran vgscan - and the same
problems showed up.

What do I do to recoved my data ?


Any help is greatly appreciated

/Klaus
