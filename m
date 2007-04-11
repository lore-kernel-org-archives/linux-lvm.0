Received: from [172.16.44.152] (friday.brisbane.redhat.com [172.16.44.152])
	by pobox.brisbane.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l3B1uNFT017166
	for <linux-lvm@redhat.com>; Wed, 11 Apr 2007 11:56:23 +1000
Message-ID: <461C4047.606@gmail.com>
Date: Wed, 11 Apr 2007 11:56:23 +1000
From: David Robinson <zxvdr.au@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Noob Question - Which PV has the directory
References: <9b2be460704101224g647a8850ke7a5fc86bc79a27@mail.gmail.com>
In-Reply-To: <9b2be460704101224g647a8850ke7a5fc86bc79a27@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Randy reed wrote:
> I have an lvm that spans 3 pvs. I'm clearly having a hard drive problem
> because periodically there's a ticking sound and the drive light stays 
> solid
> and usually the system hangs. I know which directory makes this happen. But
> what I don't know is what hard drive is actually holding the directory 
> since
> its all one lvm. How can I determine this?

http://smartmontools.sourceforge.net/badblockhowto.html#lvm

good luck ;-)
