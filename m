Return-Path: <penguin_master_2000@yahoo.com>
Message-ID: <20010119143338.27304.qmail@web1702.mail.yahoo.com>
Date: Fri, 19 Jan 2001 06:33:38 -0800 (PST)
From: "Mr. Penguin" <penguin_master_2000@yahoo.com>
Subject: Re: [linux-lvm] 2.4.0
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

Oh yes... could have kicked myself after that one. I
built the patch, and applied it.

However vgscan still doesn't find any volume groups!
I'm using devfs if that makes a difference, and only
one PV as this is a laptop.

Any more hints would be appreciated...

James

--- Joe Thornber <joe@66bassett.freeserve.co.uk>
wrote:
> On Fri, Jan 19, 2001 at 04:46:33AM -0800, Mr.
> Penguin wrote:
> > Hi
> > 
> > I'm currently running LVM 0.8i on 2.2.17 with
> devfs
> > and reiserfs. I'm trying to upgrade to 2.4.0.
> > 
> > I'm a little confused as to what patches I need to
> > apply to the base 2.4.0 tree for LVM 0.9.1-beta2.
> The
> > README specifies lvm-0.9.1_beta1-2.4.0.patch but I
> > can't find this file. The only file I can see that
> > looks relevant is lvm-0.8final-2.4.0.patch but I
> dont
> > want 0.8!
> 
> Try reading PATCHES/README
> 
> - Joe
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm


__________________________________________________
Do You Yahoo!?
Get email at your own domain with Yahoo! Mail. 
http://personal.mail.yahoo.com/
