Date: Tue, 17 Nov 2020 09:45:16 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20201117154516.GA18257@redhat.com>
References: <a966550b-aacc-85bc-da74-d34a3e4ccd99@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a966550b-aacc-85bc-da74-d34a3e4ccd99@suse.com>
Subject: Re: [linux-lvm] issue about return value in
	_lvchange_activate_single
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
Cc: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Nov 17, 2020 at 11:52:28AM +0800, heming.zhao@suse.com wrote:
> In lvm functions, it treats "return 0" as error case.
> 
> if _lvchange_activate() return ECMD_FAILED, the caller _lvchange_activate_single() think as normal:
> ```
> if (!_lvchange_activate(cmd, lv)) <== ECMD_FAILED is 5, won't enter if case.
>         return_ECMD_FAILED;

Thanks for finding that.  In some places 0 is the error value and in other
places ECMD_FAILED is the error value; they frequently get mixed up.
I believe this is the bug you are seeing:
https://sourceware.org/git/?p=lvm2.git;a=commit;h=aba9652e584b6f6a422233dea951eb59326a3de2

> 2. node2 change the systemid to itself
> 
> ```
> [tb-clustermd2 ~]# vgchange -y --config "local/extra_system_ids='tb-clustermd1'" --systemid tb-clustermd2 vg1
>   Volume group "vg1" successfully changed
> [tb-clustermd2 ~]# lvchange -ay vg1/lv1
> [tb-clustermd2 ~]# dmsetup ls
> vg1-lv1 (254:0)

This is what the LVM-activate resource agent does, except it wouldn't be
done while the LV is active on another running host.  Just wanted to
clarify that, I don't think it's the point of your illustration here.

> 3. this time both sides have dm device.
> ```
> [tb-clustermd1 ~]# dmsetup ls
> vg1-lv1 (254:0)
> [tb-clustermd2 ~]# dmsetup ls
> vg1-lv1 (254:0)
> ``` 

For the sake of anyone looking at this later, this shouldn't happen in a
properly running cluster.  (If you wanted the LV active on two hosts at
once, you'd use lvmlockd and no system ID on the VG.)

> 4. node1 executes lvchange cmds. please note the return value is 0
> ```
> [tb-clustermd1 ~]# lvchange -ay vg1/lv1 ; echo $?
>   WARNING: Found LVs active in VG vg1 with foreign system ID tb-clustermd2.  Possible data corruption.
>   Cannot activate LVs in a foreign VG.
> 0

That's the one fixed by the commit above.

Dave
