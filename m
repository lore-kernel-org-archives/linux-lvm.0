Message-ID: <386720E2.B77BA2FD@twc.de>
Date: Mon, 27 Dec 1999 09:18:42 +0100
From: Ulf Bartelt <ulf@twc.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] booting w/o initrd
References: <199912221602.JAA22165@webber.adilger.net> <3861DC7B.7ECF442C@twc.de> <3863961B.B067C1D1@tls.msk.ru>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

"Michael Ju. Tokarev" wrote:
> []
> > And even if it is not needed today, somewhen LVM might be changed in a
> > way that stopping it cleanly on shutdown will become a must.
> []
> What is about power failure for example?  Or kernel panic?  Or hardware error?
> Does it mean that there will be no ability to bring lvm up again in such a
> cases!?  But clean filesystem umount is a must, but there is a fsck here
> that is started (automatically) if that "must" didn't satisfied....

For now, cleanly deactivating LVM before shutdown is not neccessary.
Otherwise bringing up LVM from an initial ram disk and switching the
root would bring the systems in trouble as there are no actions like
switching back to a ram disk on shutdown, unmount the "real" root, stop
LVM and stop the system...

Filesystems must be unmounted before shutdown. But if something crashes,
a fsck inspects the filesystem on the next system startup. I expect LVM
to behave similar if bringing LVM down before shutdown will be required.
