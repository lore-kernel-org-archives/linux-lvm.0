Return-Path: <fzzgrr@gmx.net>
Date: Tue, 21 Aug 2001 14:53:29 +0200
From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Subject: Re: [linux-lvm] restoring lvm cinfiguration
Message-ID: <20010821145329.A763@sky.net>
References: <20010821125350.B402@sky.net> <4438.998393026@www26.gmx.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4438.998393026@www26.gmx.net>
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

Hi,
* Lars Grobe <grobe@gmx.net> [010821 13:23]:
> My question is concerning the naming conventions of the files. So is vg01
> the name of your vg?
Yes.

> I did a vgcfgrestore -l with the different files in /etc/lvmconf, and while
> the <vgname>.conf gives me the current config (that is after resize, and I
> want to get the config before resizing), I have a file <vgname>.conf.1.old that
> seams to hold the data before resizing.
> 
> So I would like where lvm will store the data if I resize a lv - is .conf
> the new (current after resizing) and .conf.1.old the old (before resizing)
> configuration? So if I want to undo resizing, should I restore from .conf.1.old?

I think you should use .conf.1.old then. The newest file is .conf, the
oldest one .conf.9.old (at my system, "ls -l" shows you this).
You can use the -t option to test the command.

Uli

-- 
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
