Return-Path: <terjekv@ifi.uio.no>
Subject: Re: [linux-lvm] Startup Script trouble in RH6.2
References: <200102201830.f1KIUia13131@webber.adilger.net>
From: Terje Kvernes <terjekv@math.uio.no>
Date: 22 Feb 2001 18:26:33 +0100
In-Reply-To: Andreas Dilger's message of "Tue, 20 Feb 2001 11:30:43 -0700 (MST)"
Message-ID: <wxxd7ca39yu.fsf@gjallarhorn.ifi.uio.no>
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

Andreas Dilger <adilger@turbolinux.com> writes:

> The faq is wrong, IMHO. The LVM startup should be done as early as
> possible. If it is in run level 3, this is "network server level",
> so far to late if you have any local LVM filesystems.

  especially when /usr happens to be a lv. due to the problems from
  the howto with the startup-scripts I've had to boot in
  single-user-mode to get stuff up at the moment, which I sadly have
  to do alot since 2.4.2-pre4 locks hard within hours of boot.

-- 
Terje - who finally started to run LVM after a hardware crash killed
        uptime.
