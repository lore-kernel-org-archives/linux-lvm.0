From: mschout@gkg.net
Date: Tue, 9 Nov 1999 18:13:54 -0600 (CST)
Subject: [linux-lvm] Status on LVM 0.7 + raid0145-19990824
Message-ID: <Pine.LNX.4.10.9911091800520.1253-100000@cdm-24-019.tca.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi.

I have had some success in my attempts to get LVM 0.7 working on top of a md
raid5 device using the raid0145-19990824 patch.

I first applied the raid patch, and then applied the lvm patch against clean
2.2.13 kernel sources.

There were some rejects in ll_rw_blk.c that needed to be resolved.  Many of
these were trivial to fix.

However, the major change is that the new raid patch has changed the prototype
for md_make_request:

-int md_make_request (int minor, int rw, struct buffer_head * bh)
+int md_make_request (struct buffer_head * bh, int rw)

Inside that function (in md.c), I made the following change.

-       mddev_t *mddev = kdev_to_mddev(bh->b_dev);  
+       mddev_t *mddev = kdev_to_mddev(bh->b_rdev);  

This seems to do the trick.  I have created a raid5 device using 3 8GB drives,
and set /dev/md0 up as /dev/vg00  I created 4 lv's on it, and have been doing
some hand tests (writing large files, comparing them).  So far, so good.  No
system hangs / ooops's / panic's / corruptions yet.

I am not sure what the rammification is of the above change is to using plain
raid5 devices without LVM though.  I have also only tested LVM on top of raid5.
I have not tested other levels.  I dont really have the disk resources / spare
time to test all of the cases :).

The major issue I see though is that we can't really integrate this back into
the lvm patch itself.  This change is only relevant if you have already applied
the raid0145-19990824 patch before applying the lvm patch.  So either we need
to have separate patches, or leave this to people like me as "unsupported"
patches or something.

I am planning to release a big patch this week against 2.2.13 that contains:

LVM 0.7
Raid0145-19990824
Reiserfs-3.5.5-journaling
knfsd patches (not sure on these yet... ).

So people would be welcome to get the patch from me.

Im not sure what the best way is to proceed with this.  If either LVM or
raid0145 makes it into the mainline kernel soon, then we wont have this problem
to deal with anymroe, but I think there is not a generic solution to the
problem without maintaining two patches until then.

Does anyone have any thoughts/comments on this?

I can post my diff's from a vanilla-2.2.13+raid0145-19990824 kernel as well if
anyone wants to.  But Ill refrain from posting that to the list as it will be
somewhat long.  If you want to see it, let me know and I will email it to your
private address.

Regards,
Mike
