Return-Path: <Fabian.Herschel@suse.de>
Message-ID: <3AE6C0AB.CA50ACD8@suse.de>
Date: Wed, 25 Apr 2001 14:18:51 +0200
From: Fabian.Herschel@suse.de
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgscan does not found my VG, but pvscan does...
References: <000901c0cd36$a80064a0$7d80a8c0@dyndns.org> <01042510065800.15131@workstation> <20010425114759.A4514@sistina.com>
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

"Heinz J. Mauelshagen" wrote:

> > I'm hopeful we will find a solution.
> 
> These "vgscan can't find my..." errors still show up on a too regular base :-(
> They absolutely need to be fixed before the 1.0 release.
> 
> Could you please send your two VGDAs compressed email attached to mee in order
> to be able to investigate more.
> 
> Add the "vgscan -d" output for the fail case as well, please.

Are the first 5000 blocks of each PV enought? 
Is the complete VGDA stored in this area?

Fabian



-- 
Fabian Herschel                                 SuSE Linux Solutions AG
Tel:    +49-6196-50951-23                       Mergenthalerallee 45-47
Fax:    +49-6196-409-607                        D-65760 Eschborn
mailto: Fabian.Herschel@suse.de                 http://www.suse.de
