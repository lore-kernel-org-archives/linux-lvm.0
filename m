Message-Id: <200308152304.h7FN4eo12611@mail.osdl.org>
From: markw@osdl.org
Subject: Re: [linux-lvm] lvcreate with a 52 drive volume
In-Reply-To: <20030815213131.G12107@uk.sistina.com>
MIME-Version: 1.0
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
Date: Fri Aug 15 18:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Ok, I've put the log file:

http://developer.osdl.org/markw/lvm2.log

Compressed:
http://developer.osdl.org/markw/lvm2.log.gz

Thanks,
Mark

On 15 Aug, Alasdair G Kergon wrote:
> On Fri, Aug 15, 2003 at 01:11:51PM -0700, markw@osdl.org wrote:
>> # lvcreate -i52 -I4 -l450996 -n mydata data_volume
>>   device-mapper ioctl cmd 9 failed: Invalid argument
>>   Couldn't load device 'data_volume-mydata'.
>>   Failed to activate new LV.
> 
> Mark, please would you enable the debug messages
> as described in the docs,
> viz. the following settings in lvm.conf:
> 
>   log {
>           file="/tmp/lvm2.log"
> 	  level=7
> 	  activation=1
>   }
> 
> then look at /tmp/lvm2.log after running the
> problematic command?
>  
>> device-mapper: couldn't split parameters
>> device-mapper: error adding target to table
> 
> The log file will show you the actual parameters 
> that were passed to device-mapper leading to
> the error messages.
>  
> Please put the log file(s) somewhere on the web and 
> post URL(s) to the list - or mail the log file(s)
> to me privately as a *compressed* attachment.
> 
> Alasdair
