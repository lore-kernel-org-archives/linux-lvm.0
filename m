Date: Sun, 17 Jul 2011 08:23:01 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110717122301.GB31728@redhat.com>
References: <201107162229.33740.benscott@nwlink.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201107162229.33740.benscott@nwlink.com>
Subject: Re: [linux-lvm] lvconvert --merge bug
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
To: benscott@nwlink.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Jul 17 2011 at  1:29am -0400,
ben <benscott@nwlink.com> wrote:

> I was playing with snapshot merging a discovered a problem. If a snap starts 
> out as invalid the merge command starts merging and then quits. That leaves 
> the snap in a strange condition. It is listed as merging even though the merge 
> failed. It also becomes tricky to delete the invalid snap. It would seem 
> better if the merge command checked the validity first. 

I agree that it should check for invalid, but looking at
tools/lvconvert.c:_lvconvert_single it clearly doesn't.

The code to check if a snapshot is invalid is a bit cumbersome (from
lib/metadata/lv.c:lv_attr_dup):

        if (lv_info(lv->vg->cmd, lv, 0, &info, 1, 0) && info.exists) {
	   ...
                /* Snapshot dropped? */
                if (info.live_table && lv_is_cow(lv) &&
                    (!lv_snapshot_percent(lv, &snap_percent) ||
                     snap_percent == PERCENT_INVALID)) {
                        repstr[0] = toupper(repstr[0]);
                        if (info.suspended)
                                repstr[4] = 'S'; /* Susp Inv snapshot */
                        else
                                repstr[4] = 'I'; /* Invalid snapshot */
                }

Seems we don't have this check for invalid snapshot factored out for
lvconvert to easily consume.

Anyway, we just need to work through the proper fix.  Thanks for
reporting the issue!

> I also have a question. The error message from lvconvert suggests that the 
> snap might become invalid <during>  the merge. If that happens does the origin 
> get scrambled?

Can you please be more specific on which error message you're referring
to?

Thanks,
Mike
