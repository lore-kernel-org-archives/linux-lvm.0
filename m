References: <CAB5m+-G_sxm1SGOHc=f-kYOYnfnG+EOa1DmDSdY46NXQsX72tQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <dc535785-8408-6f82-1af6-fbed596141cc@redhat.com>
Date: Wed, 28 Nov 2018 12:05:54 +0100
MIME-Version: 1.0
In-Reply-To: <CAB5m+-G_sxm1SGOHc=f-kYOYnfnG+EOa1DmDSdY46NXQsX72tQ@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm.conf backup section
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Far Had <farhadk.it@gmail.com>

Dne 28. 11. 18 v 10:51 Far Had napsal(a):
> Hi
> There are two parameters in lvm.conf which I don't understand the exact 
> meaning of.
> 
> 1. retain_min
> 2. retain_days
> 
> What do "*the minimum number of archive files you wish to keep*" and "*minimum 
> time you wish to keep an archive file for*" mean?
> Is there any auto deletion mechanism for backup archives?

Hi


There is kept history for 'created' VGs, where you can specify how many
and for how long archives for individual VG you want to store.

This works reasonably well if you use 'same VG names' all the time.

However - when you use lvm2 on some testing machine where the VG name is 
essentially some random hash md5 lengthy string - you will sooner or later end 
with gazillion archive files in your /etc/lvm/archive directory.

In this case it's admins responsibility to prune VG archive files that are no 
longer necessary.

lvm2 has no idea if the VG named like: "myvg01320982woicdo8uagcd97wghcd"
will be still ever needed again - so such archives are kept mostly forever....

Every command you run which modifies metadata of particular VG does care only 
about that particular VG and it's archives.

Hopefully this explains it.

Regards

Zdenek
