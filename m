Message-ID: <5301CFAA.5050206@redhat.com>
Date: Mon, 17 Feb 2014 10:00:26 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CACOqYcnRf_7NGKVObo-uQb0Dvzbmd+ntkZ_PPGe4QmRrgTx_SQ@mail.gmail.com>
In-Reply-To: <CACOqYcnRf_7NGKVObo-uQb0Dvzbmd+ntkZ_PPGe4QmRrgTx_SQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Converting existing thick LVs into thin LVs
	possible?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, jeremy@esilo.com

Dne 14.2.2014 20:21, Jeremy Smith napsal(a):
> I have a system currently using LVM2 that was originally set up on
> RHEL5 (where thin provisioning was not supported).
> This system would greatly benefit from the newer thin provisioning
> features, and so I am investigating upgrading to RHEL6 so that I may
> take advantage. My question is this: Can I convert existing LVM2
> "thick" logical volumes into thinly-provisioned volumes on the fly?
>
> This page:
>   https://access.redhat.com/site/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Logical_Volume_Manager_Administration/thinly_provisioned_volume_creation.html
>
> lead me to believe that it is possible:
>   "You can use the --thinpool parameter of the lvconvert command to
> convert an existing logical volume to a thin volume."
>
> with the following:
>
>   lvconvert --thinpool vg001/lv1 --poolmetadata vg001/lv2


Sounds like misunderstanding which needs fix/enhancement of this doc page  - 
we will need to enhance lvconvert command to write big warning about this 
operation.

This conversion is converting  volume to 'data' volume - but it's not about
preserving content of LV1 as  LV1 - it will serve as en empty pool.

The primary purpose is - you can build 'any' type of LV for data volume
and 'any' type of LV for metadata volume (i.e. special layout for raid/mirror)
and then you 'create' for these 2 volumes your thin pool - since normally
you can't create mirrored data & metadata volumes and thin pool in 1 command,
and you can't easily select where the metadata should be placed
(i.e. data on spindle, metadata on SSD).

>
> Am I doing something wrong here?
> Or am I going to have to create a new thin pool, new thin logical
> volumes, and copy the data over?

There is not yet support for direct conversion of LV to thin-LV.
The only currently supported method is to use your  thick-LV as an external 
origin LV for your  thin-LV volume.

i.e. you create your  thin-pool  LV  + and then thin-LV volume with external 
origin that will use original thick-LV  (external origin need to be read-only 
volume)

Here are the conversion steps:

lvcreate -Lsize_of_data_pool -T vg/pool
lvconvert -T  vg/thick_LV --originname new_thick_LV_name --thinpool  vg/pool

Disadvantage here is you cannot merge changes from thin volume back to 
original thick volume. You can however remove  thin-LV and use again your 
thick-LV as normal volume - i.e. thin-LV is basically snapshot.

Now hint for recovery - if you have not yet written anything to thin-LV from 
newly create thin-pool.  You could restore back to your previous configuration
via   vgcfgrestore --force.

Zdenek
