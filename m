From: Heming Zhao <heming.zhao@suse.com>
Date: Fri, 6 Sep 2019 04:31:44 +0000
Message-ID: <faa66217-fc52-5785-1ca9-d73b13727c12@suse.com>
References: <c88b7c49-1046-ae78-4352-fa51e1ef7873@suse.com>
	<20190829143759.GA22659@redhat.com>
	<9280276f-8601-cfbc-db46-1dcb28f92229@suse.com>
	<20190903151705.GA30692@redhat.com>
	<ff7a48ee-221d-d5a3-14ad-074806abf5b8@suse.com>
	<370ba3fa-53df-7213-8876-d37ef1a3b57e@suse.com>
	<20190905165519.GB30473@redhat.com>
In-Reply-To: <20190905165519.GB30473@redhat.com>
Content-Language: en-US
Content-ID: <6DD83F0198351A4CBEFB0B2C9615AB1A@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] system boot time regression when using lvm2-2.03.05
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
To: David Teigland <teigland@redhat.com>
Cc: Martin Wilck <mwilck@suse.de>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>

The status:
```
[root@f30-lvmroot ~]# systemd-analyze blame | less
[root@f30-lvmroot ~]# pvs | tail -n 5
   /dev/vdh95  vgtst-54           lvm2 a--   4.00m 4.00m
   /dev/vdh96  vgtst-54           lvm2 a--   4.00m 4.00m
   /dev/vdh97  vgtst-55           lvm2 a--   4.00m    0
   /dev/vdh98  vgtst-55           lvm2 a--   4.00m 4.00m
   /dev/vdh99  vgtst-55           lvm2 a--   4.00m 4.00m
[root@f30-lvmroot ~]# vgs | tail -n 5
   vgtst-56            16   1   0 wz--n- 64.00m 60.00m
   vgtst-6             16   1   0 wz--n- 64.00m 60.00m
   vgtst-7             16   1   0 wz--n- 64.00m 60.00m
   vgtst-8             16   1   0 wz--n- 64.00m 60.00m
   vgtst-9             16   1   0 wz--n- 64.00m 60.00m
[root@f30-lvmroot ~]# lvs | tail -n 5
   vgtst-56-lv56 vgtst-56           -wi-a-----    4.00m
   vgtst-6-lv6   vgtst-6            -wi-a-----    4.00m
   vgtst-7-lv7   vgtst-7            -wi-a-----    4.00m
   vgtst-8-lv8   vgtst-8            -wi-a-----    4.00m
   vgtst-9-lv9   vgtst-9            -wi-a-----    4.00m
[root@f30-lvmroot ~]# pvs | wc -l
899
[root@f30-lvmroot ~]# vgs | wc -l
58
[root@f30-lvmroot ~]# lvs | wc -l
60
[root@f30-lvmroot ~]# rpm -qa | grep lvm2
lvm2-devel-2.03.06-3.fc30.x86_64
lvm2-dbusd-2.03.06-3.fc30.noarch
lvm2-2.03.06-3.fc30.x86_64
lvm2-lockd-2.03.06-3.fc30.x86_64
udisks2-lvm2-2.8.4-1.fc30.x86_64
lvm2-libs-2.03.06-3.fc30.x86_64
[root@f30-lvmroot ~]#
```

you can see the 'a' bit of lv attr.


Yesterday I only showed the key change of the modification. below is the complete patch.
1>
comment out calling _online_pvscan_one in pvscan_cache_cmd
2>
partly backout (use "#if 0") your commit: 25b58310e3d606a85abc9bd50991ccb7ddcbfe25
https://sourceware.org/git/?p=lvm2.git;a=commit;h=25b58310e3d606a85abc9bd50991ccb7ddcbfe25

```patch
diff --git a/tools/pvscan.c b/tools/pvscan.c
index b025ae3e6b..52a50af962 100644
--- a/tools/pvscan.c
+++ b/tools/pvscan.c
@@ -928,7 +928,7 @@ static int _online_vg_file_create(struct cmd_context *cmd, const char *vgname)
   * We end up with a list of struct devices that we need to
   * scan/read in order to process/activate the VG.
   */
-
+#if 0
  static int _get_devs_from_saved_vg(struct cmd_context *cmd, char *vgname,
  				   struct dm_list *saved_vgs,
  				   struct dm_list *devs)
@@ -1126,6 +1126,7 @@ out:
  	release_vg(vg);
  	return ret;
  }
+#endif
  
  static int _pvscan_aa(struct cmd_context *cmd, struct pvscan_aa_params *pp,
  		      struct dm_list *vgnames, struct dm_list *saved_vgs)
@@ -1166,7 +1167,9 @@ static int _pvscan_aa(struct cmd_context *cmd, struct pvscan_aa_params *pp,
  		destroy_processing_handle(cmd, handle);
  		return ECMD_PROCESSED;
  	}
-
+#if 1
+	ret = process_each_vg(cmd, 0, NULL, NULL, vgnames, READ_FOR_ACTIVATE, 0, handle, _pvscan_aa_single);
+#else
  	if (dm_list_size(vgnames) == 1) {
  		dm_list_iterate_items(sl, vgnames)
  			ret = _pvscan_aa_direct(cmd, pp, (char *)sl->str, saved_vgs);
@@ -1174,6 +1177,7 @@ static int _pvscan_aa(struct cmd_context *cmd, struct pvscan_aa_params *pp,
  		/* FIXME: suppress label scan in process_each if label scan already done? */
  		ret = process_each_vg(cmd, 0, NULL, NULL, vgnames, READ_FOR_ACTIVATE, 0, handle, _pvscan_aa_single);
  	}
+#endif
  
  	destroy_processing_handle(cmd, handle);
  
@@ -1418,9 +1422,10 @@ int pvscan_cache_cmd(struct cmd_context *cmd, int argc, char **argv)
  			}
  
  			add_single_count++;
-
+#if 0
  			if (!_online_pvscan_one(cmd, dev, NULL, complete_vgnames, saved_vgs, 0, &pvid_without_metadata))
  				add_errors++;
+#endif
  		}
  	}
```


On 9/6/19 12:55 AM, David Teigland wrote:
> On Thu, Sep 05, 2019 at 12:35:53PM +0000, Heming Zhao wrote:
>> In pvscan_cache_cmd, the code in below area "#if 0 .. #endif take a huge
>> time. When I used below modified code to boot, the time reduced from
>> 1min to 1.389s.
> 
> That stops the command from doing any work.  I suspect that in your tests,
> the "fast" case is not doing any activation, and the "slow" case is.
> Please check where the LVs are being activated in the fast case.
> 
> 
