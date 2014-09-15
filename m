Message-ID: <541689F2.8060709@redhat.com>
Date: Mon, 15 Sep 2014 08:40:50 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <4A8A2A3D96DD154BAD2EE08C0FFFBE5A815067BF@NDHEP50004.na.corp.mckesson.com>
In-Reply-To: <4A8A2A3D96DD154BAD2EE08C0FFFBE5A815067BF@NDHEP50004.na.corp.mckesson.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LE to PE mapping
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
To: Jack.Allen@mckesson.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 09/13/2014 12:02 AM, Allen, Jack wrote:
> Hello:
>         I need to find a command on RHEL 5.8 that will show each LE to
> PE mapping for a LV. All the command I have looked at so far (lvs, pvs,
> lvdisplay and pvdisplay) using various option only show the start PE and
> how many.

Try lvdisplay --maps (or pvdisplay --maps for the other way round).

>         Something else I need some clarification on is the PE size of
> 4MB and the strip size of 16K. Are the PEs not allocated as shown above
> in either example?
>  
>         Are the PE allocated in 4MB chunks?
>  

Yes, it's 4MB extent size by default if not speficied otherwise
using vgcreate/vgchange -s.

>         Then what does the 16K do?
>  

That is stripe size - the data  will be placed/rotated over disks
by this amount for each disk while the extent size is the basic unit
for mapping LV segments to the underlying disks. Of course, if you have,
for example, 2 stripes, you need an LV which is mapped to at least 2
different disks which also means at least 2 PEs to fulfill this condition
(otherwise, we couldn't map stripes onto different disks which would defeat
the essence of striping) - LVM does this rounding for you and
modifies the LV size automatically to make the stripe count and
LV mapping combination possible.

> -------------------------
> Jackson C. Allen
> McKesson Provider Technologies
> 5995 Windward Parkway
> Alpharetta, GA 30005
> (404) 338-2023
> _Jack.Allen@McKesson.com_ <mailto:Jack.Allen@McKesson.com>
> Confidentiality Notice: This e-mail message, including any attachments,
> is for the sole use of the intended recipient(s) and may contain
> confidential and privileged information.  Any unauthorized review, use,
> disclosure or distribution is prohibited.  If you are not the intended
> recipient, please contact the sender by reply e-mail and destroy all
> copies of the original message.
>  
>  
>  
>  
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


-- 
Peter
