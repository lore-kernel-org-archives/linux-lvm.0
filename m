From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] about LVM-1.0.5 with SMP machine
Message-ID: <20020726071225.GP1139@tykepenguin.com>
References: <200207260425.g6Q4PpU26333@zeus.dtts.co.jp>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200207260425.g6Q4PpU26333@zeus.dtts.co.jp>
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
Date: Fri Jul 26 02:12:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jul 26, 2002 at 01:25:51PM +0900, Young Ui Park wrote:
> Hi all
> this is  my first post.
> 
> Now I'm planning to use LVM-1.0.5 with Redhat Linux 7.2(kernel-2.4.9-34).
> I found that there was not "fixed SMP locking bugs" 
> in the Changelog in LVM-1.0.5.(LVM-1.1rc1's Changelog has it)
> 
> I wonder if there is any problems in LVM-1.0.5 with SMP machine or fixed.
> 
> Does any body have any ideas with this ?

the "SMP locking bugs" fixes in 1.1rc1 relate to the writable snapshots that
were in 1.1 and so are not applicable to 1.0.x


LVM 1.0.5 should be fine on SMP (I'm running it here)

patrick
