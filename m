Subject: Re: [linux-lvm] Alternate Pathing?
References: <DCBFB8E1BD8BD311A94D00A0C9CA44EA0CCD0E@storeage_nt>
	<20000724135818.A26581@mail.sistina.com>
	<20000724222446.A22101@jadzia.josv.com>
From: "Martin K. Petersen" <mkp@linuxcare.com>
Date: 24 Jul 2000 19:00:47 -0400
In-Reply-To: Jos Visser's message of "Mon, 24 Jul 2000 22:24:47 +0200"
Message-ID: <yq1lmyr6sm8.fsf@tyra.mkp.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jos Visser <josv@osp.nl>
Cc: Heinz Mauelshagen <mauelshagen@sistina.com>, Sergey Vichik <SVichik@store-age.com>, linux-lvm@msede.com

>>>>> "Jos" == Jos Visser <josv@osp.nl> writes:

Jos> Alternate pathing depends on the driver being able to decide that
Jos> a device probed via a particular controller is exactly the same
Jos> device as one that it has already seen through a controller that
Jos> has been probed earlier. I think it will be hard to decide on a
Jos> unique identifier that works for all types of block devices
Jos> (serial number?)

Fortunately, (at least in the FC-AL case) most vendors are smart
enough to assign UUIDs to their devices.  SCSI inquiries also help.
Finally, ext2 and XFS also have UUIDs in their superblocks.  Hence we
have several ways to get hints about the physical setup.

It is my intention to feature a pluggable driver scheme depending on
the physical device in the other end.  Also, some devices require to
be poked to initiate failover/failback.

Worst case (i.e. with incredibly stupid hardware) people will have to
specify the paths manually.

-- 
Martin K. Petersen, Principal Linux Consultant, Linuxcare, Inc.
mkp@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
