From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200008062055.e76KtEx28533@webber.adilger.net>
Subject: Re: [linux-lvm] Additions to LVM-BUGS-0.8final
In-Reply-To: <398D76E1.CDC2018@yahoo.com> "from Falcon at Aug 6, 2000 04:32:01
 pm"
Date: Sun, 6 Aug 2000 14:55:13 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Falcon <falcon_lvm@yahoo.com>
Cc: Andreas Dilger <adilger@turbolinux.com>, Linux LVM mailing list <linux-lvm@msede.com>

Falcon writes:
> Andreas Dilger escribi?:
> > Try to replace the sprintf() with:
> >
> > sprintf ( file_name, "%s/%s", dir, dir_ent->d_name);
>
>                sprintf ( file_name, "%s/%s", dir, dir_ent->d_name, 0);
                                                                    ^^^
> 
> And when compile it , it say that :
> 
> cc -c -pipe -Wall -O2 -D_GNU_SOURCE -DDEBUG -I/root/LVM/0.8final/tools/lib
> -I/root/LVM/0.8final/tools -o lvm_remove_recursive.o lvm_remove_recursive.c
> lvm_remove_recursive.c: In function `lvm_remove_recursive':
> lvm_remove_recursive.c:51: warning: too many arguments for format

That's because you have an extra "0" at the end, which I don't have.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
