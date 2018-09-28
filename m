Date: Fri, 28 Sep 2018 09:32:03 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20180928143203.GA5724@redhat.com>
References: <CABZYMH498m-hNpkbAagiNPmFjFLrMZZZncx6S1ksupRVnPtYqw@mail.gmail.com>
	<20180925164405.GA10635@redhat.com>
	<CABZYMH57cROshtj0YMJ8PNU0Udw7qe0d7evuhc3-aXMYYEit3A@mail.gmail.com>
	<20180927173550.GB2706@redhat.com>
	<CABZYMH4eYC-r+wCPyC8r-xqzNbRr-OukRoweNAD2nej6wgDKyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABZYMH4eYC-r+wCPyC8r-xqzNbRr-OukRoweNAD2nej6wgDKyA@mail.gmail.com>
Subject: Re: [linux-lvm] [lvmlockd] recovery lvmlockd after kill_vg
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
To: Damon Wang <damon.devops@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Sep 28, 2018 at 11:14:35AM +0800, Damon Wang wrote:

> as the manual says, it should deactivate volumes and drop lockspace as
> quick as possible,

A year ago we discussed a more automated solution for forcing a VG offline
when its sanlock lockspace was shut down:

https://www.redhat.com/archives/lvm-devel/2017-September/msg00011.html

The idea was to forcibly shut down LVs (using dmsetup wipe_table) in the
VG when the kill_vg happened, then to automatically do the 'lvmlockctl
--drop' when the LVs were safely shut down.  There were some loose ends
around integrating this solution that I never sorted out, so it's remained
on my todo list.

> TTY can get a message, but it's not a good way to listen or monitor, so I
> run vgck periodically and parse its stdout and stderr, once "sanlock lease
> storage failure" or
> something unusual happens, an alert will be triggered and I'll do some
> check(I hope all this process can be automatically).

If you are specifically interested in detecting this lease timeout
condition, there are some sanlock commands that can give you this info.
You can also detect ahead of time that a VG's lockspace is getting close
the threshold.  I can get back to you with more specific fields to look
at, but for now take a look at 'sanlock client renewal' and some of the
internal details that are printed by 'sanlock client status -D'.

Dave
