Subject: Re: [linux-lvm] determining lv from mount point 
In-Reply-To: Your message of "Tue, 23 Sep 2003 17:03:16 EDT."
             <2D4B6CD74137D4119A1100104BC6BCBF0BC585CB@dubntex006.qwest.net> 
From: Galen Seitz <galens@seitzassoc.com>
Message-Id: <20030923212003.AA3168F03@tinman.seitzassoc.com>
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
Date: Tue Sep 23 16:21:02 2003
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Montgomery, Kendal L <kendal.montgomery@qwest.com> wrote:

> 
> DEVICE=$(df ${1} | grep -v ^Filesystem | awk '{ print $1 }')
> 
> lvscan | grep ${DEVICE} > /dev/null 2>&1

Is using lvscan preferable to something like this
lvdisplay ${DEVICE} > /dev/null 2>&1

I'm currently using LVM, not LVM2 (sorry, I should have said that in the
first message).  Will this method work for LVM2 as well?

thanks,
galen
 
