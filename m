Return-Path: <gregm@comstar.net>
Date: Wed, 7 Feb 2001 19:47:56 -0500 (EST)
From: Gregory McLean <gregm@comstar.net>
Subject: Re: [linux-lvm] Help! Problems finding VG after reboot.
In-Reply-To: <3A8042FC.FC4A5923@tampabay.rr.com>
Message-ID: <Pine.LNX.4.30.0102071946280.22244-100000@tweetie.comstar.net>
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

On Tue, 6 Feb 2001, Richard Smith wrote:

> --snip--
> I agree as well.
>
> The .9 versions are still marked as beta.
> I have been banging it around abit, but I would
> not trust important data to it yet, without a backup.

I would have to agree also, vgscan no longer works here either, I've
edited around in the startup files to _not_ call vgscan at all and things
are working for now. Though if I need to add a drive to the system I'm
screwed.
