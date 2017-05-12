Date: Fri, 12 May 2017 12:31:47 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20170512113147.GJ6155@agk-dp.fab.redhat.com>
References: <d8bf4829-6136-4f44-68b1-661b3b6f98cb@lasko.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d8bf4829-6136-4f44-68b1-661b3b6f98cb@lasko.pl>
Subject: Re: [linux-lvm] Sector size is assumed 512
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
Content-Transfer-Encoding: 7bit
To: Tomasz Lasko <tomasz@lasko.pl>
Cc: linux-lvm@redhat.com

It's been a linux kernel coding standard to treat the sector size as
always 512 bytes which we have adopted - regardless of the actual
hardware underneath.

S and s, and B and b mean the same.

Both userspace and kernel code automatically respects alignment
constraints imposed by the devices underneath, such as larger sector sizes.

Alasdair
