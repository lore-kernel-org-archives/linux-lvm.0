From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009010825.CAA05149@lynx.turbolabs.com>
Subject: Re: [linux-lvm] Strange...
Date: Fri, 1 Sep 2000 02:25:52 -0600 (MDT)
In-Reply-To: <39ACB2F6.58A01FDA@twc.de> from "Ulf Bartelt" at Aug 30, 2000 09:08:38 AM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Ulf Bartelt <ulf@twc.de>
Cc: linux-lvm@msede.com

Ulf Bartelt, you write:
> I had no time to look in the sources but I for now I guess e2fsadm fails
> if used on a LV with a name that is the beginning of a LV name that
> still is in use...
> 
> This was the case having LV names ftp and ftp2...

Correct - it was doing strncmp() using the length of the LV name, so it
was broken in a case like yours.  I fixed this and a few other issues.

Cheers, Andreas
