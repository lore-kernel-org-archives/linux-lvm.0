Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2Q65bJj006218
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 02:05:37 -0400
Received: from mail-iw0-f174.google.com (mail-iw0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2Q65XdZ004723
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 02:05:33 -0400
Received: by iwn34 with SMTP id 34so2535703iwn.33
	for <linux-lvm@redhat.com>; Fri, 25 Mar 2011 23:05:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4D8D78D5.7050701@cox.net>
References: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>
	<4D8D6EAF.8050403@cox.net>
	<alpine.LRH.2.00.1103260047590.26023@bmsred.bmsi.com>
	<4D8D78D5.7050701@cox.net>
Date: Sat, 26 Mar 2011 12:53:59 +0700
Message-ID: <BANLkTikb2OJoi181n8sLFGfuNKooxeFOvA@mail.gmail.com>
From: hansbkk@gmail.com
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Powerfailure and snapshot consistency
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Ron Johnson <ron.l.johnson@cox.net>

On Sat, Mar 26, 2011 at 12:25 PM, Ron Johnson <ron.l.johnson@cox.net> wrote:
> On 03/25/2011 11:52 PM, Stuart D. Gathman wrote:
>>> On 03/25/2011 11:24 PM, Stuart D. Gathman wrote:
>>>> 2) make sure important LVs do not span multiple PVs (except for LVM
>>>> mirroring) - you could be unhappy in the event of a system crash.
> File a bug... �But against what? �LVM? �The FS? �The block layer?

IMO it's fair enough for low-level processes to assume continuity of
power. Having (and regularly testing) an appropriate UPS is a baseline
component of any system where reliability is important.

Perhaps a re-wording: You will more easily be able to recover your
data in the event of a system crash if your LVs don't span multiple
PVs.
