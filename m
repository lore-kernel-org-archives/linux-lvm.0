From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM1 Snapshot
Message-ID: <20030401154759.GE1135@tykepenguin.com>
References: <20030401153516.59070.qmail@web14409.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030401153516.59070.qmail@web14409.mail.yahoo.com>
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
Date: Tue Apr  1 09:48:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Apr 01, 2003 at 07:35:16AM -0800, Aman Shahi wrote:
> 
> Using LVM1, how do I create a snapshot LV on a
> different physical device than the original LV
> 

Just add the PV name to the end of the command-line.

eg. if your original LV (/dev/vg/original) is on /dev/sdc1 and you want the
snapshot on /dev/sdj1 do:

lvcreate -L<size> -s -n snapshot /dev/vg/original /dev/sdj1

-- 

patrick
