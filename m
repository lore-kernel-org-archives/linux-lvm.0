Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2ALGo828882
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 16:16:50 -0500
Received: from magic.alttech.com ([64.140.60.35])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2ALGm07002427
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 16:16:48 -0500
Received: from dogberry.ossmann.com (magic.alttech.com [64.140.60.35])
	by magic.alttech.com (Postfix) with ESMTP id 4E1082FE9F
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 14:16:45 -0700 (MST)
From: Michael Ossmann <mike@ossmann.com>
Subject: Re: [linux-lvm] lvm2 vgchange -a n problem
Message-ID: <20040309234328.GA6481@ossmann.com>
References: <20040305235958.GG8500@ossmann.com> <20040308093919.GI4872@reti>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040308093919.GI4872@reti>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Mar 10 16:14:07 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Mon, Mar 08, 2004 at 09:39:19AM +0000, Joe Thornber wrote:
> 
> i) do a 'dmsetup info <dev>' and confirm that the 'open count' is 0

# dmsetup info 
Name:              pvfoo
State:             ACTIVE
Tables present:    LIVE
Open count:        3
Event number:      0
Major, minor:      254, 1
Number of targets: 1

Name:              vgfoo-lvfoo
State:             ACTIVE
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      254, 3
Number of targets: 1
UUID: [snipped]

Name:              vgfoo-lvbar
State:             ACTIVE
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      254, 2
Number of targets: 1
UUID: [snipped]

> ii) use 'lsof' to find out who has opened the device.

# lsof /dev/mapper/vgfoo-lvfoo
# lsof /dev/mapper/vgfoo-lvbar
COMMAND     PID     USER   FD   TYPE DEVICE     SIZE    NODE NAME
[snipped many lines of output]

# lvchange -a n vgfoo/lvfoo
  LV vgfoo/lvfoo in use: not removing

Hmmmm.  Looks to me like it shouldn't be complaining.  I
don't know if this would affect anything at the lv layer,
but the only unusual thing here is that my pv happens to be
built on top of device mapper (dm-crypt).  Everything has
been working fine except for lv and vg deactivation.

mossmann
