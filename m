Message-ID: <3DE3CCD4.4070502@mvista.com>
From: Steven Dake <sdake@mvista.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Hardware/Software comparaison of RAID with LVM on
 Linux
References: <B5B1F1162663D411BB8000508B691B20064F8E17@stimxch1.dev.mediagrif.com>
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
Date: Tue Nov 26 13:33:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I think you will find software RAID 5 to be a poor performer and would 
recommend raid 1 instead.  This gives you more integrity at the cost of 
some storage.  But hey, storage is cheap and data loss is expensive 
anyway :)

-steve

Jean Aumont wrote:

> Hi,
>
> I have been reading the Linux-LVM archives lately to find information 
> on RAID and LVM versus performance.
> I am interested in the report comparaison of software and hardware 
> raid with LVM on Linux that you created.
> Can you send me a copy of this report (.pdf if possible) ?
> I am planning of creatind a raid 5 with 4 x 80Gb disks.
>
> Thanks
>
> Jean Aumont
>
> Jaumont@mediagrif.com
> JeanAumont@videotron.ca
>
>
