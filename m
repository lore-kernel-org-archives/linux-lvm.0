Return-Path: <mason@suse.com>
Date: Fri, 20 Apr 2001 10:04:42 -0400
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] Re: LVM and DRDB
Message-ID: <944120000.987775482@tiny>
In-Reply-To: <20010420123252.D13067@cistron.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@sistina.com, linux-openlvm@nl.linux.org


On Friday, April 20, 2001 12:32:53 PM +0200 Wichert Akkerman
<wichert@cistron.nl> wrote:

> Previously Jens Axboe wrote:
>> Should work, at least LVM does proper stacking in 2.4.4-pre kernels and
>> I gope DRDB does too.
> 
> Is there any hope for 2.2 kernels?

Andrea's 2.2 kernels have a stacking patch, you want his
95_GFS-09_generic_map.patch.  It makes it possible to stack raid and lvm,
and is obvious enough that drdb shouldn't be hard to add.

-chris
