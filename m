From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] creating a LVM ontop of a cryptated (ppdd) loop back device
Message-ID: <20021020164309.GA6596@localhost>
References: <3DAEDEE5.4540B954@silicide.dk> <20021017211217.GB4861@localhost> <3DAFB713.A2E7FAB3@silicide.dk> <20021018213759.GA4471@localhost> <3DB266FF.94DA814C@silicide.dk> <20021020153212.GA2950@localhost> <3DB2D26E.498738EC@silicide.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3DB2D26E.498738EC@silicide.dk>
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
Date: Sun Oct 20 11:43:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sunday, 20 October 2002, at 17:57:34 +0200,
Jon Bendtsen wrote:

> Not completely offtopic.
>
I hope so :)

> Why are you using mount ??
>
What I described is an encrypted filesystem over a plain-and-simple LV,
and the procedure you could follow to take snapshots from this LV,
which holds an encrypted filesystem, and make filesystem-level backups
(such as those made with tar, cpio, rsync and others).

At least in Debian, "losetup" comes with the "mount" package.

> I'm talking about running LVM ontop of a encrypted loopback device, not
> encrypting a lv.
> 
Then maybe we are talking about different things here. I used an
encrypted filesystem over an unencrypted LV but, as loop-aes needs the
loop device to operate, I need to loop-mount the encrypted filesystem for
the system to be able to on-the-fly decrypt its contents.

Maybe I am confused, because I don't fully understand what you mean by
"running LVM ontop of a encrypted loopback device".

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Woody (Linux 2.4.19-pre6aa1)
