Date: Thu, 7 Nov 2019 11:54:43 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
In-Reply-To: <CACrcyf+7r6-SExT9wkBvN+LREZRHHux-3-0hrP5pkSqUL8z_Sw@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.1911071153470.31278@file01.intranet.prod.int.rdu2.redhat.com>
References: <CACrcyfJE2rEGTVOGTXGTf08w1Z-js8xTRshibCm+PuZNxp3OUA@mail.gmail.com>
	<5BDF90CF-72E7-44A0-8C78-7854B2B8996A@gmail.com>
	<29ad8317-4a55-f017-6a0b-c06bf40ccab8@redhat.com>
	<CACrcyfJxYvr7BC6Srts1bnNWLxsme8d3hjEQqYQyBz9sqbNp6g@mail.gmail.com>
	<alpine.LRH.2.02.1911051131360.14929@file01.intranet.prod.int.rdu2.redhat.com>
	<CACrcyf+7r6-SExT9wkBvN+LREZRHHux-3-0hrP5pkSqUL8z_Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="185206533-1804003513-1573145683=:31278"
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: =?ISO-8859-15?Q?Tomas_Dalebj=F6rk?= <tomas.dalebjork@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--185206533-1804003513-1573145683=:31278
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Tue, 5 Nov 2019, Tomas Dalebjörk wrote:

> Thanks,
> 
> That really helped me to understand how the snapshot works.
> Last question:
> - lets say that block 100 which is 1MB in size is in the cow device, and a write happen that wants to something or all data on that region of block 100.
> Than I assume; based on what have been previously said here, that the block in the cow device will be overwritten with the new changes.

Yes, the block in the cow device will be overwritten.

Mikulas

> Regards Tomas
--185206533-1804003513-1573145683=:31278--
