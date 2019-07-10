From: Gang He <GHe@suse.com>
Date: Wed, 10 Jul 2019 06:20:20 +0000
Message-ID: <CH2PR18MB32067D902531083C0467C94BCFF00@CH2PR18MB3206.namprd18.prod.outlook.com>
References: <CH2PR18MB3206304CD1B8DB908666342FCFF50@CH2PR18MB3206.namprd18.prod.outlook.com>
	<fe79eea6-0202-c412-0b3f-19beb3c2157c@redhat.com>
In-Reply-To: <fe79eea6-0202-c412-0b3f-19beb3c2157c@redhat.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] "Unknown feature in status" message when running
 lvs/lvdisplay against cached LVs
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
To: Marian Csontos <mcsontos@redhat.com>, LVM general discussion and
	development <linux-lvm@redhat.com>

Hi Marian,

Thank for your helps, the patch is effective to fix this error message.

Thanks
Gang

-----Original Message-----
From: Marian Csontos [mailto:mcsontos@redhat.com] 
Sent: 2019年7月8日 16:37
To: LVM general discussion and development <linux-lvm@redhat.com>; Gang He <GHe@suse.com>
Subject: Re: [linux-lvm] "Unknown feature in status" message when running lvs/lvdisplay against cached LVs

On 7/5/19 11:20 AM, Gang He wrote:
> Hi Guys,
> 
> I uses lvm2-2.02.180, I got an error message when running lvs/lvdisplay against cached LVs.
> e.g.
> linux-v5ay:~ # lvs
>    Unknown feature in status: 8 1324/8192 128 341/654272 129 151 225 1644 0 341 0 3 metadata2 writethrough no_discard_passdown 2 migration_threshold 2048 smq 0 rw -
>    LV   VG     Attr       LSize  Pool       Origin       Data%  Meta%  Move Log Cpy%Sync Convert
>    home system -wi-ao---- 17.99g
>    root system Cwi-aoC--- 20.00g [lvc_root] [root_corig] 0.05   16.16           0.00
>    swap system -wi-ao----  2.00g

You need this patch:

https://sourceware.org/git/?p=lvm2.git;a=commit;h=adf9bf80a32500b45b37eb24b98fa7c2c933019e

Kernel introduced a new feature which is not recognized by lvm versions released before the kernel (which is anything up to latest 2.02.185). 
This will be included in the next lvm release.

-- Marian

> 
> The bug can be reproduced stably with the below steps.
> Have a (virtual) machine with 2 disk drives Install os with LVM as 
> root volume Then, add the second disk after os is installed.
> # pvcreate /dev/sdb
> # vgextend system /dev/sdb
> # lvcreate --type cache-pool -l 100%FREE -n lvc_root system /dev/sdb # 
> lvconvert --type cache --cachepool system/lvc_root system/root then 
> run `lvs` or `lvdisplay` command to trigger the issue
> 
> 
> Thanks
> Gang
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
