Message-ID: <20040114150140.61648.qmail@web80408.mail.yahoo.com>
From: Chris Conn <cmcgoat@swbell.net>
MIME-Version: 1.0
Subject: [linux-lvm] xterm problem after reiserfs upgrade
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
Date: Wed Jan 14 10:03:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: slackware <slackware@mail.lug.org.uk>
Cc: linux-lvm <linux-lvm@sistina.com>

I decided to take the plunge last night and switch my
slackware system from ext2 to reiserfs (had already 
done this on my 2nd disk, now I did it on the first),
almost worked perfectly :-).

BTW I'm at slackware 9.1.

The way I did it: booted with cdrom, mounted both disks,
tarred of disk1 to disk2, removed files on disk1, 
converted to reiserfs, untarred files back on disk1,
change /etc/fstab to reflect reiserfs and reboot.

Everything works except xterm for non-root users, when
I try to display any kind of xterm,aterm,wterm,rxvt 
as a non-root user it flashes on briefly then disappears.
Looks like a permission problem with the pts files since
it works fine as root.

The error I see when I kill my WM is

get_pty error 32 not enough ptys

Searched on the web, some people report this error but
no real solutions.

Here's what I've tried so far:

   re-compiled aterm
   created test user (on disk1, users are on disk2)
   tried with Window Maker and GNOME
   tried with wterm, aterm, xterm, rxvt

BTW everything else displays perfectly, including emacs.

Same result... this may be a result of tarring and untarring
the files, may not have to do with reiserfs, maybe there's
a sticky bit that's supposed to be set that tar didn't fix?

For those of you who have reiserfs set up, what entry do you
have in /etc/fstab for devpts?

Thanks for any advice, I'm really stumped on this one!
BTW I really like reiserfs, it seems a lot faster and I
think it will be fun to play with once I get this working.


=====
Chris Conn   
cmcgoat@swbell.net   http://storm.cadcam.iupui.edu/~cmcgoat
Austin, TX
