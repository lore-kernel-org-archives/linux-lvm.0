Date: Tue, 16 May 2000 00:58:38 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] How can activate the LVM in start
In-Reply-To: <20000515182126.A17908@omnifarious.mn.org>
Message-ID: <Pine.LNX.4.21.0005160056400.1987-100000@fogarty.spin.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Cc: Patrick Boutilier <boutilpj@ednet.ns.ca>, linux-lvm@msede.com

On Mon, 15 May 2000, Eric M. Hopper wrote:

  	That's all fine and good, but where in rc.sysinit?  I tried
  putting it just before the root filesystems are mounted read/write, and
  that didn't seem to work.

procfs must be mounted, and /etc must be rw. i have it as:
