Received: from [10.34.131.225] (dhcp131-225.brq.redhat.com [10.34.131.225])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t54CEHc3032101
	for <linux-lvm@redhat.com>; Thu, 4 Jun 2015 08:14:18 -0400
Message-ID: <55704119.4000606@redhat.com>
Date: Thu, 04 Jun 2015 14:14:17 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAAYit8QCcaGvb5QPw_Xuk+oavthHR1c32oB0GsGd+Ypk0rPtRg@mail.gmail.com>
In-Reply-To: <CAAYit8QCcaGvb5QPw_Xuk+oavthHR1c32oB0GsGd+Ypk0rPtRg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] libdm cannot swap names between two child volumes
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Dne 4.6.2015 v 12:02 M.H. Tsai napsal(a):
> Hi All,
>
> I found that there's a potential bug in libdm when I try to swap sub
> volume's name. By executing the following code, the function
> dm_tree_activate_children() will go into infinite loop since that
> _rename_conflict_exists() still reports "resolvable=1" in this case.
>
> logical_volume *parent = ...;
> logical_volume *child1 = seg_lv(parent, 0);
> logical_volume *child2 = seg_lv(parent, 1);
> char const *tmp = child1->name;
> child1->name = child2->name;
> child2->name = tmp;
> resume_lv(cmd, parent);
>
> Although this scenario might not happen through command-line
> operation, some programmers might need this feature. I think that this
> issue could be resolve in libdm by assigning a temporary name, as the
> following patch does. Is it safe to do this?


Please provide  sequence of  'ioctl' where you think there is a bug.
(or disclose your code using libdm).

There are many rules behind the work with subLV.
(e.g. you can't operate on subLV without operating through top level LV
(and yes some parts of lvm2 code are still buggy in this regard...))

Regards

Zdenek
