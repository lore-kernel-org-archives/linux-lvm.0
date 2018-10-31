References: <5BD95751020000F90003DE16@prv1-mh.provo.novell.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <e63d8847-7218-0b5c-e622-7377d0ae229b@redhat.com>
Date: Wed, 31 Oct 2018 11:08:34 +0100
MIME-Version: 1.0
In-Reply-To: <5BD95751020000F90003DE16@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] About --mirrorlog mirrored option in the latest lvm2
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <ghe@suse.com>

Dne 31. 10. 18 v 8:18 Gang He napsal(a):
> Hello List,
> 
> As you know, in the past versions(e.g. v2.02.120), lvcreate supports creating a mirror type LV with "--mirrorlog mirrored" option,
> But in the latest versions(e.g. v2.02.180), lvm2 says "mirrored is a persistent log that is itself mirrored, but should be avoided. Instead, use the raid1 type for log redundancy."
> Then,  my questions are as below,
> 1)The latest lvm2 does not allow creating this kind of LV, or just not recommended?
> In my test environment, it looks that LVM2 can not create this kind of LV.
> tb0307-nd1:/ # lvcreate --type mirror -m1 --mirrorlog mirrored -L 2G -n mirr-lv cluster-vg2
>    Log type, "mirrored", is unavailable to cluster mirrors.
> 
> 2)If we can not create this kind of LV, how can we migrate these existing LVs after we upgrade LVM2 to the latest version (e.g. v2.02.180)?
> e.g. we need to convert this kind of LV to "RAID1 type LV, I want to know if there is a suggested guide for this scenario.
> 

Hi

In general -  users should be creating '--type raid1'   mirrors - user get 
this type automatically when asks for a mirrored LV for long time already.
(lvcreate -m1)  (and old --type mirror only when explicitly set with --type 
parameter).

Mirrored log type had several mostly unfixable design issues - thus it's 
support is marked as deprecated - you still can activate it - but you cannot 
create it as a new device anymore.

In practices users should convert type 'raid1' types  (via lvconvert) - since 
its support for log per leg is believed to be better approach and it's also 
faster.

The only remaining place where the old mirror does not have yet replacement is 
clustered mirror with cmirrord - so only here user should keep running old 
mirror type (but it's believed users are shifting to other technologies giving 
better performance i.e. gluster)

Zdenek
