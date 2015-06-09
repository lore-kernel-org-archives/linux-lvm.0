Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t59KEMDR031871
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 9 Jun 2015 16:14:22 -0400
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mx1.redhat.com (Postfix) with ESMTPS id 4567B3679CA
	for <linux-lvm@redhat.com>; Tue,  9 Jun 2015 20:14:21 +0000 (UTC)
Received: from [192.168.0.31] (unknown [97.123.170.177])
	(Authenticated sender: georges.giralt)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 93D794B0239
	for <linux-lvm@redhat.com>; Tue,  9 Jun 2015 22:12:02 +0200 (CEST)
Message-ID: <55774918.8020009@free.fr>
Date: Tue, 09 Jun 2015 14:14:16 -0600
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
References: <CACaajQvSK0tgLjCCy5Fu-pWFMCWtGUBSnNZFA=NjECRPwBQCgg@mail.gmail.com>	<55761DE0.6070204@free.fr>
	<CAE8gLhkFBO4bS=3gzS6aL-QwCjrn3yGKb7p4ut9TuvBFJv325w@mail.gmail.com>
In-Reply-To: <CAE8gLhkFBO4bS=3gzS6aL-QwCjrn3yGKb7p4ut9TuvBFJv325w@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvm raid1
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Hello MegaBrutal,
You wrote for mdadm :

Le 09/06/2015 13:00, MegaBrutal a écrit :
> – All of your disks need to be of the same size.
This is not true.
The md will have the smallest size of the disks. (Behavior which is 
mandatory because modern disks DO NOT have exactly the same capacity 
even if same P/N... )
This behavior is useful to increase capacity : you add one bigger disk, 
synchronize the array then do the same with the second disk. When the 
array is in sync you can extend it to the size of the new disks. Then 
extend the VG to tell it has bigger PV than before et voila !
I use this in production on a couple of servers for 10 years and it is 
perfect.
Of course if you are trying to get all the speed possible it may not 
compete with a dedicated array card.
Hope this helps

-- 
If the only tool you have is a hammer, you tend to see every problem as a nail.
                 Abraham Maslow
A British variant :
Any tool can serve as a hammer but a screwdriver makes the best chisel.
