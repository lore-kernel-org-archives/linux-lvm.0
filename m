Subject: Re: [linux-lvm] DM encryption target?
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <3F717F13.1050407@silicide.dk>
References: <1064332301.5845.8.camel@david.internal.NorcrossGroup.com>
	 <1064343664.10276.3.camel@chtephan.cs.pocnet.net>
	 <3F717F13.1050407@silicide.dk>
Message-Id: <1064404776.5915.9.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Wed Sep 24 07:00:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Am Mi, 2003-09-24 um 13.25 schrieb Jon Bendtsen:

> > Yes, as Kevin already pointed out, I've written a working implementation
> > some time ago. It currently seems to be more stable than the cryptoloop
> > implementation in the 2.6-test kernels.
> > 
> > You can find my original announcement with some how-to-use details at
> > http://lwn.net/Articles/42000/ . Don't use that patch, I've got a newer
> > one one my homepage http://www.saout.de/misc/dm-crypt.diff .
> 
> How far did you come? Can you change the password? What kind of 
> encryption can be used? the hole cryptoapi range? just some?

Every (symmetrical, well, there are only symmetrical ciphers in the
kernel ATM) cipher can be used with every possible key size. At least in
theory, I tried some combinations and everything worked as expected. The
cryptoapi use is relatively independent of the cipher used.

The target has no in-place-conversion support (what I suppose you mean
with password change?). If someone wants to do this you would probably
do this offline or need another target for this (probably similar to the
pvmove mechanism).

I've thought of a way to do this completely in userspace. I've got a
test program running, but when doing IO on the device while conversion
is running it tends to lock up. I don't know why exactly, probably my
idea is flawed (at least I think it's dangerous under low memory
conditions). It was just an experiment anyway. If someone is interested
in the source, please say so.

Another way to do a password change would be to not reencrypt the device
but to store the symmetrical key somewhere else and encrypt it with a
password hash and to just reencrypt that key with another password.

But this one could be done completely userspace. I've not written a
special dmcryptsetup tool for this, where this should probably go (or be
integrated into the lvm tools, whatever). You have to use dmsetup at the
moment.

--
Christophe Saout <christophe@saout.de>
Please avoid sending me Word or PowerPoint attachments.
See http://www.fsf.org/philosophy/no-word-attachments.html
