From: Martyn.AYSHFORD@orange.co.uk
Message-Id: <199904121837.AA03202@future-is.orange.co.uk>
Date: Mon, 12 Apr 1999 19:40:41 +0100
Subject: [linux-lvm] Cdroms and LVM
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi

Firstly this is very cool, vg00 with 6 gig in it :-), well done.

Secondly vgscan does a pv_read_all_pv which is fine, except that my hdb is
a cdrom (cd/rw really) and this generates lots of 'tray open or drive not
ready' errors.   I'd really like for it not to do this :-)  Can we have a
little mod so that it doesn't bother Readonly devices?

cheers

mja
