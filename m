From: Joe Thornber <thornber@redhat.com>
Message-ID: <20040219081312.GZ27549@reti>
References: <4033F5E0.F2DE68FD@polymtl.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4033F5E0.F2DE68FD@polymtl.ca>
Subject: [linux-lvm] Re: [dm-devel] Problem extending an "lv" with an active Snapshot
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
Date: Thu Feb 19 10:01:58 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dm-devel@redhat.com
Cc: linux-lvm@redhat.com

This looks like a tools problem, forwarding to linux-lvm@redhat.com.

- Joe


On Wed, Feb 18, 2004 at 06:31:44PM -0500, Christian Robert wrote:
> 
> Problem extending an "lv" with an active Snapshot
> 
> 2.6.2 + udm2
> 
> 
> to recreate:
> 
> # # create a test "lv"
> # lvcreate -L2G -n test vg01
>   Logical volume "test" created
> 
> # # format the "lv"
> # mkreiserfs /dev/vg01/test
>   [...]
> 
> # #create a Snapshot for the test "lv"
> # lvcreate -s -L1G -n Stest /dev/vg01/test
>   Logical volume "Stest" created
> 
> # mount /dev/vg01/test /mnt
> 
> # df /mnt
> Filesystem                1K-blocks       Used  Available  Use%  Mounted
> /dev/mapper/vg01-test       2097084      32840    2064244    2%  /mnt
> 
> 
> # lvextend -L+1G /dev/vg01/test
>   Extending logical volume test to 3.00 GB
>   device-mapper ioctl cmd 9 failed: Invalid argument
>   Couldn't load device 'vg01-Stest'.
>   Problem reactivating test
> # 
> 
> At this point the system is in strange state, trying to unmount /mnt
> will lock the "umount" process. Even reboot don't work.
> 
> 
> # lvdisplay /dev/vg01/{,S}test
>   --- Logical volume ---
>   LV Name                /dev/vg01/test
>   VG Name                vg01
>   LV UUID                ES5ear-aiRx-LwW9-5ZHn-uqwP-dmJI-O5Oxkk
>   LV Write Access        read/write
>   LV snapshot status     source of
>                          /dev/vg01/Stest [active]
>   LV Status              suspended
>   # open                 2
>   LV Size                3.00 GB
>   Current LE             96
>   Segments               2
>   Allocation             next free (default)
>   Read ahead sectors     0
>   Block device           254:94
>    
>   --- Logical volume ---
>   LV Name                /dev/vg01/Stest
>   VG Name                vg01
>   LV UUID                lmxkER-1rkc-Yzr6-js04-igpc-nAXn-d5SDmF
>   LV Write Access        read/write
>   LV snapshot status     active destination for /dev/vg01/test
>   LV Status              suspended
>   # open                 0
>   LV Size                3.00 GB
>   Current LE             96
>   Segments               1
>   Snapshot chunk size    8.00 KB
>   Allocated to snapshot  0.00% 
>   Allocation             next free (default)
>   Read ahead sectors     0
>   Block device           254:97
>    
> 
> 
> 
> Now the question: Is it supposed to work ?  I know for sure that if 
>                   I delete the snapshot before extending the "lv" 
>                   it will work like a charm.
> 
> thanks,
> 
> Xtian.
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
