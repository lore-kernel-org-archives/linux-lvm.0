From: Erik =?ISO-8859-1?Q?B=E5gfors?= <Erik.Bagfors@ardendo.se>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1008250625.4350.5.camel@detrius>
Mime-Version: 1.0
Subject: [linux-lvm] Urgent, Please help LVM-krash
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
Date: Thu Dec 13 07:35:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux LVM Mailinglist <linux-lvm@sistina.com>

Hi all!

Yesterday I krashed my lvm.  This is the first time I'm having real
problems with it.

This is what happened.

I was going to add a new lv and used the lvcreate-command as usual.=20
This time I forgot the -n switch and when I realized that I hit ctrl-c..
BAD idea!

Now my vg is gone.  I can't get it back whatever I try.  Any help would
be VERY appreciated.

A vgscan just sais "no volume groups found" or something like that.=20
doing a pvdisplay on the pv's in my vg gives me that they should be in
"diskvg" (which is correct).  I've tried doing vgcfgrestore from the
backups in /etc/lvmconf but that doesn't help.  vgscan still doesn't
find it.

I looked at the HOWTO and found a program named uuid_fixer that looked
like it could solve the problem but it died with an "illegal
instruction" regardless of if I used the precompiled version or compiled
it myself.

This is on a mandrake 8.1-box with lvm, xfs, reiserfs and devfs so there
are alot of things to think about.

When doing stuff I did the following first:
 reboot into single user, remount / rw, mount /proc, restore some
standar-stuff into /dev, and start devfsd

After that I tried vgcfgrestore, vgscan, uuid_fixer and just about
everything I could think or.

Please please please help me.  Can anyone solve this.  There are over 60
GB of stuff on this computer and it needs to work TODAY :(

/Erik

--=20
Erik B=E5gfors               | http://www.ardendo.se/
Erik.Bagfors@ardendo.se    | GSM +46 733 279 273
fingerprint: 6666 A85B 95D3 D26B 296B 6C60 4F32 2C0B 693D 6E32
