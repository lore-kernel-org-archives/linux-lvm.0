From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200008041732.e74HWW510956@webber.adilger.net>
Subject: Re: [linux-lvm] [patch] bug in lvm_remove_recursive.c
In-Reply-To: <20000804120038.A1069@gondor.com> "from Jan Niehusmann at Aug 4,
 2000 12:00:38 pm"
Date: Fri, 4 Aug 2000 11:32:31 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <jan@gondor.com>
Cc: linux-lvm@msede.com, Linux-LVM-Bug@ez-darmstadt.telekom.de

Jan, you write:
> I found a malloc size off-by-one bug in lvm_remove_recursive.c.
> file_name is allocated with size strlen (dir) + strlen (dir_ent->d_name) + 2,
> and then used with sprintf ( file_name, "%s/%s%c", dir, dir_ent->d_name, 0);
> As sprintf automatically appends another 0 byte, the allocated memory is one
> byte too short.

You should look at the BUGS file at the LVM download site.  It fixes this
bug and several more.  Why Heinz doesn't simply include these fixes into
the source and make a new release, I don't know.

> Please note that I simply increase the malloc size. Now file_name is 
> terminated by two 0 bytes. It may be better to remove the manually added
> 0, or to switch to snprintf (snprintf doesn't add a 0 byte, IIRC).

Yes, I noticed in many places that there is an extra '\0' added on to
the end of strings.  I don't understand why this is done.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
