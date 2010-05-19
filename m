Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JFwHQL009716
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 11:58:18 -0400
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JFw8Ea011041
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 11:58:08 -0400
Message-ID: <4BF40A8B.2000201@alteeve.com>
Date: Wed, 19 May 2010 11:58:03 -0400
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
References: <059801caf769$fc848350$f58d89f0$@com>
In-Reply-To: <059801caf769$fc848350$f58d89f0$@com>
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

On 10-05-19 11:43 AM, kevin wrote:
> Howdy,
>
> (fdisk+mkfs+pvcreate+vgextend+lvextend) is the right way to go about adding

The mkfs isn't supposed to be there, just set the new drive's partition 
to type '8e' (Linux LVM).

-- 
Digimer
E-Mail:         linux@alteeve.com
AN!Whitepapers: http://alteeve.com
Node Assassin:  http://nodeassassin.org
