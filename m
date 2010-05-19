Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JGSp1M018005
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:28:51 -0400
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JGSfil016575
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:28:42 -0400
Message-ID: <4BF411B5.1020408@alteeve.com>
Date: Wed, 19 May 2010 12:28:37 -0400
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
References: <059801caf769$fc848350$f58d89f0$@com>	<4BF40A8B.2000201@alteeve.com>
	<05bd01caf76d$b45892c0$1d09b840$@com>
In-Reply-To: <05bd01caf76d$b45892c0$1d09b840$@com>
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
Cc: kevin <k@kevinkevin.com>

On 10-05-19 12:09 PM, kevin wrote:
>> The mkfs isn't supposed to be there, just set the new drive's partition
>> to type '8e' (Linux LVM).
>
> Thanks for the quick response. So to recap, for a 144gb drive (/dev/sda1) :
>
> 1. fdisk /dev/sda1 type 8e
> 2. pvcreate /dev/sda1
> 3. vgextend existing_group_name /dev/sda1
> 4. lvextend -L+144G /dev/VolGroup00/existing_group_name
>
> Does that look correct?
>
> Thanks so much once again,
>
> Kevin

Hi Kevin,

   I've been meaning to add this process to my wiki for a while now. 
This is as good a time as any, so take a gander here:

http://wiki.alteeve.com/index.php/Adding_Space_to_an_LVM

   Note that it's a copy-pasted from some of my other docs, so some of 
it will reference non-existing things, but the steps should all be there.

-- 
Digimer
E-Mail:         linux@alteeve.com
AN!Whitepapers: http://alteeve.com
Node Assassin:  http://nodeassassin.org
