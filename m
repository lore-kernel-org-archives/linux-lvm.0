From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] How to extend logical vol beyong 256GB
Message-ID: <20030715153023.H18605@zealot.blacknet.de>
References: <20030714022301.24234.qmail@web10001.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030714022301.24234.qmail@web10001.mail.yahoo.com>; from tazkoh@yahoo.com on Sun, Jul 13, 2003 at 07:23:01PM -0700
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
Date: Tue Jul 15 08:31:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jul 13 '03 at 19:23, Tazkoh wrote:
> I tried to extend the logical volume to 512GB (or more) but keeping
> getting this error message after executing this command lvextend
> -L512G /dev/vg01/lvol1
>  
> lvextend -- size 571473920 KB is larger than maximum VGDA kernel size
> of 268427264 KB
> 
> It seems like the logical volume is fixed at 256GB. How can I increase
> it?
You can't. Your VG was created with a too smal value for a PE. Your only
option is to remove the VG and create a new one.

BTW: 4. Read the archive *before* you post  -- this is a FAQ.
-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /                     (c) 2003 as GNU FDL 1.1
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
