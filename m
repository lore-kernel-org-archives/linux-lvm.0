Return-Path: <lembark@wrkhors.com>
From: lembark@wrkhors.com
Date: Mon, 13 Aug 2001 20:30:50 -0500
Subject: Re: [linux-lvm] Bad Disk
Message-ID: <16190000.997752650@duke.wrkhors.com>
In-Reply-To: <20010814013230.18588.qmail@web10605.mail.yahoo.com>
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


-- Christopher Blunck <cblunck2000@yahoo.com> on 08/13/01 18:32:30 -0700

> I didn't find this in the FAQ anywhere -
> 
> Let's say I have a vg01 consisting of PV1 and PV2. 
> Then let's say that PV2 dies (hardware problem).  What
> happens to vg01 and furthermore, what happens to any
> LVs created out of vg01?  

It depends.

If all of your lv's are on pv1 then you can often get them
back w/ the old vgexport/vgimport trick.  If your lv's are
spread across the two pv's then whatver lv's touched pv2 
are history.

sl
