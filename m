Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t553WqYG015324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 4 Jun 2015 23:32:52 -0400
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mx1.redhat.com (Postfix) with ESMTPS id 921CC374A39
	for <linux-lvm@redhat.com>; Fri,  5 Jun 2015 03:32:51 +0000 (UTC)
Received: by iebmu5 with SMTP id mu5so14614774ieb.1
	for <linux-lvm@redhat.com>; Thu, 04 Jun 2015 20:32:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55704119.4000606@redhat.com>
References: <CAAYit8QCcaGvb5QPw_Xuk+oavthHR1c32oB0GsGd+Ypk0rPtRg@mail.gmail.com>
	<55704119.4000606@redhat.com>
Date: Fri, 5 Jun 2015 11:32:50 +0800
Message-ID: <CAAYit8T2YTHCrGf2rPYdQUTQOGn3uZVQkEkJ-DCbj+9iovRw+g@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

2015-06-04 20:14 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
> Please provide  sequence of  'ioctl' where you think there is a bug.
> (or disclose your code using libdm).

Assume that there's a top-level LV "lv1",
and two sub-LVs "lv1_child1" and "lv1_child2".
The table of the top-level LV is "0 1234 my-target-type 253:1 253:2",
as following:

# dmsetup ls --tree
vg1-lv1 (253:3)
 ├─ vg1-lv1_child1 (253:1)
 └─ vg1-lv2_child2 (253:2)

I want to swap the ordering of subLVs, by using a dm-reload IOCTL:
dmsetup reload vg1-lv1 --table "0 1234 my-target-type 253:2 253:1"
dmsetup suspend vg1-lv1
dmsetup resume vg1-lv1

Then swap names of the two subLVs, to make the first child named "vg1_child1"
dmsetup rename vg1-lv1_child1 vg1-lv1_tmp
dmsetup rename vg1-lv1_child2 vg1-lv1_child1
dmsetup rename vg1-lv1_tmp vg1-lv1_child2


In LVM, the above action is:
logical_volume *parent = ...;  // vg1-lv1
logical_volume *child1 = seg_lv(parent, 0);
logical_volume *child2 = seg_lv(parent, 1);
// swap the subLV ordering
struct lv_segment_area tmp = first_seg(parent)->areas[0];
first_seg(parent)->areas[0] = first_seg(parent)->areas[1];
first_seg(parent)->areas[1] = tmp;
// swap the subLV names
char const *tmp = child1->name;
child1->name = child2->name;
child2->name = tmp;
lv_update_and_reload(parent);  // in lv_manip.c


Apply my previous patch on LVM2.2.02.105, the result IOCTLs are:
dm reload vg1-lv1  // swap child1 and child2
dm resume vg1-lv1
dm suspend vg1-lv1
dm suspend vg1-lv1_child1
dm suspend vg1-lv1_child2
dm rename vg1-lv1_child1 // temporarily renamed to vg1-lv1_child2_tmp,
but do not resume
dm rename vg1-lv1_child2 // renamed to vg1-lv1_child1
dm resume vg1-lv1_child1  // resume the renamed device
dm rename vg1-lv1_child2_tmp // renamed to the actual name "vg1-lv1_child2"
dm resume vg1-lv1_child2  // resume the actually renamed device

(There's might be an issue in my previous patch: I should not resume
the temporarily renamed device)
diff --git a/libdm/libdm-deptree.c b/libdm/libdm-deptree.c
index b0c5f13..3776200 100644
--- a/libdm/libdm-deptree.c
+++ b/libdm/libdm-deptree.c
@@ -1858,7 +1858,9 @@ int dm_tree_activate_children(struct dm_tree_node *dnode,
                                }
                                child->name = new_name;

-                               if (!rename_conflict)
+                               if (rename_conflict)
+                                       continue;
+                               else
                                        child->props.new_name = NULL;
                        }


However, then current LVM cannot accomplish the above IOCTLs,
due to the infinite loop in dm_tree_activate_children(). Also, It doesn't
assign a temporary name to avoid naming conflict.

If libdm doesn't support this feature, then the client need to
invoke lv_update_and_reload() twice to swap names, which might not
be efficiency:

// invoke lv_update_and_reload() twice to swap the subLV names
char const *tmp = child1->name;
child1->name = child2->name;
child2->name = "a_temporary_name";
lv_update_and_reload(parent);  // in lv_manip.c
child2->name = tmp;
lv_update_and_reload(parent);  // in lv_manip.c


> Dne 4.6.2015 v 12:02 M.H. Tsai napsal(a):
>> Hi All,
>> I found that there's a potential bug in libdm when I try to swap sub
>> volume's name. By executing the following code, the function
>> dm_tree_activate_children() will go into infinite loop since that
>> _rename_conflict_exists() still reports "resolvable=1" in this case.
>> logical_volume *parent = ...;
>> logical_volume *child1 = seg_lv(parent, 0);
>> logical_volume *child2 = seg_lv(parent, 1);
>> char const *tmp = child1->name;
>> child1->name = child2->name;
>> child2->name = tmp;
>> resume_lv(cmd, parent);
>>
>> Although this scenario might not happen through command-line
>> operation, some programmers might need this feature. I think that this
>> issue could be resolve in libdm by assigning a temporary name, as the
>> following patch does. Is it safe to do this?
