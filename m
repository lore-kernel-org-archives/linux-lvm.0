From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvextend doesn't extend the first time ...
Message-ID: <20031104082622.GB2412@tykepenguin.com>
References: <200311031840.36724.rotaticus@web.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200311031840.36724.rotaticus@web.de>
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
Date: Tue Nov  4 02:27:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Nov 03, 2003 at 06:40:36PM +0100, Kevin Buyting wrote:
> gentoo 1.4
> vanilla-sources 2.4.22
> lvm-user 1.0.7-r1
> 
> I am trying to extend my /dev/vg/lv01 (EXT3) by 3Gig's so i did a 
> 
> # lvextend -L +3G /dev/vg/lv01
> 
> then
> 
> # e2fsadm -L +3G /dev/vg/lv01 
> 
> *making chkfs reporting errors ... fixing them*
> ... and nothing happens ... then i did
> 
> # sync
> # mount /dev/vg/lv01 /mnt/somewhere
> # df 
> 
> says it's still 80G NOT 83G! so i try again *fearing the worst*
> 
> # e2fsadm -L +3G /dev/vg/lv01
> 
> *making chkfs ... resizing*
> again and get 6G more to my /dev/vg/lv01
> files are ok... *the best that could happen* 8))
> 
> the question is:
> how come it isn't extendet by 3G instead of 6G ?
> what am i doing wrong?
> just to know for the next time ...
> 
> thanks in advance for any advice
> 

You've misunderstood the commands. e2fsadm does the lvextend AND the
resize2fs. If you want to add 3Gig to your filesystem you should do EITHER:

e2fsadm -L+3G /dev/vg/lv01

OR

lvextend -L+3G /dev/vg/lv01
resize2fs /dev/vg0lv01


-- 

patrick
