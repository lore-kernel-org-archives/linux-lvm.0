Message-ID: <3DB537AB.642A6854@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
References: <3DB3BDA4.75B552B6@silicide.dk> <20021021151240.GG838@tykepenguin.com>
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
Date: Tue Oct 22 06:34:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Patrick Caulfield wrote:
 
[cut]

> You really don't want to do that... 1.1 is well broken.

uhoh, i'm already doing it, not production yet, but soon.
I figured that the latest from oktober 3, 1.1-rc2 would be
good enough.


> > and removing those debian packages.
> 
> The Debian packages should be fine. Plenty of other people are using them.
> 
> Can you tell which command is issued the illegal ioctl ? It could be that the
> LVM device has a wrong major/minor or something else has take the LVM
> major/minor device number, because those are /not/ LVM ioctl numbers.

More than one. vgchange -a y <VG>
lvremove (snapshopts)


> If you can determine what command is issuing those odd ioctls then you're
> probably half-way to finding the culprit.

Well, it's not just one command.



JonB
