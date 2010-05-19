Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JIPPwR015536
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 14:25:25 -0400
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JIPF6F003990
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 14:25:16 -0400
Message-ID: <4BF42D06.7040100@alteeve.com>
Date: Wed, 19 May 2010 14:25:10 -0400
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
References: <1274290530.16893.13@raydesk1.bettercgi.com>
In-Reply-To: <1274290530.16893.13@raydesk1.bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Ray Morris <support@bettercgi.com>

On 10-05-19 01:35 PM, Ray Morris wrote:
>> lvextend -L+144G /dev/VolGroup00/my_volume
>
> If you want to use all available space:
>
> lvextend -L+100%FREE /dev/VolGroup00/my_volume

As Richard pointed out, using '+100%FREE' calls for the small 'l', not 
L. The capital L is used when specifying a fixed size.

-- 
Digimer
E-Mail:         linux@alteeve.com
AN!Whitepapers: http://alteeve.com
Node Assassin:  http://nodeassassin.org
