Message-ID: <3863961B.B067C1D1@tls.msk.ru>
Date: Fri, 24 Dec 1999 18:49:47 +0300
From: "Michael Ju. Tokarev" <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] booting w/o initrd
References: <199912221602.JAA22165@webber.adilger.net> <3861DC7B.7ECF442C@twc.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Ulf Bartelt wrote:
> 
[]
> And even if it is not needed today, somewhen LVM might be changed in a
> way that stopping it cleanly on shutdown will become a must.
[]
What is about power failure for example?  Or kernel panic?  Or hardware error?
Does it mean that there will be no ability to bring lvm up again in such a
cases!?  But clean filesystem umount is a must, but there is a fsck here
that is started (automatically) if that "must" didn't satisfied....
