Message-ID: <4250BF28.7050704@cs.wisc.edu>
Date: Sun, 03 Apr 2005 23:14:32 -0500
From: Vivek Shrivastava <viveks@cs.wisc.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Relationship between Device Mapper and LVM2
References: <424CF437.1050607@cs.wisc.edu>
	<20050401151721.GC14307@agk.surrey.redhat.com>
In-Reply-To: <20050401151721.GC14307@agk.surrey.redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alasdair G Kergon <agk@redhat.com>
Cc: linux-LVM@redhat.com

Dear Sir,
         Thanks a lot for your timely response. It has helped us a lot. 
Just one last query. When a user program issues a read command from a 
file residing on a logical volume, how does the call actually gets 
mapped onto the hard disk. We believe that the kernel passes the 
"generic" command to the device mapper which then makes the final 
translation on the basis of mapping tables stored with it. We just 
wanted to be sure that LVM2 code does figure in the translation of the 
read requests from the user applications to the disk.

Thanking you in advance,
Vivek

Alasdair G Kergon wrote:
> On Fri, Apr 01, 2005 at 01:11:51AM -0600, Vivek Shrivastava wrote:
> 
>>Is LVM2 based on top of "device mapper" and uses "device mapper" as the 
>>underlying layer of support for writing /reading on the disk. Or Device 
>>mapper is placed between the kernel and the LVM2. Aslo if possible 
>>please tell us the entry point of kernel into the device mapper.
> 
>  
> 
>>Any suggestions on this topic will be highly appreciated.
> 
>  
> http://people.redhat.com/agk/talks/FOSDEM_2005/
> 
> esp.  http://people.redhat.com/agk/talks/FOSDEM_2005/img3.gif
>       http://people.redhat.com/agk/talks/FOSDEM_2005/img4.gif
> 
> Alasdair
