Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA8Jmkgb005651
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 8 Nov 2015 14:48:46 -0500
Received: from bugzy.highpoweredhelp.com
	(173-165-161-162-atlanta.hfc.comcastbusiness.net [173.165.161.162])
	by mx1.redhat.com (Postfix) with ESMTP id 0FF7414AA2
	for <linux-lvm@redhat.com>; Sun,  8 Nov 2015 19:48:46 +0000 (UTC)
Received: from ABRAHAM.highpoweredhelp.local (highpoweredhelp.com
	[173.165.161.161])
	by bugzy.highpoweredhelp.com (Postfix) with ESMTPS id A9051C5E
	for <linux-lvm@redhat.com>; Sun,  8 Nov 2015 14:45:57 -0500 (EST)
Received: from [IPv6:::1] (localhost [IPv6:::1])	by d7.highpoweredhelp.local
	(Postfix) with ESMTP id D27921E0187	for <linux-lvm@redhat.com>;
	Sun,  8 Nov 2015 14:48:44 -0500 (EST)
Message-ID: <563FA71C.90903@highpoweredhelp.com>
Date: Sun, 8 Nov 2015 14:48:44 -0500
From: Michael Munger <michael@highpoweredhelp.com>
MIME-Version: 1.0
References: <563F8940.3020706@highpoweredhelp.com> <563FA45F.4030105@gmail.com>
In-Reply-To: <563FA45F.4030105@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] dd on a lv?
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


On 11/08/2015 02:37 PM, Zdenek Kabelac wrote:
> Please check you compare sizes in same 'units'
>
> dd  reports sizes in  1000 units
> while lvm2  normally in 1024
>
>
> And basically if you want to hear any 'analysis' - you need to show us
>
> 'dmsetup table' 

This makes sense, and may be what the other poster was saying, but I
mis-understood them to have it backwards. If dd is reporting TB (base
1000) and lvm2 is reporting TiB (base 1024), then that's the answer.

Thanks!
