Return-Path: <hmilz@linux-magazin.de>
From: Harald Milz <hmilz@linux-magazin.de>
Subject: Re: [linux-lvm] using LVM from two machines
References: <20010801152451.41897.qmail@web14403.mail.yahoo.com> <20010801170828.G2603@tykepenguin.com>
Date: Thu,  2 Aug 2001 11:02:10 +0200 (CEST)
Message-Id: <20010802090211.E5F8115C63@mail.linux-new-media.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In article <20010801170828.G2603@tykepenguin.com>, Patrick Caulfield <caulfield@sistina.com> wrote:
> The only way to achieve what you want to do at the moment is to unload the VGs
> on one machine (vgchange -ay after closing all the volumes), make the changes
> on the other machine and then re-run vgscan on the first machine and remount the
> volumes. This applies to *any* changes you make to the LVM configuration.

In a cluster context (a.k.a. failover scenario) this is the only reasonable
way to do it. 

-- 
Harald Milz           |     hm@linux-magazin.de     | Xerox never comes up
Linux New Media AG    | phone  +49 (0) 89 993411-20 | with anything original.
Stefan-George-Ring 24 | fax    +49 (0) 89 993411-99 | 
D-81929 Muenchen      | http://www.linux-magazin.de | 
