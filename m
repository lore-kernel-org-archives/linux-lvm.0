Return-Path: <tjaalton@cc.hut.fi>
Date: Fri, 2 Feb 2001 15:53:02 +0200 (EET)
From: Timo Aaltonen <tjaalton@cc.hut.fi>
Subject: Re: [linux-lvm] startup stuff
In-Reply-To: <Pine.LNX.4.21.0102020959490.426-100000@munster.noc.fr.clara.net>
Message-ID: <Pine.OSF.4.10.10102021545200.18981-100000@vuorikide.hut.fi>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 2 Feb 2001, JAmes wrote:

> 
> Hello
> 
> I am using debian Linux, and have farely successfully installed LVM. I
> have just to do the lvcreate -ay at startup. I assume that thi smust go in
> 
> /etc/rc2.d 
> 
> but using what S??
> 
> Any help extremely apreciated...

You could use the deb's made by Tom Lees. You can find them here:

http://www.lpsg.demon.co.uk/files/debian

Depending which version you are using you have to install either lvm10
(0.9, maybe 0.9.1betas?), lvm6 (0.8final) or lvm5 (0.8i) _and_ lvm-common.
I've been using them for more than a month now without any problems.

They contain the init-script, so you don't need to make your own.

_______________/Timo Aaltonen <http://www.hut.fi/~tjaalton>
Work: Oy MyPortal International Ltd  GSM +358-40-5549 618
