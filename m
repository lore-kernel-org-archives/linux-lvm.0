Date: Thu, 27 Sep 2001 14:27:16 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Cannot create LV beyond 16GB in size?
Message-ID: <20010927142716.G808@tykepenguin.com>
References: <85063BBE668FD411944400D0B744267A8885C7@AUSMAIL>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85063BBE668FD411944400D0B744267A8885C7@AUSMAIL>; from austin@coremetrics.com on Tue, Sep 25, 2001 at 12:01:18PM -0500
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Sep 25, 2001 at 12:01:18PM -0500, Gonyou, Austin wrote:
> I've made 3 partitions. /dev/hdd1 /dev/hdd2 /dev/hdb9. 
> I'm going to stripe them and then use all available size. 
> When I do lvcreate, it won't let me go above 16G. Whats up with that?
> Kernel 2.4.10
> LVM 1.0 tools. 

BTW: don't stripe across /dev/hdd1 & /dev/hdd2 or performance will
be spectacularly bad !

You should only stripe across different disks and, ideally, different
controllers.

patrick
