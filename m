From: Jeff Layton <jtlayton@poochiereds.net>
Content-Transfer-Encoding: 7bit
Message-Id: <1084643736.3043.17.camel@localhost>
Mime-Version: 1.0
Date: Sat, 15 May 2004 13:55:36 -0400
Subject: [linux-lvm] updated lvm2create_initrd script
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com
Cc: Alasdair G Kergon <agk@redhat.com>, Miguel =?ISO-8859-1?Q?Cabe=E7a?= <cabeca@ist.utl.pt>

I've done some major updates to the lvm2create_initrd script today --
many of these were features I'd been wanting to add for a while. I'm
hoping this will bring the script closer to where it could be included
with the official tarballs.

I've done a little shuffling of my SVN tree, so it's now here:

http://www.poochiereds.net/svn/lvm2

A small changelog:

* added support for including modules in the initrd image. You have to
specify them on the commandline or pass in the $MODULES env. var to use
it.

* Added support for activating specified MD devices during the initrd
phase. This requires you to have mdadm installed.

* Per Alasdair's suggestion, we no longer copy lvm.conf by default, but
now do an lvm dumpconfig and build a new lvm.conf file. The script now
only includes device filters by default. You can also build your own
lvm.conf and have the script use that instead.

* doesn't clobber as many environment vars when running now. Most
everything that can be set on the command line (and more) can also be
set via environment vars (I may have missed a few though).

I've also started work on a man page for it, but haven't gotten very far
with it yet.

Alasdair, can you have a look at the new version of this script and let
me know if there are other changes you'd like to see?

-- 
Jeff Layton <jtlayton@poochiereds.net>
