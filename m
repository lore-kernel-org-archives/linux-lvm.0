Return-Path: <ozric@tampabay.rr.com>
Message-ID: <3A7EBEE6.14490D5F@tampabay.rr.com>
Date: Mon, 05 Feb 2001 14:55:34 +0000
From: Richard Smith <ozric@tampabay.rr.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lv extend
References: <01C08F47.ADAB2B60.smdenton@bellsouth.net> <20010205143445.A5041@jhereg.dmeyer.net>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

dmeyer@dmeyer.net wrote:
> 
> In article <Pine.LNX.4.21.0102051355290.698-100000@munster.noc.fr.clara.net> you write:
> >
> > It worked any way :-) Using e2fsadm. I succesfully resized my /home
> > But what about changing an important 'partition' like /usr ? Do I have to
> > do it with a rescue disk or something.
> 
> FYI, reiserfs apparently allows resizing of a mounted filesystem.
> Mind you, I'd do a backup before trying anything resembling that, but
> then backing up before resizing is always a good idea.
> 
> --
> Dave Meyer
> dmeyer@dmeyer.net
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

Do you have anymore information on this.  I use reiser on my LV now.
Its just scratch disks so I can play.  I am intrested in this chfs
issue.
