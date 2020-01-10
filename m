References: <20200102191952.1a2c44a7@kaperfahrt.nebelschwaden.de>
	<f494aa7f-86bd-68b3-140e-805dccc0dad0@redhat.com>
	<a2629915-9caf-75b5-ea54-171bd6b51dc3@nebelschwaden.de>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <f89a2098-0891-060d-f1e3-ac2c0fd683db@redhat.com>
Date: Fri, 10 Jan 2020 17:51:18 +0100
MIME-Version: 1.0
In-Reply-To: <a2629915-9caf-75b5-ea54-171bd6b51dc3@nebelschwaden.de>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] thinpool metadata got way too large, how to handle?
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: listac@nebelschwaden.de, LVM general discussion and development <linux-lvm@redhat.com>

Dne 10. 01. 20 v 17:30 Ede Wolf napsal(a):
> Hello,
> 
> I am afraid I have been a bit too optimistic. Being a bit embarassed, but I am 
> not not able to find any reference to component activation. I've deactivated 
> all LVs and tried to set the thinpool itself or its metadata into read only mode:
> 
> # lvchange -pr VG_Raid6/ThinPoolRaid6
>  � Command on LV VG_Raid6/ThinPoolRaid6 uses options invalid with LV type 
> thinpool.
>  � Command not permitted on LV VG_Raid6/ThinPoolRaid6.
> 
> # lvchange -pr /dev/mapper/VG_Raid6-ThinPoolRaid6_tmeta
>  � Operation not permitted on hidden LV VG_Raid6/ThinPoolRaid6_tmeta.
> 
> I can lvchange -an the thinpool, but then obviously I have no path/file for 
> for the thin_repair input anynmore that I could provide.
> 
> So please, how do I properly set the metadata into read only?
> 

Your lvm2 is too old   (component activation is relatively new feature)

In this case you need to simply 'swap-out'  your existing _tmeta into a 
regular LV.


Easy to do -

Just create any LV you want -   lvcreate -an -L1 -n mytestlv vg

then 'swap' content of _tmeta with mytestvl  with:

lvconvert --thinpool  vg/poolname  --poolmetadata  vg/mytestlv


and now  vg/mytestlv should be you 2.2TiB metadata volume you can easily activate.


Regards

Zdenek
