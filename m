Return-Path: <ulf@twc.de>
Message-ID: <3A7FAB7A.29CFB419@twc.de>
Date: Tue, 06 Feb 2001 08:44:58 +0100
From: Ulf Bartelt <ulf@twc.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] startup stuff an dnew question :-)
References: <Pine.LNX.4.21.0102021438490.380-100000@munster.noc.fr.clara.net> <3A7E61D7.D417A879@twc.de> <20010205213917.C29990@bar.nowhere>
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

zoo1@corecomm.net wrote:
> >But the tricky part is: hda2 and hda1 are LVs too...
> >I just faked partition map entries for them and I use them only by this
> >"partition aliases", so I can boot a system living totally in LVs using
> >conventional things like lilo...
> 
> erm... just what does this gain you, then? if you resize or move those
> LVs, wouldn't you have to manually change the fake partition map
> entries, sort of negating the entire point of using LVM...?

...I do not want to use an initrd to switch on some service I cannot
switch off properly because no exitrd exists. But that's
philosophical...

...but for now I never needed to resize /boot or /, only the other
LVs...

...and admittedly I never spent a thought on relations between partition
aliases and snapshots... :-(
