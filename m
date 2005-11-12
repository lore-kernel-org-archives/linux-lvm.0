Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jACIeqV28834
	for <linux-lvm@redhat.com>; Sat, 12 Nov 2005 13:40:52 -0500
Received: from nproxy.gmail.com (nproxy.gmail.com [64.233.182.198])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jACIehw1004498
	for <linux-lvm@redhat.com>; Sat, 12 Nov 2005 13:40:44 -0500
Received: by nproxy.gmail.com with SMTP id k26so197457nfc
	for <linux-lvm@redhat.com>; Sat, 12 Nov 2005 10:40:42 -0800 (PST)
Message-ID: <62b0912f0511121040o6e7610f2qd8ec59598e810d59@mail.gmail.com>
Date: Sat, 12 Nov 2005 19:40:42 +0100
From: Molle Bestefich <molle.bestefich@gmail.com>
In-Reply-To: <62b0912f0511110516gf83b91eta2098d137f456d51@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <62b0912f0511110516gf83b91eta2098d137f456d51@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: LVM snapshots: guess *that's* not how it's done
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: dm-devel@redhat.com, linux-lvm@redhat.com

I wrote:
> Since Fedora Core 4 has a couple of those things already in the
> distro, I went with that.
>
> I did this:
> 1. Install Fedora Core 4
> 2. Create a snapshot of the root volume with lvcreate
>
> Seems the snapshotting did not go after plan - see attached screenshot....
>
> Is that a serious bug in device-mapper or lvm, or is it just me that's
> doing something wrong?
>
> After the lvcreate, nothing works.  A couple things like 'df' does,
> but otherwise there's dialogs complaining about missing ELF headers
> and non-executable binary files no matter what I click or try to run.

I was imagining that someone might have had a good way to get
information about what LVM and DM actually did wrong out of this
system.  Seems not.

If anybody wants to analyze this problem, the window of opportunity is closing.
If nobody pings me within 15 minutes, I'll nuke it and try EVMS :-).

Also, I'll be recommending LVM and DM to my family and friends.
Seems rock stable.  Not!!!  Haha...
