Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Migrating to an LVM system (boot/root) disk
Date: Tue, 5 Jun 2001 09:03:35 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJGEBCIPAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <3B1BDAA0.A02C0304@tls.msk.ru>
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
To: linux-lvm@sistina.com

> Behalf Of Michael Tokarev
> Andreas Dilger wrote:
> >
> []
[snip]
> > The problem is that "sed" is used in the wrapper script. AFAIK, I do not
> > have "sed" in my wrapper script, so I don't know where it came from.
Can
> > you tell me where the wrapper script comes from that you are using
and/or
> > post a copy to this list so it can be fixed?
>
> I leave that to Steve Wray -- I personally not use any wrappers at all,
> and ever never saw mkinitrd script(s)... ;)

phew I have no idea where the wrapper script came from, if not from LVM?
Lets see. lvscan --version yields;
Logical Volume Manager 0.9.1_beta7
Heinz Mauelshagen, Sistina Software 10/04/2001 (IOP 10)

Also,
$ file `which lvscan`
yields;
Bourne shell script...

lvmcreate_initrd is also a script.

Need any more info?
