Message-Id: <se1313e0.064@thpmail.tyndale.com>
From: "Cameron Thorne" <CLT@tyndale.com>
Subject: Re: [linux-lvm] lvmcreate_initrd failing...not sure why
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Date: Wed Jan  1 16:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

>> I am trying to convert my root file system over to LVM
>
>Don't.

Well, I have read that this is usually the best case before.  But it is =
more just something I would like to do, not that I feel I need to.  It =
*is* possible, right?  My system isn't mission critical and LVM is =
something I have never messed with before, so I figured why not go all the =
way and just use all my disks as PVs.

Your recommendation would be to keep root and swap out of LVM, and just =
mount /usr /var /home as LVs?

Any idea why lvmcreate_initrd was failing?

=AF Cameron
