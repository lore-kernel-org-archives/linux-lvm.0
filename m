References: <CAODnkUDhzOudB_5C+esDfLp+SAm6fa9bZ+ZLFwW4ep0eG0a6Fg@mail.gmail.com>
	<73d0ffcd-4ed5-38b1-0d17-a4b16c7863d6@redhat.com>
	<CAODnkUCkbfvyq8mUpK1OEx5C1jgfmjyYauHzjcA12aGnY6kLGA@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c675a85e-9739-cda9-5588-654337783182@redhat.com>
Date: Wed, 23 Sep 2020 00:02:03 +0200
MIME-Version: 1.0
In-Reply-To: <CAODnkUCkbfvyq8mUpK1OEx5C1jgfmjyYauHzjcA12aGnY6kLGA@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin: pool target too small
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Duncan Townsend <duncancmt@gmail.com>

Dne 21. 09. 20 v 15:47 Duncan Townsend napsal(a):
> On Mon, Sep 21, 2020 at 5:23 AM Zdenek Kabelac <zkabelac@redhat.com> wrote:
>>
>> Dne 21. 09. 20 v 1:48 Duncan Townsend napsal(a):
>>> Hello!
> 
> Ahh, thank you for the reminder. My apologies for not including this
> in my original message. I use Void Linux on aarch64-musl:
> 
>>> I had a problem with a runit script that caused my dmeventd to be
>>> killed and restarted every 5 seconds. The script has been fixed, but
>>
>> Kill dmeventd is always BAD plan.
>> Either you do not want monitoring (set to 0 in lvm.conf) - or
>> leave it to it jobs - kill dmeventd in the middle of its work
>> isn't going to end well...)
> 
> Thank you for reinforcing this. My runit script was fighting with
> dracut in my initramfs. My runit script saw that there was a dmeventd
> not under its control, and so tried to kill the one started by dracut.
> I've gone and disabled the runit script and replaced it with a stub
> that simply tried to kill the dracut-started dmeventd when it receives
> a signal.

Ok - so from looking at the resulting 'mixture' of metadata you
have in your archive and what physically present on PV header are
and now noticing this is some 'not-so-standard' distro - I'm starting to 
suspect the reason of all these troubles.

Withing 'dracut' you shouldn't be firering dmeventd at all - monitoring
should be enabled  (by vgchange --monitor y) once you switch to your rootfs
so dmenventd is execute from your rootfs!

By letting 'dmeventd' running in your 'dracut world' - it lives in its
own environment and likely its very own locking dir.

That makes it very easy your dmeventd runs in parallel with your other lvm2 
commands - and since this way it's completely unprotected
(as file-locking is what it is) - as the resize is  operation for several
seconds it has happened your 'admins' command replaced whatever dmeventd was
doing.

So I think to prevent repeated occurrence of this problem - you'll need
to ensure your system-booting will follow the pattern from distros
like Fedora.

Regards

Zdenek
