Return-Path: <lembark@wrkhors.com>
From: lembark@wrkhors.com
Date: Mon, 13 Aug 2001 21:39:08 -0500
Subject: Re: [linux-lvm] Bad Disk
Message-ID: <54920000.997756748@duke.wrkhors.com>
In-Reply-To: <20010814023405.71181.qmail@web10608.mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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


-- Christopher Blunck <cblunck2000@yahoo.com> on 08/13/01 19:34:05 -0700

> But it doesn't kill / contaminate the rest of the
> volume group?  i didn't enable striping so I'm
> assuming it'll leave the other data alone.
> 
> Would you have to issue any administrative commands
> via the vg or lv commands to reduce the vg size?

use:

    vexport volgroupname;
    vgimport volgroupname pvnamethatlives;

Whatever's left on the PV(s) that survived will be
recovered.  Regardless of "striping" you may have
LV's that span the volumes (e.g., via lvextending
them across the PV's).  These will be lost either
way.

sl
