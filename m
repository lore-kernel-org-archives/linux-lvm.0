References: <1806055156.426333.1505228581063.ref@mail.yahoo.com>
	<1806055156.426333.1505228581063@mail.yahoo.com>
	<f7d5f3b9-20fc-8043-2599-49946a598e5a@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <4eedd3e5-2284-1013-19a5-7463689c0bbe@redhat.com>
Date: Wed, 13 Sep 2017 00:41:26 +0200
MIME-Version: 1.0
In-Reply-To: <f7d5f3b9-20fc-8043-2599-49946a598e5a@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>

Dne 12.9.2017 v 19:09 Gionatan Danti napsal(a):
> Hi,
> 

> The default combination is automatically the most tested one. This will really 
> pay off when you face some unexptected bug/behavior
> 
>> And yet you persist on using the dumbest combo available: thin + xfs. No 
>> offense to LVM Thin, it works great WHEN used correctly. To channel Apple, 
>> "you're holding it wrong".
> 
> This is what RedHat is heavily supporting. I see nothing wrong with thin + 
> XFS, and both thinp and XFS developers confirm that.
> 
> Again: maybe I am missing something?

There are maybe few worthy comments - XFS is great on stanadar big volumes, 
but there used to be some hidden details when used on thinly provisioned 
volumes on older RHEL (7.0, 7.1)

So now it depend how old distro you use (I'd probably highly recommend upgrade 
to RH7.4 if you are on RHEL based distro)

Basically 'XFS' does not have similar 'remount-ro' on error behavior which 
'extX' provides - but now XFS knows how to shutdown itself when meta/data 
updates starts to fail - although you may need to tune some 'sysfs' params to 
get 'ideal' behavior.

Personally for smaller sized thin volumes I'd prefer 'ext4' over XFS - unless 
you demand some specific XFS feature...

Regards


Zdenek
