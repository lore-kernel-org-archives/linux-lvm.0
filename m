Message-Id: <200206112132.XAA00187@little-m.com>
From: linux-lvm@little-m.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] software raid?  - LVM? - and how to put it all together ...
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
Date: Wed Jun 12 06:35:05 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Oke,

I have read the docs, and again, and I am still not 
sure if I need LVM (although i can see the benefits etc 
etc)

I am working on setting up my own WEB/MAIL/IMAP etc 
server that will manage the mail for several domains 
that I have.

I got a nice 2nd hand HP Kayak dual P2 server with 2 
identical 4.5Gb SCSI disks.

Because this server will hold mail that I do not want 
to loose, I have arranged a backup to a friends server 
on the other side of the atlantic (that is the US for 
me) so off-side backup is taken care-off.

But ... how to set it up. Ofcourse Raid 1 comes to mind 
(certainly with 2 identical disks) but should I run LVM 
on top of that? What do I use to boot? (can not find a 
good doc about booting from software raid 1) and than 
LVM gets into play as well ...

Sometimes if feels like one big Chicken and Egg problem.

Can this lists give me some suggestions, point me to a 
looked over handy and clear document that can show me 
how to continue and set things up.

The main boot+root+raid+lilo document is almost 2 years 
old, so I think there must be some changes in this 
procedure. (does GRUB understand software raid? and how 
does it deal with LVM?)

Also a bit confusing is the LVM wants the whole disk, 
but software raid is using partions on disks to create 
a MD device (that LVM than can completly use)

As far as I can tell, you can not boot from LVM (right?)
without having something that hold the /boot that is 
not part of LVM.

Most likely I should write all my adventures down as a 
HOW-TO so that other people can benefit from my 
findings.

Thanks,

Kees Duvekot

(btw, I know how to setup Linux and SMTP/IMAP/APACHE 
etc etc so that is taken care off)
