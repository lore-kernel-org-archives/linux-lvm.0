Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m31GwSiO020887
	for <linux-lvm@redhat.com>; Tue, 1 Apr 2008 12:58:28 -0400
Received: from tecmo.mokeys.org (tecmo.mokeys.org [69.55.238.126])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m31Gw8ZY031539
	for <linux-lvm@redhat.com>; Tue, 1 Apr 2008 12:58:08 -0400
Message-ID: <44410.144.92.92.161.1207069075.squirrel@webmail.lotuscat.com>
Date: Tue, 1 Apr 2008 09:57:55 -0700 (PDT)
Subject: Re: [linux-lvm] pvmove hung at 100%
From: <chris@lotuscat.com>
In-Reply-To: <47EEDB6E.7080207@lotuscat.com>
References: <47EEDB6E.7080207@lotuscat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

> I did a pvmove between two PVs of equal size (both 4TB on different
> raids) and it seems to have finished (shows 100%) yet pvdisplay commands
>  show that the source is still allocated and lvdisplay -m on the LV that
>  used the source PV shows that logical extents are still on the logical
> volume pvmove0. My goal is to get this PV and the other PV this LV uses
> (lv03) totally off the system and disconnected.
> Does anyone have any advice/clues on how to resolve/unstick this?

This is still stuck after two days. I am thinking perhaps I should do a
pvmove --abort to reverse the move and then do the pvmove differently in
terms of specifying the LV and multiple PVs to use instead. Does this
sound like a relatively safe course of action? I do have backups, but
would prefer not to go through all that. Also, even though I am at this
odd "pvmove 100.0% but still showing pvmove0 LV" status the data is
accessible.

Thanks in advance,
Chris
