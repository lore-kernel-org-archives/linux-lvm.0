Date: Sat, 3 Apr 2010 15:29:11 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20100403142911.GZ11377@agk-dp.fab.redhat.com>
References: <4BB653C3.6080106@noir.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BB653C3.6080106@noir.com>
Subject: Re: [linux-lvm] confusing error message from lvm2
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
To: "K. Richard Pixley" <rich@noir.com>
Cc: linux-lvm@redhat.com

On Fri, Apr 02, 2010 at 01:29:55PM -0700, K. Richard Pixley wrote:
>  Path /dev/ACTION=_change_ no longer valid for device(252,7)

Have you customised any udev rules?

Monitor /dev carefully and investigate where those entries are coming from.

Aladsair
