Received: from [10.34.130.160] (dhcp130-160.brq.redhat.com [10.34.130.160])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t91BQFsC029947
	for <linux-lvm@redhat.com>; Thu, 1 Oct 2015 07:26:16 -0400
References: <560BFF8B.7030006@koolin.ru>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <560D1857.9070909@redhat.com>
Date: Thu, 1 Oct 2015 13:26:15 +0200
MIME-Version: 1.0
In-Reply-To: <560BFF8B.7030006@koolin.ru>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Usable space in PV
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

Dne 30.9.2015 v 17:28 Timofey Koolin napsal(a):
> Task: calc usable space of PV before create PV and before create partition for
> PV.
>
> In my experiments usable space in PV = PVSize / ExtentSize * ExtentSize with
> integer operations.
> But when Metadata may be large - when LVM have a lot of logical volumes and it
> can take more space.
>
> I found in /etc/lvm/lvm.conf parameter pvmetadatasize = 255 secotors (default).
> What will if metadata will grow to more then 255 sectors?
>


If you plan to host lots of LVs within a single VG (in range of hundreds)
use i.e. 'pvcreate --metadatasize 5M'
(i.e. ~7000 linear single segment LVs  takes around 2.2MB and you need space 
for at least 2 metadatas to fit in)

What I'm not quite sure is your 'task' - what's the purpose ?
Do you want to do some 'sector' precise emulation of what lvm2 is doing by 
watching resuls of couple command with just subset of it's options ?

Isn't better to read man pages ?

Zdenek
