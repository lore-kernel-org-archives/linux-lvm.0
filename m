Message-ID: <011701c3373d$765f5dc0$1642a8c0@darkstar>
From: "Thomas Kleffel" <thomas.kleffel@maintech.de>
References: <3EE83C19.10805@maintech.de> <20030612121012.C26918@sistina.com> <3EE857C8.2050300@maintech.de> <3EE875FD.20900@maintech.de> <20030612154434.A24004@sistina.com>
Subject: Re: [linux-lvm] How to grow a PV?
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Fri Jun 20 10:06:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi!

> > I just installed 1.95.15 and pvresize tells me "Command not implemented
> > yet."
> > "pvresize --version" gives me the following:
> >
> >  > LVM version:       1.95.15 (2003-01-10)
> >  > Library version:      0.96.08-ioctrl (2003-03-27)
> >  > Driver version:      1.0.10
> >
> > Did I fetch an old version? Or do I need to get some bleeding-edge-stuff
> > from the CVS?
> > Or am I simply too stupid? :)
>
> No, you need to use pvcreate+vgcfgrestore with LVM2.
> Make a copy of your LVM metadata before you try it ;)
> (dd if=/dev/md0 of=md0.vgda bs)1k count=4k)

It worked perfectly :)
Thank you!

Regard,

Thomas
