Return-Path: <terjekv@ifi.uio.no>
Subject: Re: [linux-lvm] LVM X front end
References: <Pine.LNX.4.20.0103091926210.27453-100000@rdb.linux-help.org> <20010310142747.A1365@dardhal.mired.net> <15018.14466.195540.783117@nv.192.168.71.6>
From: Terje Kvernes <terjekv@math.uio.no>
Date: 10 Mar 2001 21:52:26 +0100
In-Reply-To: lvm@winux.com's message of "Sat, 10 Mar 2001 09:21:54 -0500"
Message-ID: <wxx4rx1jqid.fsf@fjorir.ifi.uio.no>
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

lvm@winux.com writes:

> I used the Veritas software for a couple of years. It was horrible.
> The manuals were about 5 inches (13 cm) thick and were a morass of
> self-referential jargon. To understand anything, you had to
> understand something else first. This was recursive. I would
> frequently suffer from brain-stack overflow and I'd have to reboot
> my head.

  mental note: "don't go there". thank you. :)
 
> Their command line interface was complex to the point of absurdity
> but their X interface was worse. It made remote administration
> dreadfully slow on my remote installations since I had to use PPP
> over a dialed line to get into the remote facilities. Any operation
> could take several minutes.

  I hope we never get to the stage where (LVM) management is required
  to do anything. I've found most of the tools I've used with LVM to
  be nicely and cleanly done. it appears consistent. as long as my
  environment is just that, I'm generally happy. those things that
  aren't (even at the level of RedHats "useradd" and "addgroup") I
  basically avoid. 

  anyhow, my point being: a big thank you to the people behind LVM.
  good job. :)
 
> In some shops, everybody is a newbie. I was a newbie in my first
> shop (20+ years ago) but with the help of friends and e-mail
> (carried by UUCP, no Internet) I could get the answers I needed to
> climb the learning curve.

  urkle. right. *cough*

  I'm 24. feel free to ignore me. :)
 
> In my opinion, the Linux LVM administrative interface is pretty well
> done. I was delighted to find the command line LVM interface to be
> relatively clean, simple, and overlaid with a minimum of jargon. At
> first glance, the command line arguments are a bit inconsistent
> (e.g., when to use 'lv0' vs '/dev/vg0/lv0') but this is not such a
> big problem given that most commands respond well to '--help' or
> 'man'.

  agreed. :)
 
> With faster remote access becoming more common, it's feasible to
> consider using a graphical interface to the LVM of a remote system.

  that's one thing, but what I'd like is to see a GUI that basically
  talks to these underlying tools. using some sort of graphical
  representation of the information things like a 'vgscan' will
  produce.

> However, in that vein, I wouldn't divert from development and
> enhancement of the core system for even one day. 

  I certainly agree to that too.

> As with most "infrastructure" components, stability, reliability,
> and consistency are of prime importance and have to come first. The
> "pretty wrappers" around that core can come later.

  amen brother. :)
 
> It's not yet a mature system but it's being pursued by a group of
> smart, dedicated people who are genuinely interested in finding and
> fixing problems. This is the most important ingredient and Linux LVM
> has it in abundance

  yup. and that alone is a reason to use both. 

-- 
Terje
