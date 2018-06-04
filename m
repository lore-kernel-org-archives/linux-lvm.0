MIME-Version: 1.0
In-Reply-To: <20180604153434.GB19875@redhat.com>
References: <CAANaKqdnGfgxxHwQVA+L3uNDe5aMydssLius94wcp6LxA1-w+g@mail.gmail.com>
	<CAANaKqdPjq9sK=DvZjDDSm8Vd_28C1k2i2xLyTrkFzwVq69NZw@mail.gmail.com>
	<CAANaKqdRgfcZvUZXUgwSX-WXaQ0K=yg6ubDGwRkMk8mU+bDpUw@mail.gmail.com>
	<CAANaKqcv2bF1X1S3L5xi-7HOsV2J29a4BvhMjiqwigRm2SGbVw@mail.gmail.com>
	<CAANaKqd98zjbv2Mh60aeny=UL8oMGadGcLUXgOURbQmnFxojEA@mail.gmail.com>
	<CAANaKqeKDaBcAHAh91ycm9SwB0gDD+cNHqsAVkW6y-RzNzgifg@mail.gmail.com>
	<20180604153434.GB19875@redhat.com>
From: Jim Haddad <jimhaddad46@gmail.com>
Date: Mon, 4 Jun 2018 11:26:29 -0700
Message-ID: <CAANaKqf91hdLSHs5CyX_AFaoV0L2Jr6mVE+RRCJODRUF0bM+hQ@mail.gmail.com>
Subject: Re: [linux-lvm] "write failed.. No space left", "Failed to write VG",
 and "Failed to write a MDA"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com

On Mon, Jun 4, 2018 at 8:34 AM, David Teigland <teigland@redhat.com> wrote:
> On Sun, Jun 03, 2018 at 07:47:35PM -0700, Jim Haddad wrote:
>> Writing past the end of the disk seems to be fixed in git master.
>
>> Hoping I understood the situation well enough that it wouldn't cause
>> harm, using 2.02.177, I ran:
>
> You'll notice some ongoing changes with releases and branches.  I'd
> suggest using 2.02.176 and 2.02.178 (skip 2.02.177).  If you want to use a
> git branch directly, you may want to look at 2018-06-01-stable since the
> master branch may be unstable for a while.

Thanks for your replies.  Will do.  I did have some compilation errors
on master, but it was past creating tools/lvm, so I was able to use
that.

>> With git master, I ran the same command.  It no longer says exactly
>> how much and where it's writing, just the header address.
>
> You should see more writing debug information than you included, like
> this...

You're absolutely right, I didn't look high enough up.

Do you think I'm right, that there are no lasting effects from having
ran into problem?  Meaning, if I run 2.02.176/178/2018-06-01-stable
I'm all set, and don't need to copy all the data off the disk and redo
it?
