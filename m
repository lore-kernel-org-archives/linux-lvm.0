Return-Path: <weissel@netcologne.de>
From: Wolfgang Weisselberg <weissel@netcologne.de>
Date: Tue, 17 Jul 2001 23:28:42 +0200
Subject: Re: [linux-lvm] HUGE LVM log file...
Message-ID: <20010717232842.A6067@tiger.bigcats.invalid>
References: <20010717131430.A17345@sistina.com> <Pine.LNX.4.31.0107171225320.12608-100000@erdos.shef.ac.uk>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.LNX.4.31.0107171225320.12608-100000@erdos.shef.ac.uk>; from g.liakhovetski@ragingbull.com on Tue, Jul 17, 2001 at 12:28:07PM +0100
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Guennadi Liakhovetski (g.liakhovetski@ragingbull.com) wrote 23 lines:

> > > My /var/log/lvm has grown up to 800MB+... and has filled up the disk.=
..

> > lvmsadc is probably filling it run by cron.

> Thanks! But why / what for is it needed and why is it created by default

man lvmsadc:=20
       lvmsadc collects the read/write statistics of the  logical
       volume  manager  to the file "LogFilePath" or to stdout if
       no LogFilePath is given.  You should create a  cron  entry
       for lvmsadc which runs it at regular intervals eg. 10 min=EF=BF=BD
       utes.

That statistical info can be later used to e.g. decide which
LEs shoud have PEs at the faster 'begin' (outer edge) of the
HD.  An automatic LE mover program has not been written yet.

-Wolfgang
