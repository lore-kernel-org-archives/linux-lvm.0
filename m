Subject: Re: [linux-lvm] VA7100 LUN's not visible as disks
From: Andrew Patterson <andrew@fc.hp.com>
In-Reply-To: <615A249B783CD41192F400D0B747AC860B108E8C@hesse.bbn.hp.com>
References: <615A249B783CD41192F400D0B747AC860B108E8C@hesse.bbn.hp.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1055523285.25769.14.camel@lvadplx>
Mime-Version: 1.0
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
Date: Fri Jun 13 11:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: holgar.zecha@hp.com

On Thu, 2003-06-12 at 08:02, ZECHA,HOLGER (HP-Germany,ex1) wrote:
> Hello,
>  
> we want to connect a VA71000 to a DL380.
>  
> We se the current info in dmesg:
>  
> Attached scsi generic sg6 at scsi0, channel 0, id 0, lun 6,  type 31
> sg_attach: dev7=(21:7)
> 
> Any idea why this is sg and not sd ?
>  
Make sure the controllers are in Linux mode, you have the correct
connection type (direct/fabric), and you have the correct speed settings
(1GB/2GB).  You probably have the controllers in HP-UX mode which is the
default.

Andrew

> Thanks
>  
> Holger
-- 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   Andrew Patterson                          Voice:  (970) 898-3261
   Hewlett-Packard Company                   Email:  andrew@fc.hp.com
