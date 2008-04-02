Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m32KcKJg018364
	for <linux-lvm@redhat.com>; Wed, 2 Apr 2008 16:38:20 -0400
Received: from tecmo.mokeys.org (tecmo.mokeys.org [69.55.238.126])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m32Kc9lR000834
	for <linux-lvm@redhat.com>; Wed, 2 Apr 2008 16:38:10 -0400
Message-ID: <2221.144.92.92.161.1207168681.squirrel@webmail.lotuscat.com>
Date: Wed, 2 Apr 2008 13:38:01 -0700 (PDT)
Subject: Re: [linux-lvm] pvmove hung at 100%
From: <chris@lotuscat.com>
In-Reply-To: <44410.144.92.92.161.1207069075.squirrel@webmail.lotuscat.com>
References: <47EEDB6E.7080207@lotuscat.com>
	<44410.144.92.92.161.1207069075.squirrel@webmail.lotuscat.com>
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
To: chris@lotuscat.com
Cc: linux-lvm@redhat.com

>> I did a pvmove between two PVs of equal size (both 4TB on different
>> raids) and it seems to have finished (shows 100%) yet pvdisplay
>> commands
>>  show that the source is still allocated and lvdisplay -m on the LV
>> that used the source PV shows that logical extents are still on the
[stuff deleted]
>
> This is still stuck after two days. I am thinking perhaps I should do a
> pvmove --abort to reverse the move and then do the pvmove differently in
> terms of specifying the LV and multiple PVs to use instead. Does this
> sound like a relatively safe course of action? I do have backups, but
[stuff deleted]

In case anyone is curious or finds this via search later: the pvmove
--abort was successful and returned everything to the state it was before
I started the pvmove. I will be doing a different pvmove with the same
goal soon.
