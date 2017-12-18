Date: Mon, 18 Dec 2017 16:55:15 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20171218165515.GA22488@agk-dp.fab.redhat.com>
References: <CAM2wQBucairMqzmBb8+g4Lw06mvYKUwp0-x3aguwXpHQNPsNew@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAM2wQBucairMqzmBb8+g4Lw06mvYKUwp0-x3aguwXpHQNPsNew@mail.gmail.com>
Subject: Re: [linux-lvm] lvm filter not ignoring block device
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
To: Thanos Makatos <thanos.makatos@onapp.com>
Cc: linux-lvm@redhat.com

On Mon, Dec 18, 2017 at 04:48:19PM +0000, Thanos Makatos wrote:
>      filter = [ "r|/dev/mapper/foo7|" ]

Try setting global_filter.

Alasdair
