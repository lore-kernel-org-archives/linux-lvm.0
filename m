Return-Path: <heinrichs@qis-systemhaus.de>
Message-Id: <3A766C21.173CBFDE@qis-systemhaus.de>
Date: Tue, 30 Jan 2001 08:24:17 +0100
From: Dirk Heinrichs <heinrichs@qis-systemhaus.de>
Mime-Version: 1.0
Subject: Re: [linux-lvm] Recommended LVM Version for 2.4.0
References: <Pine.LNX.4.21.0101290901290.9793-100000@miami.datech2.er.heitec.net> <20010129163942.L8567@srv.sistina.com>
Content-Type: text/plain; charset="us-ascii"
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

"Heinz J. Mauelshagen" wrote:
> 
> Please go for 0.9.1 beta3 we released on 25/01/2001 and don't forget to
> patch the kernel even though LVM is already included which will update it to
> the actual LVM release.
> In order to patch, please follow the instructions in the PATCHES/README file
> of the LVM distribution.
> 
> On Mon, Jan 29, 2001 at 09:03:45AM +0100, Holger Rauch wrote:
> > Hi!
> >
> > Which version of the LVM would you recommend using in conjunction with a
> > 2.4.0 kernel? From what I know, only some 0.8 intermediate release seems
> > to be shipped with 2.4.0, and that release is rather old? Is there any
> > newer version that seems to work well with 2.4.0?

Yep, tried the 0.9.1-beta3 yesterday. vgscan of 0.9 hung completely and
prevented the machine from booting (I also used devfs). Now everything
seem to work. 

Bye...

	Dirk

BTW: I knew LVMs before from HPUX - Good Job!!!
