Return-Path: <grobe@gmx.net>
Date: Tue, 21 Aug 2001 13:23:46 +0200 (MEST)
From: Lars Grobe <grobe@gmx.net>
MIME-Version: 1.0
References: <20010821125350.B402@sky.net>
Subject: Re: [linux-lvm] restoring lvm cinfiguration
Message-ID: <4438.998393026@www26.gmx.net>
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

Hi! 

My question is concerning the naming conventions of the files. So is vg01
the name of your vg?

I did a vgcfgrestore -l with the different files in /etc/lvmconf, and while
the <vgname>.conf gives me the current config (that is after resize, and I
want to get the config before resizing), I have a file <vgname>.conf.1.old that
seams to hold the data before resizing.

So I would like where lvm will store the data if I resize a lv - is .conf
the new (current after resizing) and .conf.1.old the old (before resizing)
configuration? So if I want to undo resizing, should I restore from .conf.1.old?

Thank You, CU, Lars.

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net
