From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] mac-fdisk and 0x8e partitions for LVM
Message-ID: <20040115092056.GA2170@tykepenguin.com>
References: <1074115853.3983.24.camel@telecentro2>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1074115853.3983.24.camel@telecentro2>
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
Date: Thu Jan 15 04:21:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 14, 2004 at 07:30:53PM -0200, Leandro Guimar?es Faria Corcete Dutra wrote:
> 	mac-fdisk won't allow me to create a 0x8e partition, thus precluding
> LVM usage... any solutions in view?  Would pmac-fdisk or parted do the
> job?


If it's not using a PC partition table; and I suspect it isn't, being a mac,
then it doesn't matter what partition type you use.

LVM2 doesn't even check the partition type - it's only for information.
-- 

patrick
