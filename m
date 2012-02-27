Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q1RK8OX0009593
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2012 15:08:25 -0500
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1RK8O76003567
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2012 15:08:24 -0500
Date: Mon, 27 Feb 2012 14:08:21 -0600
From: Ray Morris <support@bettercgi.com>
Message-ID: <20120227140821.3a093536@bettercgi.com>
In-Reply-To: <CANSbrroLh0NW1BRAeFGzC2J9EcdQZ8+FX-Hvh+ASPZ5CKJGZmg@mail.gmail.com>
References: <CANSbrroLh0NW1BRAeFGzC2J9EcdQZ8+FX-Hvh+ASPZ5CKJGZmg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [Linux-lvm] Need help in understanding the logical
 to physical mapping by LVM
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: talk2anuj@gmail.com

> I want to understand how LVM maps a logical address to physical
> address. 

Look in /etc/lvm/backup/* to see the actual map.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Sat, 25 Feb 2012 16:53:42 -0500
Anuj Goel <talk2anuj@gmail.com> wrote:

> Hi guys,
> I want to understand how LVM maps a logical address to physical
> address. I have downloaded the LVM code, but cannot figure out which
> files to look into.
> 
> Can you please give some suggestions.
> 
