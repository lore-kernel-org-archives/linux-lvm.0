From: Heming Zhao <heming.zhao@suse.com>
Date: Thu, 5 Sep 2019 12:35:53 +0000
Message-ID: <370ba3fa-53df-7213-8876-d37ef1a3b57e@suse.com>
References: <c88b7c49-1046-ae78-4352-fa51e1ef7873@suse.com>
	<20190829143759.GA22659@redhat.com>
	<9280276f-8601-cfbc-db46-1dcb28f92229@suse.com>
	<20190903151705.GA30692@redhat.com>
	<ff7a48ee-221d-d5a3-14ad-074806abf5b8@suse.com>
In-Reply-To: <ff7a48ee-221d-d5a3-14ad-074806abf5b8@suse.com>
Content-Language: en-US
Content-ID: <7D3517E8B53CB041B094C59C3837ABA6@namprd18.prod.outlook.com>
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

Hello David,

Today I may find the key of regression.

In pvscan_cache_cmd, the code in below area "#if 0 .. #endif take a huge 
time. When I used below modified code to boot, the time reduced from 
1min to 1.389s.

The _online_pvscan_one responsible to lvmetad_pvscan_single in lvm2-2.02 
code. But lvmetad_pvscan_single had been removed from lvm2 since 2.03. 
So below if() area looks useless in lvm2-2.03.

pvscan_cache_cmd() //code for git latest version
{
    ...
         if (!dm_list_empty(&add_devs)) {
                 log_print("zhm %s %d", __func__, __LINE__);
                 label_scan_devs(cmd, cmd->filter, &add_devs);

                 dm_list_iterate_items(devl, &add_devs) {
                         dev = devl->dev;

                         if (dev->flags & DEV_FILTER_OUT_SCAN) {
                                 log_print("pvscan[%d] device %s 
excluded by filter.", getpid(), dev_name(dev));
                                 continue;
                         }

                         add_single_count++;
#if 0
                         //zhm: lvm2-2.02 func: lvmetad_pvscan_single()
                         if (!_online_pvscan_one(cmd, dev, NULL, 
complete_vgnames, saved_vgs, 0, &pvid_without_metadata))
                                 add_errors++;
#endif
                 }
         }
    ...
}

Thanks


On 9/4/19 4:13 PM, Heming Zhao wrote:
> Thanks for you reply.
> 
> I found the latest lvm2 git source code contains your 3 commits. So I
> built lvm2 with today's git code. But there is no big change as before.
> 
> ENV: fedora30 server edition, 896 PVs.
> 
> All below results from today's work.
> 
> [with patch]
> event_activation = 1 && obtain_device_list_from_udev = 1
> boot time: 1min 44.295s
> 
> event_activation = 0 && obtain_device_list_from_udev = 0
> boot time: 59.759s
> 
> [without patch]
> event_activation = 1 && obtain_device_list_from_udev = 1
> boot time: 1min 56.040s
> 
> event_activation = 0 && obtain_device_list_from_udev = 0
> boot time: 1min 6.715s
> 
> Thanks.
> 
> On 9/3/19 11:17 PM, David Teigland wrote:
>> On Tue, Sep 03, 2019 at 05:02:25AM +0000, Heming Zhao wrote:
>>> Test result URL:
>>> https://gist.github.com/zhaohem/f9951bb016962cdd07bf7c9d3d7fd525
>>
>> At least part of the problem is caused by lvm waiting on udev, e.g.
>> WARNING: Device /dev/vdf76 not initialized in udev database even after waiting 10000000 microseconds.
>>
>> I recently wrote this patch to stop that:
>> https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=0534cd9cd4066c88a7dd815f2f3206a177169334
>>
>> With this older patch, obtain_device_list_from_udev=0 can also help avoid it:
>> https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=3ebce8dbd2d9afc031e0737f8feed796ec7a8df9
>>
>> Also, I just pushed out this commit that makes the pvscan activations
>> faster when there are many PVs:
>> https://sourceware.org/git/?p=lvm2.git;a=commit;h=25b58310e3d606a85abc9bd50991ccb7ddcbfe25
>>
>> Dave
>>
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
