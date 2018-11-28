References: <CAB5m+-G_sxm1SGOHc=f-kYOYnfnG+EOa1DmDSdY46NXQsX72tQ@mail.gmail.com>
	<dc535785-8408-6f82-1af6-fbed596141cc@redhat.com>
	<CAB5m+-F78BJYr-jVerNqAW-h8ZPSmt=hmG9FCigRVFk3KXC2yA@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <efff92af-60d9-fed7-4418-6f252994d781@redhat.com>
Date: Wed, 28 Nov 2018 13:24:46 +0100
MIME-Version: 1.0
In-Reply-To: <CAB5m+-F78BJYr-jVerNqAW-h8ZPSmt=hmG9FCigRVFk3KXC2yA@mail.gmail.com>
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
To: Far Had <farhadk.it@gmail.com>
Cc: linux-lvm@redhat.com

Dne 28. 11. 18 v 13:18 Far Had napsal(a):
> Thanks for the response,
> but I still don't get the point. Assume that I use same names for my VGs, In 
> this case if I do for example:
> /retain_days = 10/
> and
> /retain_min = 15/
> in lvm.conf file, what is the system's behaviour when archiving backup files? 
> Please explain specifically.

Hi

Archive file should be kept for at least 10 days, and there should be kept at 
least 15 archive files.

So in better example:

If you have i.e. many files generated daily - this makes sure you should have 
files at least 10 days back as well  (otherwise it could happen you could have 
backup only from last few recent commands)

If you run lvm2 modifying commands very occasionally - you should still have 
at least 15 historical archives  (otherwise it could happen you could have 
very few archives if any....)

As you can see both are 'arming' at slightly different work flow.

Regards

Zdenek
