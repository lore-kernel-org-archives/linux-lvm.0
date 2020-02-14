Date: Fri, 14 Feb 2020 13:11:15 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20200214191115.GA20792@redhat.com>
References: <098d6e8d-2d2c-5067-1435-eefd7e2d09bc@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <098d6e8d-2d2c-5067-1435-eefd7e2d09bc@suse.com>
Subject: Re: [linux-lvm] commit c527a0cbfc3 may have a bug
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
To: "heming.zhao@suse.com" <heming.zhao@suse.com>
Cc: linux-lvm@redhat.com

On Fri, Feb 14, 2020 at 11:13:04PM +0800, heming.zhao@suse.com wrote:
> Hello list & David,
> 
> The stable-2.02 branch commit c527a0cbfc391645d30407d2 may intruduce a bug.
> There is a new function label_scan_pvscan_all(), which uses
> cmd->lvmetad_filter to create devices list for scan.
> 
> code:
> ```
> label_scan_pvscan_all
>  if (!(iter = dev_iter_create(cmd->lvmetad_filter, 0)))
>  ... ...
>  while ((dev = dev_iter_get(iter)))
>  ... ...
> ```
> 
> It looks it is wrong to use cmd->lvmetad_filter in label_scan_pvscan_all.
> The behaviour is changed after the patch applied. (legacy code use
> cmd->full_filter)

Hi, it looks like a bug led to an incorrect filter configuration actually
working for a period of time.  When the bug was later fixed, the incorrect
filter became apparent.  In summary, the correct way to exclude devs from
lvmetad (and to handle duplicate PVs) is to set global_filter; filter is
not meant to work for that.

Here's the best comment to refer to:

 *   - cmd->lvmetad_filter - the lvmetad filter chain used when scanning devs for lvmetad update:
 *     sysfs filter -> internal filter -> global regex filter -> type filter ->
 *     usable device filter(FILTER_MODE_PRE_LVMETAD) ->
 *     mpath component filter -> partitioned filter ->
 *     md component filter -> fw raid filter
 *
 *   - cmd->filter - the filter chain used for lvmetad responses:
 *     persistent filter -> regex_filter -> usable device filter(FILTER_MODE_POST_LVMETAD)
 *
 *   - cmd->full_filter - the filter chain used for all the remaining situations:
 *     cmd->lvmetad_filter -> cmd->filter

pvscan --cache, which populates lvmetad, should be using
cmd->lvmetad_filter (which includes global_filter config, but not the
filter config.)  So, label_scan_pvscan_all() looks like it should be
correct.

Before c527a0cbfc391645d30407d2, pvscan --cache called label_scan() which
uses cmd->full_filter (a combination of global_filter config and filter
config.)  Afterward, pvscan --cache calls label_scan_pvscan_all() which
uses cmd->lvmetad_filter.  So, that commit should be fixing the behavior
of pvscan.

> When system has duplicated devices and startup, with patch c527a0cb, the
> duplicated devs will pass global_filter (usually it's empty). It makes
> lvmetad fail to build up LV, then the system boot failed. This case is not
> my imagination, one of our customer met recently.

Setting global_filter is the correct way to handle duplicate devices,
setting the filter config shouldn't affect pvscan --cache.

> So I suggest to change the cmd->lvmetad_filter to cmd->full_filter in
> label_scan_pvscan_all().
> 
> The steps to reproduce:
> ```
> create a loop dev.
> use this loop to create some mapper devs. (share the same loop dev)
> pvcreate on these mapper devs
> 
> # this cmd will output warning msg.
> pvscan --cache --config ' devices { filter = [ "r|/dev/loop0|" } '
> # this cmd will not output warning msg.
> pvscan --cache --config ' devices { filter = [ "a|/dev/loop0|" ]
> global_filter = [ "r|/dev/loop0|" ] } '
> ```

The best option would be:
pvscan --cache --config ' devices { global_filter = [ "r|/dev/loop0|" } '

I have /dev/loop0 and a dm wrapper of it called /dev/mapper/loop0idm.

The best config works as expected:
# pvscan --cache --config "devices {global_filter=[\"r|/dev/loop0|\"]}" -vvvv 2>&1| grep -e 'Scan metadata from' -e WARNING
#cache/lvmetad.c:2292    Scan metadata from dev /dev/loop1
#cache/lvmetad.c:2292    Scan metadata from dev /dev/loop2
#cache/lvmetad.c:2292    Scan metadata from dev /dev/mapper/loop0idm

This config should work, but setting filter is unnecessary:
# pvscan --cache --config "devices {filter=[\"a|/dev/loop0|\"] global_filter=[\"r|/dev/loop0|\"]}" -vvvv 2>&1| grep -e 'Scan metadata from' -e WARNING
#cache/lvmetad.c:2292    Scan metadata from dev /dev/loop1
#cache/lvmetad.c:2292    Scan metadata from dev /dev/loop2
#cache/lvmetad.c:2292    Scan metadata from dev /dev/mapper/loop0idm

This config is not expected to work:
# pvscan --cache --config "devices {filter=[\"r|/dev/loop0|\"]}" -vvvv 2>&1| grep -e 'Scan metadata from' -e WARNING
#cache/lvmetad.c:2292    Scan metadata from dev /dev/loop0
#cache/lvmetad.c:2292    Scan metadata from dev /dev/loop1
#cache/lvmetad.c:2292    Scan metadata from dev /dev/loop2
#cache/lvmetad.c:2292    Scan metadata from dev /dev/mapper/loop0idm
#cache/lvmcache.c:1615    WARNING: found device with duplicate /dev/mapper/loop0idm
#cache/lvmcache.c:1617    WARNING: Disabling lvmetad cache which does not support duplicate PVs.
#cache/lvmetad.c:2486    WARNING: Scan found duplicate PVs.
#pvscan.c:515     WARNING: Not using lvmetad because cache update failed.
