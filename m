Message-ID: <3FE255CF.60101@sina.com>
From: more <more0401@sina.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 not function
References: <01139FC052A0D411900B00508B9535FC0F0D2589@ZCH07EXM04.corp.mot.com>
In-Reply-To: <01139FC052A0D411900B00508B9535FC0F0D2589@ZCH07EXM04.corp.mot.com>
Content-Transfer-Encoding: 7bit
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
Date: Thu Dec 18 19:37:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Li Yang,

You should run "vgchange -ay" to active all the LVs.
 

Li Yang-r58472 wrote:

> Hi,
>
>  
>
> I used LVM come with Redhat9 on my desktop computer.  Recent days I 
> want to upgrade my kernel to 2.6.0-test11 which needs LVM2 to work 
> with the device-mapper.  To be more up to date, I also recreated the 
> lvs to use lvm2 metadata.  But when I rebooted the computer, new 
> created lv can't mount.  It said it's not a valid block device.  So I 
> check the status with "lvm lvscan", it showed that these lv turned to 
> be inactive.  So I removed and recreated these lv.  Right after 
> creation, these lvs were ACTIVE and mountable, but after reboot, they 
> became inactive and unusable again.  Does anyone have clue?
>
>  
>
> --
>
> Leo Li
>
> Software Engineer
>
> Metrowerks -- a Motorola company
>
>  
>
> Office: +8610-65642272
>
> LeoLi@motorola.com
>
>  
>
