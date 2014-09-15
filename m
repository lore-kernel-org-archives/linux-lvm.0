From: "Allen, Jack" <Jack.Allen@mckesson.com>
Date: Mon, 15 Sep 2014 14:28:44 +0000
Message-ID: <4A8A2A3D96DD154BAD2EE08C0FFFBE5A8150781C@NDHEP50004.na.corp.mckesson.com>
References: <4A8A2A3D96DD154BAD2EE08C0FFFBE5A815067BF@NDHEP50004.na.corp.mckesson.com>
	<541689F2.8060709@redhat.com>
In-Reply-To: <541689F2.8060709@redhat.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Peter:
	Thanks for the reply, but that does not show what I am looking for. The system has 16 PVs and the LV is stripped at 16K.

lvdisplay --maps, shows:
--- Segments ---
  Logical extent 0 to 1295:
    Type                striped
    Stripes             16
    Stripe size         16 KB
    Stripe 0:
      Physical volume   /dev/mapper/mpath17
      Physical extents  0 to 80
    Stripe 1:
      Physical volume   /dev/mapper/mpath18
      Physical extents  0 to 80
	~~~ ~~~ ~~~ ~~~ ~~~ ~~~ ~~~ ~~~ ~~~ ~~~

	This does not show exactly which LE/PE is where on each PV. I assume and did some test to determine if it was really stripped 16K on the first PV and then 16K on the next PV. But the output above does not indicate that. It could just as easily indicate that 1/16th (81) of the PE (8k blocks 0 to 162) were allocated on the first PV, and then (8k blocks 163 to 325) are on the second PV, etc. I wanted something that would show the LE/PE number to location on each PV.

	I understand because the LV was the first thing allocated on the PV, that the first 81 PE on each were used. So it just shows the range instead of each LE/PE.

	The output of pvdisplay --maps, just shows that PE extent 0 to 80 is LE 0 to 1295 range on each PV. So with the database application using 8K blocks I cannot really tell that 8K blocks 0 and 1 are on PV0 and 8k blocks 2 and 3 are on PV1, etc.. and then 8k blocks 32 and 33 are on PV0 just after 8k blocks 0 and 1.

	I wanted something like:
  Logical extent 0 to 1295:
    Type                striped
    Stripes             16
    Stripe size         16 KB
    Stripe 0:
      Physical volume   /dev/mapper/mpath17
      Physical extent  0
      Physical extent  15
      Physical extent  32
	~~~~~~~~ ~~~~~~  ~~~~

------------------------- 
Jackson C. Allen 
McKesson Provider Technologies 
5995 Windward Parkway 
Alpharetta, GA 30005 
(404) 338-2023 
Jack.Allen@McKesson.com 
Confidentiality Notice: This e-mail message, including any attachments, is for the sole use of the intended recipient(s) and may contain confidential and privileged information.� Any unauthorized review, use, disclosure or distribution is prohibited.� If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message.






-----Original Message-----
From: Peter Rajnoha [mailto:prajnoha@redhat.com] 
Sent: Monday, September 15, 2014 2:41 AM
To: Allen, Jack
Cc: LVM general discussion and development
Subject: Re: [linux-lvm] LE to PE mapping

On 09/13/2014 12:02 AM, Allen, Jack wrote:
> Hello:
>         I need to find a command on RHEL 5.8 that will show each LE to 
> PE mapping for a LV. All the command I have looked at so far (lvs, 
> pvs, lvdisplay and pvdisplay) using various option only show the start 
> PE and how many.

Try lvdisplay --maps (or pvdisplay --maps for the other way round).

>         Something else I need some clarification on is the PE size of 
> 4MB and the strip size of 16K. Are the PEs not allocated as shown 
> above in either example?
>  
>         Are the PE allocated in 4MB chunks?
>  

Yes, it's 4MB extent size by default if not speficied otherwise using vgcreate/vgchange -s.

>         Then what does the 16K do?
>  

That is stripe size - the data  will be placed/rotated over disks by this amount for each disk while the extent size is the basic unit for mapping LV segments to the underlying disks. Of course, if you have, for example, 2 stripes, you need an LV which is mapped to at least 2 different disks which also means at least 2 PEs to fulfill this condition (otherwise, we couldn't map stripes onto different disks which would defeat the essence of striping) - LVM does this rounding for you and modifies the LV size automatically to make the stripe count and LV mapping combination possible.

> -------------------------
> Jackson C. Allen
> McKesson Provider Technologies
> 5995 Windward Parkway
> Alpharetta, GA 30005
> (404) 338-2023
> _Jack.Allen@McKesson.com_ <mailto:Jack.Allen@McKesson.com> 
> Confidentiality Notice: This e-mail message, including any 
> attachments, is for the sole use of the intended recipient(s) and may 
> contain confidential and privileged information.  Any unauthorized 
> review, use, disclosure or distribution is prohibited.  If you are not 
> the intended recipient, please contact the sender by reply e-mail and 
> destroy all copies of the original message.
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
