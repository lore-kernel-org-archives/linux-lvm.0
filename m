Received: from localhost.localdomain (unknown [10.33.36.184])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 590C75D6D3
	for <linux-lvm@redhat.com>; Mon, 23 Nov 2020 13:13:23 +0000 (UTC)
Date: Mon, 23 Nov 2020 13:13:21 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
Message-ID: <20201123131321.GC2229389@localhost.localdomain>
References: <CAMaziXuSe+YncMw622UAeGp_3DKtoCuz-US1yh6+tkrmDyQ4=g@mail.gmail.com>
	<20201120111433.GI1787072@localhost.localdomain>
	<CAMaziXss8HAjSjV6g5kFjzkxnYCGZSowfZcT-nJVRm-tf0rJEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMaziXss8HAjSjV6g5kFjzkxnYCGZSowfZcT-nJVRm-tf0rJEQ@mail.gmail.com>
Subject: Re: [linux-lvm] Unusually long boot times with LVM Snapshots
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Nov 20, 2020 at 09:48:10PM +0530, Sreyan Chakravarty wrote:
> How can I check which type of snapshot I am using ?
> 
> I am very interested in knowing more about these newer snapshots.
> 
> I think I am using the older COW snapshots.
> 
> I created it using:
> 
>               sudo lvcreate -L 70GB -s -n test_snapshot
> /dev/mapper/vgfedora-fedora

This is a classic (aka CoW/copy-on-write or "thick") snapshot since it
was created with a size (-L 70GB). When creating a thin snapshot you do
not specify a size for the snapshot LV - it consumes space from the
associated thin pool as needed.
 
Generally you can find information about the LVs on your system using
the "lvs" command. The "Attr" field displays lv attributes including the
volume type - see the NOTES section of 'man lvs' for the meaning of the
values. The lvs report can also show you whether a snapshot is using CoW
or thinp and the amount of data it is consuming.

Regards,
Bryn.
