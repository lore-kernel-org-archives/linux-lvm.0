Return-Path: <ralph@oro.net>
Date: Mon, 26 Feb 2001 16:30:59 -0800
From: Ralph Jennings <ralph@oro.net>
Subject: Re: [linux-lvm] LVM support for LILO
Message-ID: <20010226163059.A1030@oro.net>
References: <20000908000253.A23165@srv.t-online.de> <200009072329.RAA21600@lynx.turbolabs.com> <20000908090315.A23300@isis.visi.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20000908090315.A23300@isis.visi.com>; from idsfa@visi.com on Fri, Sep 08, 2000 at 09:03:15AM -0500
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

On Fri, Sep 08, 2000 at 09:03:15AM -0500, Michael J Kellen wrote:
[snip]
> What I'd *really* like to see is kernel code for autostarting of LVM
> similar to the autostart of md (side note: 2.4.0-test7 seems to break
> that, though). One step at a time, though.

Is this being worked on?  Also putting the LVM stuff on the end of the
disk (as MD does) would be nice too.

> Lastly, remember that if you install LILO in the MBR, you don't need to
> restructure the PV.

What if the PV is the entire hda?  As in:
    1. md0 is the entire hda, and hdc
    2. pv_raid is the entire md0
    3. lv_root, lv_usr, lv_swap, etc is under pv_raid

 -Ralph
