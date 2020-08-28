References: <1598544320-3198-1-git-send-email-heming.zhao@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <128df0c3-beeb-7f8a-e611-e1372185209c@redhat.com>
Date: Fri, 28 Aug 2020 18:04:44 +0200
MIME-Version: 1.0
In-Reply-To: <1598544320-3198-1-git-send-email-heming.zhao@suse.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] lib/metadata: add new api lv_is_available()
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Zhao Heming <heming.zhao@suse.com>
Cc: teigland@sourceware.org

Dne 27. 08. 20 v 18:05 Zhao Heming napsal(a):
> It commit is enhancement for 1d0dc74f9147e3c1f3681efa4166cbe2edcb6571
> 1d0dc74f9147 only supports all raid type, this commit adds new api
> and extends support scope with linear/mirror type.
> 
> This patch introduced a new flag NOT_AVAIL_LV, when a lv (includeing
> sub-lv or child-lv) doesn't work, this flag will set.
> 
> With this patch, for linear type LV, one of two disks missing,
> lvdisplay will show
> from:
>    LV Status              available (partial)
> to:
>    LV Status              NOT available (partial)
> 

Hi



LV 'available' has one simple meaning - LV is present in DM table.
Status is either available or NOT available.

Partially is completely different flag.

Please do not mix existing logic and existing script with some new unknown args.


Also note - preferred usage is 'lvs'  - lvdisplay is mostly a backward 
compatible tool with sometimes 'easier' to get some info - but normally all
the info should be obtained with 'lvs'  tool which is highly configurable
and support much easier output for parsing in scripts.
(lvdisplay is missing TONS of attributes otherwise accessible with lvs)


Regards


Zdenek
