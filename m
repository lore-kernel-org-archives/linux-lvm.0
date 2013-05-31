Message-ID: <51A85DFF.6050406@redhat.com>
Date: Fri, 31 May 2013 10:23:27 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <51A7BE6D.3090609@gmail.com>
	<1369952053.99499.YahooMailClassic@web181504.mail.ne1.yahoo.com>
	<CAEh524ZjZRizYoEimXg0OsLxz2kD8HLu2bqw2V2RbjYKdggVxw@mail.gmail.com>
	<CAEh524ZaPCWidwO6n8RukzDVBpWw9ENAu=X5gLysV-AopYRQag@mail.gmail.com>
In-Reply-To: <CAEh524ZaPCWidwO6n8RukzDVBpWw9ENAu=X5gLysV-AopYRQag@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Fwd: file-based locking initialization failed after
	pvresize
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Christian Lahti <clahti@gmail.com>

Dne 31.5.2013 05:37, Christian Lahti napsal(a):
> Sorry forgot to copy the list.
>
> ---------- Forwarded message ----------
> From: *Christian Lahti* <clahti@gmail.com <mailto:clahti@gmail.com>>
> Date: Thu, May 30, 2013 at 8:36 PM
> Subject: Re: [linux-lvm] file-based locking initialization failed after pvresize
> To: matthew patton <pattonme@yahoo.com <mailto:pattonme@yahoo.com>>
>
>
> Thank you for your reply, I realize that I must have done something rather
> bone-headed and I am usually pretty clued.  That being said I am still in the
> same pickle I was in to begin with, something constructive would be
> fantastically appreciated.  If there were proper documentation *anywhere*
> google-able I would not have bothered the mailing list.  I am pretty sure the
> data must be in tact since this was done in single user mode and no writes to
> the disk/volume have occurred since the two commands were run, I have /etc/lvm
> in tact with information prior to and after the event.  If someone would be so
> kind as to please let me know exactly what information they might need, I will
> do my level best with minimum "back and forth" to provide such information to
> get out of said pickle.  And I furthermore promise not to do it again.

I'm mostly convinced you've probably already made some irreparable damage to 
your disk data - since the story is usually - Data are intact - I've done only 
this and that :) - but anyway it's probably better trying to resolve this 
interactively on #lvm irc channel.

The easiest way is to restore to the previous version of your metadata,
just before you've started your pvresize command  (which must have been loudly 
objecting to your command line options)

Also next time - when the tool is giving you WARNINGS - and you have no idea,
what it means - it's not a sign to go forward, but to STOP immediately...

Regards

Zdenek
