From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009261929.e8QJT8526118@webber.adilger.net>
Subject: Re: [linux-lvm] e2fsadm and fstab
In-Reply-To: <20000923021627.A5309@gondor.com> "from Jan Niehusmann at Sep 23,
 2000 02:16:28 am"
Date: Tue, 26 Sep 2000 13:29:07 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <jan@gondor.com>
Cc: Andreas Dilger <adilger@turbolinux.com>, Linux LVM mailing list <linux-lvm@msede.com>

Jan,
> On Fri, Sep 22, 2000 at 05:51:37PM -0600, Andreas Dilger wrote:
> > This sounds like a bug I added then fixed in my local version of e2fsadm.
> > It is not in the original e2fsadm.  I will post a patch and upload a new
> > SRPM.

I had a look at this, and the correct fix is rather easy.  Where we are
checking all of the mount files, you need to move 

          if (strcmp(*mntfile, MNTTAB)) {

up abount 12 lines, so that it looks like this:

          if (strcmp(*mntfile, MNTTAB)) {
	     if ( lvm_find_command (cmd_online) == NULL) {
	        lvm_path_error ( cmd_online, "online resize");

This way, it will not assume a filesystem is mounted, if it is only
found in MNTTAB (/etc/fstab), but we can still do mountpoint -> device
mapping.  As you pointed out, it is possible with 2.4 to have multiple
device -> mountpoint mappings, but I can't see any sane reason to do
so yet, so it won't be fixed until we know how they will be used.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
