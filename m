From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] lvm/devfs bug?
Message-ID: <20030408203324.A13056@uk.sistina.com>
References: <1049829705.2312.16.camel@rich>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1049829705.2312.16.camel@rich>; from rich@storix.com on Tue, Apr 08, 2003 at 12:21:45PM -0700
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Apr  8 14:33:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Apr 08, 2003 at 12:21:45PM -0700, Rich Turner wrote:
> the entire disk /dev/sda1
> # pvcreate -ff -v /dev/sda1
> pvcreate --device "/dev/sda" has a partition table
> # dd if=/dev/zero of=/dev/sda bs=1024 count=10
> # blockdev --rereadpt /dev/sda
> # sfdisk -R /dev/sda1
 
Confusion between
  /dev/sda  and
  /dev/sda1 ?

Alasdair
-- 
agk@uk.sistina.com
